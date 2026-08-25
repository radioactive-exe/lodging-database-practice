# ~ These are the defaults for my docker setup while developing, and I will prompt you, the professor, to enter your database configuration and address for these SQL files to run in
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
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
    Write-Host "Failed to rebuild database workspace. Error Details: $_" -ForegroundColor Red
    Exit
}

# ? The array, in order, of all the sql files that need to be run to rebuild the database
$DatabaseCreationFiles = @(

    <# =====================================
    =        Creating the Database         =
    ===================================== #>


    <# Functions and pre-tables
    ===================================== #>

    "utils/functions.sql",

    <# Schemas
    ===================================== #>

    "creation_scripts/schemas.sql",

    <# Location schema tables
    ===================================== #>

    "creation_scripts/airbnb_locations/locations.sql",

    <# Early schema tables
    ===================================== #>
    # ! These tables need to be made before most other things, or at least before the schemas above their own

    "creation_scripts/airbnb_reservations/reservation_payment_method_type.sql",

    <# Users schema tables
    ===================================== #>

    "creation_scripts/airbnb_users/user_tier.sql",
    "creation_scripts/airbnb_users/user_account.sql",
    "creation_scripts/airbnb_users/user_profile.sql",
    "creation_scripts/airbnb_users/user_languages.sql",
    "creation_scripts/airbnb_users/user_collections.sql",
    "creation_scripts/airbnb_users/user_billing_address.sql",
    "creation_scripts/airbnb_users/user_payment_method.sql",

    <# Property schema tables
    ===================================== #>

    "creation_scripts/airbnb_properties/property_type.sql",
    "creation_scripts/airbnb_properties/property.sql",
    "creation_scripts/airbnb_properties/property_images.sql",
    "creation_scripts/airbnb_properties/property_sector.sql",
    "creation_scripts/airbnb_properties/property_category.sql",
    "creation_scripts/airbnb_properties/property_attribute.sql",

    # ! This table from the users schema needs the property table already defined
    "creation_scripts/airbnb_users/user_properties_in_collections.sql"

    <# Reservation schema tables
    ===================================== #>

    "creation_scripts/airbnb_reservations/reservation_booking_status.sql",
    "creation_scripts/airbnb_reservations/reservation_payment_status.sql",
    "creation_scripts/airbnb_reservations/reservation_payment_purpose.sql",
    "creation_scripts/airbnb_reservations/reservation_booking.sql",
    "creation_scripts/airbnb_reservations/reservation_guests.sql",
    "creation_scripts/airbnb_reservations/reservation_payments.sql",

    <# Review schema tables
    ===================================== #>

    "creation_scripts/airbnb_reviews/review_property.sql",
    "creation_scripts/airbnb_reviews/review_criteria.sql",
    "creation_scripts/airbnb_reviews/review_user.sql"

)

# ? The array, in order, of all the sql files that need to be run to populate the database
$DatabasePopulationFiles = @(

    <# =====================================
    =       Populating the Database        =
    ===================================== #>

    "population_scripts/locations_data.sql",
    "population_scripts/user_account_and_profiles_data.sql",
    "population_scripts/user_billing_data.sql",
    "population_scripts/property_data.sql",
    "population_scripts/user_collection_data.sql",
    "population_scripts/booking_data.sql",
    "population_scripts/review_data.sql"
)

Write-Host "`nCompiling creation, population, and testing scripts..." -ForegroundColor Green

# ? Create the packaged folder (if it doesn't exist) then compile the creation and population scripts into one file each
# ? Also, assign to null to just silence any output

$null = New-Item -Path "packaged" -ItemType Directory -Force

# ? Clear the file of its current contents (if any)
Clear-Content -Path "packaged/database_creation.sql" -ErrorAction SilentlyContinue

# ? Cycle through the files
foreach ($file in $DatabaseCreationFiles) {
    # ? And compile them into one file with a GO batch delimiter and a blank line between them
    Get-Content -Path $file | Add-Content -Path "packaged/database_creation.sql"
    "`nGO`n" | Add-Content -Path "packaged/database_creation.sql"
}

# ? Clear the file of its current contents (if any)
Clear-Content -Path "packaged/database_population.sql" -ErrorAction SilentlyContinue

# ? Cycle through the files
foreach ($file in $DatabasePopulationFiles) {
    # ? And compile them into one file with a GO batch delimiter and a blank line between them
    Get-Content -Path $file | Add-Content -Path "packaged/database_population.sql"
    "`nGO`n" | Add-Content -Path "packaged/database_population.sql"
}


$PackagedFiles = @(
    "packaged/database_creation.sql",
    "packaged/database_population.sql"
)

foreach ($FilePath in $PackagedFiles) {
    # * The full absolute path of the file of the current iteration/index
    $FullPath = Join-Path -Path $PSScriptRoot -ChildPath $FilePath

    # ? Get and store a flag that represents which file we are running right now (creation or population)
    $WhichFileFlag = 0
    if ($FilePath -like '*creation*') { $WhichFileFlag = 1 }
    elseif ($FilePath -like '*population*') { $WhichFileFlag = 2 }

    # ? Based on which file we are running, populate the correct message
    $MessageToPrint = 'Running an odd extra file'
    if ($WhichFileFlag -eq 1) { $MessageToPrint = 'Building Functions, Schemas, and tables...' }
    elseif ($WhichFileFlag -eq 2) { $MessageToPrint = 'Populating tables...' }

    # ? Then write it
    Write-Host "`n$MessageToPrint" -ForegroundColor Green

    # ? If the file exists where it's supposed to
    if (Test-Path $FullPath) {
        Write-Host "`nRunning file: $FilePath" -ForegroundColor Cyan
        try {
            # ? Invoke the file, and store all the PRINT's in the first stream
            $SqlPrints = Invoke-Sqlcmd @SqlArgs -InputFile $FullPath -Verbose 4>&1

            # ? If there are prints, cycle through them and then print them out in the Powershell window this is running in
            if ($SqlPrints) {
                foreach ($Message in $SqlPrints) {
                    $Colour = 'Gray'

                    if ($Message -like '*function.') { $Colour = 'Green' }
                    elseif ($Message -like '*Schema.') { $Colour = 'DarkYellow' }
                    elseif ($Message -like '*LUT.') { $Colour = 'Blue' }
                    elseif ($Message -like '*trigger.') { $Colour = 'Yellow' }
                    elseif ($Message -like '*relationship table.') { $Colour = 'DarkMagenta' }

                    Write-Host "   -> $($Message.ToString())" -ForegroundColor $Colour
                }
            }
        }
        catch {
            Write-Host "`nError in: $FilePath.`nReason: $(($_ -split 'Msg')[0].Trim())" -ForegroundColor Red
            break
        }

        if ($WhichFileFlag -eq 1) {
            Write-Host "`n  /========================================/`n / All done building the Airbnb Database. / `n/========================================/  " -ForegroundColor Cyan -BackgroundColor DarkCyan
        }
        elseif ($WhichFileFlag -eq 2) {
            Write-Host "`n  /==========================================/`n / All done Populating the Airbnb Database. / `n/==========================================/  " -ForegroundColor Cyan -BackgroundColor DarkCyan
        }
    }
    else {
        Write-Host "File not found: $FilePath" -ForegroundColor Red
        break
    }
}
