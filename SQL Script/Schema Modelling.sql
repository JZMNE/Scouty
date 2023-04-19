IF NOT EXISTS (SELECT [name]
			FROM sys.databases
			WHERE [name] = 'Olympics')
EXEC ('Create DATABASE Olympics')
GO

USE Olympics;
GO

-- Creating an owner for the database
EXECUTE sp_changedbowner 'sa';
GO

-- Creating a dynamic schema for the database
IF NOT EXISTS (SELECT SCHEMA_NAME
			FROM INFORMATION_SCHEMA.SCHEMATA
			WHERE SCHEMA_NAME = 'stg')
EXEC ('CREATE SCHEMA stg');

IF NOT EXISTS (SELECT SCHEMA_NAME
			FROM INFORMATION_SCHEMA.SCHEMATA
			WHERE SCHEMA_NAME = 'dim')
EXEC ('CREATE SCHEMA dim');

IF NOT EXISTS (SELECT SCHEMA_NAME
			FROM INFORMATION_SCHEMA.SCHEMATA
			WHERE SCHEMA_NAME = 'f')
EXEC ('CREATE SCHEMA f');

IF NOT EXISTS (SELECT SCHEMA_NAME
			FROM INFORMATION_SCHEMA.SCHEMATA
			WHERE SCHEMA_NAME = 'rpt')
EXEC ('CREATE SCHEMA rpt');
GO


--/******************** Importing the raw Data *************************/
--IF NOT EXISTS (SELECT *
--			FROM INFORMATION_SCHEMA.TABLES
--			WHERE TABLE_CATALOG = 'Olympics' 
--				and TABLE_SCHEMA = 'stg' 
--				and TABLE_NAME = 'ath')
--EXECUTE('CREATE TABLE [stg].[ath](
--	[Age] [bigint] NULL,
--	[Height] [float] NULL,
--	[Weight] [float] NULL,
--	[Year] [bigint] NULL,
--	[Name] [varchar](85) NULL,
--	[Sex] [varchar](1) NULL,
--	[Team] [varchar](32) NULL,
--	[NOC] [varchar](3) NULL,
--	[Games] [varchar](11) NULL,
--	[Season] [varchar](6) NULL,
--	[City] [varchar](14) NULL,
--	[Sport] [varchar](25) NULL,
--	[Event] [varchar](100) NULL,
--	[Medal] [varchar](6) NULL
--) ON [PRIMARY]')
--GO

--TRUNCATE TABLE stg.[ath]
--GO

--BULK INSERT stg.ath
--FROM 'C:\Users\HP\Downloads\Olympic_Athletes\clean_athlete.csv'  -- Ensure the filepath
--WITH (
--  FIRSTROW = 2,
--  FIELDTERMINATOR = ',',
--  ROWTERMINATOR = '\n'
--);
--GO


/*
-- Total number of records (rows)
SELECT COUNT (*) as 'Count'
FROM stg.[athlete]
-- 199,462 rows
GO   

-- Total Number of features(columns)
SELECT COUNT(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'athlete'
--14 Columns
GO  


-- Showing Top 10 records of the data
SELECT TOP 10 *
FROM stg.[athlete]
GO
*/

GO

/****  To create a dimensions / LookUp Table  ****/

-- Age Dimension
DROP TABLE IF EXISTS dim.Age;

SELECT CAST (Age AS INTEGER) as Age,
	(CASE WHEN Age BETWEEN 0 AND 14 THEN 'Under 15s'
	WHEN Age BETWEEN 15 and 24 THEN 'Youth'
	WHEN Age BETWEEN 25 and 64 THEN 'Adults'
	WHEN Age >= 65  THEN 'Seniors'
	ELSE 'Unknown'
	END) as 'Age_Group'
INTO dim.Age --Uncomment to run to create the table
FROM stg.[athlete]
GROUP BY Age
ORDER BY 1
--60 rows
GO 

-- Event Dimension
DROP TABLE IF EXISTS dim.[Event];

SELECT ROW_NUMBER() OVER (ORDER BY [Event] ASC) as 'Event_Id'
	,[Event]
