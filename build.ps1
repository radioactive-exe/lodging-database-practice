# ~ These are the defaults for my docker setup while developing, and I will prompt you, the professor, to enter your database configuration and address for these SQL files to run in
param (
    [string]$ServerInstance,
    [string]$Database = "master",
    [string]$Username,
    [string]$Password,
    [string]$AuthChoice = "1"
)

$DevServer = "localhost,1434"
$DevUser = "sa"
$DevPass = "abc123!!!"

# ? If this is running in the dev environment, just populate the variables directly
if ($env:IN_DEV -eq "true") { 
    Write-Host "In Dev Environment. Avoiding warnings and populating default variables." -ForegroundColor Magenta
    $ServerInstance = $DevServer;
    $Username = $DevUser;
    $Password = $DevPass; 
}
# ? Otherwise, hello professor, this is you running the script. Deploy warnings and prompt as usual
else {    
    # ! First, a disclaimer/warning
    Write-Host "`nWARNING: This script will completely DROP and RECREATE the Airbnb database,
        scrapping all tables and data and repopulating them from scratch!" -ForegroundColor Red
    Read-Host "Press ENTER to confirm and rebuild, or Ctrl+C to abort"

    # ~ Now, the prompting for the data if it wasn't in the Dev environment

    # ? The server name/address that you want to use
    $ServerInstance = Read-Host "Enter SQL Server Instance [$DevServer]"
    if ([string]::IsNullOrWhiteSpace($ServerInstance)) { $ServerInstance = $DevServer }
    
    # ? The login type, either SQL Auth., using a username and password, or Microsoft/Windows Auth.
    Write-Host "`nSelect Login Type:"
    Write-Host "1) SQL Server Authentication (Docker / SA)"
    Write-Host "2) Windows Authentication (Local SQL Server / LocalDB)"
    $LoginType = Read-Host "Choose option (1 or 2) [1]"
    if ([string]::IsNullOrWhiteSpace($LoginType)) { $LoginType = "1" }
    
    # ? If we will use SQL Auth., populate the login and password
    if ($AuthChoice -eq "1") {
        $Username = Read-Host "Enter Username [$DevUser]"
        if ([string]::IsNullOrWhiteSpace($Username)) { $Username = $DevUser }
        
        $Password = Read-Host "Enter Password for $Username"
        if ([string]::IsNullOrWhiteSpace($Password)) { $Password = $DevPass }
    }
}

# * The arguments for the Invoke-Sqlcmd command used later
$SqlArgs = @{
    # * Either `localhost,1434` or the server you will use
    ServerInstance         = $ServerInstance
    # * Start at the master database to create Airbnb
    Database               = "master"
    # * It will be a server you (or I, in Dev) have set up, so.
    TrustServerCertificate = $true
    # * Stop if something goes wrong
    ErrorAction            = "Stop"
}

# ? Populate the username and password based on the above
# ? Either the default (with 1 also as a default) or the manually entered ones
if ($AuthChoice -eq "1") {
    $SqlArgs.Add("Username", $Username)
    $SqlArgs.Add("Password", $Password)
}
else {
    # ? Otherwise just use the already implicit/console Windows Auth
    Write-Host "Using Windows Auth." -ForegroundColor Yellow
}

# ? Checking if the SQL server module I packaged into this project has been imported 
Write-Host "`nChecking if the already-installed SQLServer PS module has been imported." -ForegroundColor Cyan;
if (-not (Get-Module sqlserver)) {
    Write-Host "Importing the already-installed SQLServer PS Module." -ForegroundColor Magenta;

    # ? Resolve the path and import the packaged module
    Get-ChildItem (Join-Path -Path $PSScriptRoot -ChildPath "scripting/ps_modules/SqlServer/*/SqlServer.psd1") | Import-Module;
} 
else {
    Write-Host "SQLServer module already imported." -ForegroundColor Green;
}

# ! Here, the Airbnb database gets wiped and recreated, and then we switch the focus/commands to it
Write-Host "`nWiping and Recreating Airbnb Database, then switching to it if not switched" -ForegroundColor Cyan
try {
    # ? The db.sql file gets executed (with its path resolved), wiping and recreating the database
    Invoke-Sqlcmd @SqlArgs -InputFile (Join-Path -Path $PSScriptRoot -ChildPath "creation_scripts/db.sql") -Verbose
    Write-Host "Airbnb Database recreated" -ForegroundColor Green
    # ? Switching to the newly created database
    $SqlArgs["Database"] = "Airbnb"
}
catch {
    Write-Error "Failed to rebuild database workspace. Error Details: $_"
    Exit
}

# ? The array, in order, of all the sql files that need to be run to rebuild the database
$DatabaseCreationFiles = @(
    "utils/functions.sql",
    "creation_scripts/schemas.sql",
    "creation_scripts/airbnb_users/user_tier.sql",
    "creation_scripts/airbnb_users/user_account.sql",
    "creation_scripts/airbnb_users/user_profile.sql"
)

Write-Host "`nBuilding Functions, Schemas, and tables..." -ForegroundColor Green

# ? Cycle through the files
foreach ($FilePath in $DatabaseCreationFiles) {
    # * The full absolute path of the file of the current iteration/index
    $FullPath = Join-Path -Path $PSScriptRoot -ChildPath $FilePath
    
    # ? If the file exists where it's supposed to
    if (Test-Path $FullPath) {
        Write-Host "Running creation file: $FilePath" -ForegroundColor Cyan
        try {
            # ? Invoke the file, and store all the PRINT's in the first stream
            $SqlPrints = Invoke-Sqlcmd @SqlArgs -InputFile $FullPath -Verbose 4>&1

            # ? If there are prints, cycle through them and then print them out in the Powershell window this is running in
            if ($SqlPrints) {
                foreach ($Message in $SqlPrints) {
                    Write-Host "   -> $($Message.ToString())" -ForegroundColor Gray
                }
            }
        }
        catch {
            Write-Error "Error in: $FilePath.`nReason: $_"
            break
        }
    } 
    else {
        Write-Error "File not found: $FilePath"
        break
    }
}
