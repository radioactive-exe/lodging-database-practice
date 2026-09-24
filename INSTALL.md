# Installation/Running Instructions

To create and populate the database, there are 2 primary ways of doing so.

## ⚠️ DISCLAIMERS

1. This implementation uses **_SQL Server 2025_**, and so relies on dialect- and update-specific features to run. It will most likely NOT run in older versions or other dialects than T-SQL.

2. Powershell updates and changes to the way modules can be installed has made method 2 a headache to run outside of `pwsh.exe` commands like in VSCode tasks. So just use method 1. I am leaving method 2 (with its incomplete instructions) as an homage to the late nights I spent trying to figure out powershell and SQLCMD for the first time. I am also removing the manually-installed SQL Server PS module from the repository because, as it stands, it is useless there.

## I. Running the Packaged SQL files

This is the simpler way of creating and populating the database. Initially, method 2 was the only one available, but I have since refactored the script to compile the files first and then run them, and so method 1 (this method) has become the simpler (update: and only)means of execution.

Note: To run the population script, you **must** have run the creation script right before, otherwise countless unique constraints will be violated. I.e. you cannot run the population script on an already-populated database.

The steps for this are very simple. In the `./packaged` subfolder, you will find 3 files, `database_creation.sql`, `database_population.sql`, and `database_testing.sql`. Run the files in this order in your connected database.

1. Run the `database_creation.sql` script to drop, recreate, and switch to the Airbnb database, and create all tables.
2. Run the `database_population.sql` script to populate all the tables created in step 1.
3. **_OPTIONAL:_** run the queries inside `database_testing.sql` to test different parts of the database - there are test cases per one/couple of tables, and 3 system test cases for the entire database.

~~That's it, really. Method 2 is just fancier, you can use it if you like (please use it at least once, I'm quite proud of it~~).

## ~~II. Running the PowerShell script~~

~~The alternative (and fancier, but overtly complex) method is to simply run the `build.ps1` located in the same folder as this installation instruction file.~~

1. ~~Run the `.ps1` file~~
2. ~~Follow the prompts to enter your database's host IP/location~~
3. ~~Follow the prompts to choose whether you are using SQL credentials (username/password) or Microsoft (native) authentication, and fill in the details if needed.~~