INTO dim.[Event]
FROM stg.[athlete]
GROUP BY [Event]
GO
--486 rows

-- Game Dimension
DROP TABLE IF EXISTS dim.Games

SELECT ROW_NUMBER() OVER (ORDER BY [Year] ASC)* 10 as 'Game_Id'
	,[Year]
	,Season
	,Games
	,City
INTO dim.Games --Uncomment to run to create the table
FROM stg.[athlete]
GROUP BY [Year]
	,Season
	,Games
	,City
GO

/**********************************************************Run Only Once*****************************************/
/*
--Updating the last 3 Olympics
INSERT INTO dim.Games(Game_Id, [Year], Season, Games, City)
VALUES (290,2018,'Winter','2018 Winter', 'Pyeongchang')
	 ,(300,2020,'Summer','2020 Summer', 'Tokyo')
	 ,(310,2022,'Winter','2022 Winter', 'Beijing')
*/
/**********************************************************Run Only Once*****************************************/

-- Medal Dimension
DROP TABLE IF EXISTS dim.Medal;

SELECT (CASE
		WHEN Medal = 'Bronze' THEN 3
		WHEN Medal = 'Silver' THEN 2
		WHEN Medal = 'Gold' THEN 1
		WHEN Medal = 'None' THEN 0
	END)  as Medal_Id
	,(CASE
		WHEN Medal = 'Bronze' THEN 'B'
		WHEN Medal = 'Silver' THEN 'S'
		WHEN Medal = 'Gold' THEN 'G'
		WHEN Medal = 'None' THEN 'N'
	END) as Medal_Code
	,Medal
INTO dim.Medal
FROM [stg].[athlete]
GROUP BY Medal
ORDER BY 1
GO


/***************** Load the Country file ****************************/
IF NOT EXISTS (SELECT *
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_CATALOG = 'Olympics' 
				and TABLE_SCHEMA = 'stg' 
				and TABLE_NAME = 'Country')
EXECUTE(
	'CREATE TABLE [stg].[Country](
	[NOC] [varchar](50) NULL,
	[Region] [varchar](50) NULL
) ON [PRIMARY]')
GO

TRUNCATE TABLE stg.[Country]
GO

BULK INSERT stg.Country
FROM 'C:\Users\HP\Downloads\Olympic_Athletes\country.csv'  -- Ensure the filepath
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Skip the first row if it contains column headers
)
GO


-- Country/NOC Dimension
DROP TABLE IF EXISTS dim.NOC;

SELECT ROW_NUMBER() OVER (ORDER BY NOC ASC) + 10000 as 'NOC_Id'
	,NOC as 'NOC_Code'
	,Region as 'NOC_Region'
INTO dim.NOC --Uncomment to run to create the table
FROM stg.Country;
GO

-- Participant Dimension
DROP TABLE IF EXISTS dim.Participant;

SELECT ROW_NUMBER() OVER (ORDER BY [Name]) as 'ID' 
	,[Name]
INTO dim.Participant
FROM stg.[athlete]
GROUP BY [Name]
ORDER BY 1
GO

-- Sex Dimension
DROP TABLE IF EXISTS dim.Sex;

SELECT ROW_NUMBER() OVER (ORDER BY Sex ASC) + 1000 as Sex_Id
	,Sex as 'Sex_Code'
	,IIF(Sex = 'F','Female', 'Male') as Sex
INTO dim.Sex   --Uncomment to run to create the table
FROM stg.[athlete]
GROUP BY Sex
--2 rows
GO 

-- Sport Dimension
DROP TABLE IF EXISTS dim.Sport;

SELECT DENSE_RANK() OVER ( ORDER BY Sport ASC) as 'Sport_Id'
	,Sport
INTO dim.Sport
FROM stg.[athlete]
GROUP BY Sport 
GO

/**** Alter dimension table to make primary key nulls *****/
-- Age
ALTER TABLE dim.Age 
ALTER COLUMN Age INT NOT NULL; 
GO

-- Event
ALTER TABLE dim.[Event]
ALTER COLUMN Event_Id INT NOT NULL; 
GO

-- Games
ALTER TABLE dim.Games
ALTER COLUMN Game_Id INT NOT NULL; 
GO

