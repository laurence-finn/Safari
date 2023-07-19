# Safari Across America

A website that tracks wildlife in the USA.

## Prerequisites

* You have a Windows/Linux/Mac machine.
* You have installed [Git](https://git-scm.com/downloads).
* You have administrative privileges (required for some installations).

## Local Environment Setup

Here's how you can set up your local environment to test Safari Across America's database and website:

### 1. Clone the GitHub repository

1. Open your terminal program (in Windows, right-click the Start button, then click `Terminal`)
2. Run the following command: `git clone https://github.com/laurence-finn/safari`

### 2. Install SQL Server Express

1. Download SQL Server Express from the [official Microsoft website](https://www.microsoft.com/en-us/sql-server/sql-server-downloads).
2. Run the installer and follow the prompts to install SQL Server Express.

### 3. Install SQL Server Management Studio (SSMS)

1. Download SSMS from the [official Microsoft website](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15).
2. Run the installer and follow the prompts to install SSMS.

### 4. Set Up the Database

1. Open SSMS.
2. Connect to your SQL Server Express instance.
3. In the toolbar, click `File` > `Open` > `File...` and select the database script file, which can be found in `.\Safari.Data\Scripts\WildlifeData.sql` (the root directory will depend on where you cloned the GitHub repository to)
4. Click `Execute` to run the script.
5. Click the `Refresh` button in the Object Explorer on the left-hand side.
6. `WildlifeData` should now appear when you expand the `Databases` folder.

### 5. Install Visual Studio

1. Download Visual Studio Community Edition from the [official Microsoft website](https://visualstudio.microsoft.com/downloads/).
2. Run the installer and follow the prompts to install Visual Studio.
3. When prompted, select the workloads `ASP.NET and web development` and `.NET desktop development`.

### 6. Load the Solution File

1. Open Visual Studio.
2. On the Welcome screen, click `Open a project or solution.`
3. Navigate to `Safari.sln` in the main directory of the cloned GitHub repository.

### 7. Run the Solution

1. In Visual Studio, select Safari.Web in the Solution Explorer, or in the dropdown at the top of the screen.
2. Press `F5` or click `Debug` > `Start Debugging`.
3. Click `OK` to any prompts concerning trusting digital certificates.
4. The website will open in a new browser tab. (Your browser may display a security warning, but this can be safely ignored.)

## Database Stored Procedures

To alter the database, use SSMS and execute any of the stored procedures located under `Programmability` > `Stored Procedures`. Note that removing Animal pictures requires deleting the files directly from the `images` folder in the Safari.Web project, in addition to removing the record from the database.

You can also modify the database by using custom create/update/delete queries, but this is not recommended, as it may result in unintended consequences.

## Admin Login

To test the admin features, click "Admin Login" at the top right of the screen and enter these credentials:
User: admin@safariamerica.com
Pass: 9q,tq:Bp=_~WwXq

## Contact

If you encounter any problems, please contact Laurence Finn at [laurence.c.finn@gmail.com](mailto:laurence.c.finn@gmail.com).