-- Medal
ALTER TABLE dim.Medal 
ALTER COLUMN Medal_Id INT NOT NULL;
GO

-- NOC 
ALTER TABLE dim.NOC
ALTER COLUMN NOC_Id INT NOT NULL;
GO

--Participant
ALTER TABLE dim.Participant
ALTER COLUMN ID INT NOT NULL;
GO

-- Sex
ALTER TABLE dim.Sex 
ALTER COLUMN Sex_Id INT NOT NULL;
GO

-- Sport
ALTER TABLE dim.Sport 
ALTER COLUMN Sport_Id INT NOT NULL;
GO

/******************** Adding Primary Key Constraint ***************/
-- Age
IF NOT EXISTS (SELECT CONSTRAINT_NAME
			FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
			WHERE CONSTRAINT_NAME = 'PK_Age')
EXECUTE('ALTER TABLE dim.Age ADD CONSTRAINT PK_Age  PRIMARY KEY (Age)')


-- Event
IF NOT EXISTS (SELECT CONSTRAINT_NAME
			FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
			WHERE CONSTRAINT_NAME = 'PK_Event')
EXECUTE('ALTER TABLE dim.[Event] ADD CONSTRAINT PK_Event PRIMARY KEY (Event_Id)')
GO

-- Games
IF NOT EXISTS (SELECT CONSTRAINT_NAME
			FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
			WHERE CONSTRAINT_NAME = 'PK_Games')
EXECUTE('ALTER TABLE dim.Games ADD CONSTRAINT PK_Games PRIMARY KEY ([Game_Id])')
GO

-- Medal
IF NOT EXISTS (SELECT CONSTRAINT_NAME
			FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
			WHERE CONSTRAINT_NAME = 'PK_Medal')
EXECUTE('ALTER TABLE dim.Medal ADD CONSTRAINT PK_Medal PRIMARY KEY ([Medal_Id])')
GO

-- NOC 
IF NOT EXISTS (SELECT CONSTRAINT_NAME
			FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
			WHERE CONSTRAINT_NAME = 'PK_NOC')
EXECUTE('ALTER TABLE dim.NOC ADD CONSTRAINT PK_NOC PRIMARY KEY ([NOC_Id])');
GO

--Participant
IF NOT EXISTS (SELECT CONSTRAINT_NAME
			FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
			WHERE CONSTRAINT_NAME = 'PK_Part')
EXECUTE('ALTER TABLE dim.Participant ADD CONSTRAINT PK_Part PRIMARY KEY ([ID])')
GO

-- Sex
IF NOT EXISTS (SELECT CONSTRAINT_NAME
			FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
			WHERE CONSTRAINT_NAME = 'PK_Sex')
EXECUTE('ALTER TABLE dim.Sex ADD CONSTRAINT PK_Sex PRIMARY KEY ([Sex_Id])')
GO
-- Sport
IF NOT EXISTS (SELECT CONSTRAINT_NAME
			FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
			WHERE CONSTRAINT_NAME = 'PK_Sport')
EXECUTE('ALTER TABLE dim.Sport ADD CONSTRAINT PK_Sport PRIMARY KEY ([Sport_Id])')
GO


/********************* Creating an all Numeric Fact table *****************/
DROP TABLE IF EXISTS f.Olympics;

SELECT par.ID
	, sx.Sex_Id
	, age.Age
	, ROUND (oly.[Height], 1) as 'Height'
	, ROUND (oly.[Weight], 1) as 'Weight'
	, noc.NOC_Id
	, oly.[Year]
	, gam.Game_Id
	, spt.Sport_Id
	, evt.Event_Id
	, CAST (med.Medal_Id AS INTEGER) as 'Medal_ID'
-- Fact
	,ROW_NUMBER() OVER (PARTITION BY par.ID ORDER BY par.ID) as 'PCnt'
	,1 as 'Count'
INTO f.Olympics
FROM stg.[athlete] oly
	INNER JOIN dim.Age age
		ON oly.Age = age.Age
	INNER JOIN dim.Games gam
		ON oly.Games = gam.Games 
			AND oly.City = gam.City 
	INNER JOIN dim.NOC noc
		ON oly.NOC = noc.NOC_Code
	INNER JOIN dim.Participant par
		ON oly.[Name] = par.[Name]
	INNER JOIN dim.Sex sx
		ON oly.Sex = sx.Sex_Code
	INNER JOIN dim.Sport spt
		ON oly.Sport = spt.Sport
	INNER JOIN dim.[Event] evt
		ON oly.[Event] = evt.[Event]
	INNER JOIN dim.Medal med
		ON oly.Medal = med.Medal
ORDER BY 1
-- 199,462 rows



/********************** Adding Other Fact Tables *******************************/
-- HostingCost
IF NOT EXISTS (SELECT *
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_CATALOG = 'Olympics' 
				and TABLE_SCHEMA = 'stg' 
				and TABLE_NAME = 'Cost')
EXECUTE(
	'CREATE TABLE [stg].[Cost](
	[Games] [nchar](50) NULL,
	[Year] [int] NULL,
	[Country] [nchar](50) NULL,
	[Type] [nchar](20) NULL,
	[Events] [int] NULL,
	[Athletes] [int] NULL,
	[Cost] [numeric](20, 0) NOT NULL
) ON [PRIMARY]')
GO

TRUNCATE TABLE stg.[Cost]

BULK INSERT stg.Cost
FROM 'C:\Users\HP\Downloads\Olympic_Athletes\Cost_per_olympic.csv'  -- Ensure the filepath
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Skip the first row if it contains column headers
);

-- Cost
DROP TABLE IF EXISTS f.Cost

SELECT gm.Game_Id
	,ct.[Events] as 'Event_Count'
	,ct.Athletes as 'Athlete_Count'
	,ct.Cost as 'Hosting_Cost'
INTO f.Cost
FROM stg.Cost ct
	INNER JOIN dim.Games gm
	ON ct.Games = gm.City AND ct.[Year] = gm.[Year]
;
GO

-- Medal Cost
IF NOT EXISTS (SELECT *
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_CATALOG = 'Olympics' 
				and TABLE_SCHEMA = 'stg' 
				and TABLE_NAME = 'MedalCost')
EXECUTE(
	'CREATE TABLE [stg].[MedalCost](
	[Countries] [varchar](50) NULL,
	[Medal] [varchar](50) NULL,
	[Value] [varchar](50) NULL
) ON [PRIMARY]')
GO

TRUNCATE TABLE stg.[MedalCost]

BULK INSERT stg.MedalCost
FROM 'C:\Users\HP\Downloads\Olympic_Athletes\MedalCost.csv'  -- Ensure the filepath
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Skip the first row if it contains column headers
);

-- Medal Cost
DROP TABLE IF EXISTS f.Medal_Cost;

SELECT nc.NOC_Id
	,md.Medal_Id
	,mc.[Value] as 'Price'
INTO f.Medal_Cost
FROM stg.MedalCost mc
INNER JOIN dim.NOC nc
ON mc.countries = nc.NOC_Region
INNER JOIN dim.Medal md
ON mc.Medal = md.Medal


-- Doping Fact Table
IF NOT EXISTS (SELECT *
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_CATALOG = 'Olympics' 
				and TABLE_SCHEMA = 'stg' 
				and TABLE_NAME = 'doping_athlete')
EXECUTE(
	'CREATE TABLE [stg].[doping_athlete](
	[Year] [bigint] NULL,
	[Olympics] [varchar](6) NULL,
	[Name] [varchar](27) NULL,
	[Country] [varchar](28) NULL,
	[Substance] [varchar](46) NULL,
	[Medals] [bigint] NULL,
	[Sex] [varchar](1) NULL
) ON [PRIMARY]')
GO

TRUNCATE TABLE stg.[doping_athlete]

BULK INSERT stg.doping_athlete
FROM 'C:\Users\HP\Downloads\Olympic_Athletes\doping_athlete.csv'  -- Ensure the filepath
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Skip the first row if it contains column headers
    );

GO

DROP TABLE IF EXISTS f.Doped_Athlete;

SELECT *
INTO f.Doped_Athlete
FROM stg.doping_athlete
GO