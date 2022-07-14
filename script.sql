USE [Patika-Employee]
GO
/****** Object:  UserDefinedFunction [dbo].[CalculateBirthdate]    Script Date: 14/07/2022 20:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[CalculateBirthdate](@age int)  
RETURNs int
AS 
begin
declare @birthdate int
 set @birthdate = year(GETDATE()) - @age;
 return @birthdate
end
GO
/****** Object:  UserDefinedFunction [dbo].[GetMaxAge]    Script Date: 14/07/2022 20:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetMaxAge]()  
RETURNs int
AS 
begin
declare @max_age int
 set @max_age = (select max(age) from Employee);
 return @max_age
end
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 14/07/2022 20:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[FirstName] [varchar](255) NULL,
	[Age] [int] NULL,
	[City] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetEmployyesUnder65]    Script Date: 14/07/2022 20:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetEmployyesUnder65]()  
RETURNS TABLE  
AS  
RETURN  
    SELECT * FROM Employee WHERE Age<65
GO
/****** Object:  View [dbo].[FullNameOnly]    Script Date: 14/07/2022 20:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FullNameOnly] 
AS SELECT FirstName, LastName FROM Employee;
GO
/****** Object:  Table [dbo].[Department]    Script Date: 14/07/2022 20:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[EmployeeId] [int] NULL,
	[CreationDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (1, N'Kristeen', 68, CAST(N'2001-01-16' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (2, N'Catharine', 96, CAST(N'2000-03-08' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (3, N'Rodolfo', 61, CAST(N'1975-07-04' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (4, N'Keneth', 48, CAST(N'2001-09-03' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (5, N'Eugenia', 15, CAST(N'2000-07-02' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (6, N'Tonita', 98, CAST(N'1973-04-14' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (7, N'Gracie', 76, CAST(N'1994-05-25' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (8, N'Emmy', 97, CAST(N'1998-05-05' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (9, N'Alena', 27, CAST(N'2001-10-04' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (11, N'Lawanda', 89, CAST(N'2007-09-14' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (13, N'Emerald', 35, CAST(N'2012-07-20' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (14, N'Todd', 57, CAST(N'1974-08-15' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (15, N'Tashina', 94, CAST(N'2008-07-27' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (16, N'Mariko', 69, CAST(N'2004-06-21' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (17, N'Ming', 22, CAST(N'2006-10-27' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (18, N'Laquita', 73, CAST(N'1993-05-19' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (20, N'Madie', 92, CAST(N'1985-07-31' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (21, N'Pamelia', 25, CAST(N'1995-07-21' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (22, N'Daryl', 26, CAST(N'1978-05-28' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (24, N'Mellie', 96, CAST(N'2010-01-07' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (26, N'Kellee', 88, CAST(N'2020-12-01' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (28, N'Sonny', 23, CAST(N'2022-02-26' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (31, N'Francina', 37, CAST(N'2011-06-07' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (32, N'Ellie', 41, CAST(N'2022-04-30' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (33, N'Marylin', 69, CAST(N'1988-11-07' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (34, N'Ria', 16, CAST(N'1974-04-25' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (36, N'Giovanna', 54, CAST(N'1988-06-21' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (38, N'Felicidad', 41, CAST(N'1973-06-08' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (39, N'Delmy', 18, CAST(N'1982-09-22' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (41, N'Marlys', 71, CAST(N'1988-06-30' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (42, N'Rina', 30, CAST(N'1983-07-07' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (43, N'Ed', 96, CAST(N'2013-04-09' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (44, N'Esteban', 62, CAST(N'1980-02-29' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (45, N'Basilia', 32, CAST(N'2012-06-19' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (47, N'Hayley', 41, CAST(N'2001-09-29' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (48, N'Anne', 26, CAST(N'1974-11-13' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (50, N'Russ', 9, CAST(N'1970-06-26' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (51, N'Karan', 35, CAST(N'1991-07-10' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (53, N'Conception', 86, CAST(N'2013-11-02' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (54, N'Rosella', 77, CAST(N'1993-11-10' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (55, N'Kandace', 68, CAST(N'2020-01-28' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (56, N'Victoria', 13, CAST(N'1981-08-04' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (57, N'Kali', 18, CAST(N'1977-10-27' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (58, N'Gerard', 47, CAST(N'1992-03-29' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (59, N'Isaac', 8, CAST(N'1974-08-08' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (60, N'Geraldine', 51, CAST(N'1996-10-14' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (61, N'Kasha', 5, CAST(N'1972-12-30' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (63, N'Katelin', 92, CAST(N'2015-02-01' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (64, N'Lee', 41, CAST(N'1986-12-23' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (65, N'Emiko', 31, CAST(N'1981-07-04' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (66, N'Joanna', 25, CAST(N'2001-12-14' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (67, N'Liza', 9, CAST(N'1985-06-23' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (68, N'Willetta', 16, CAST(N'1981-01-24' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (69, N'Mamie', 97, CAST(N'2010-06-07' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (70, N'Marceline', 68, CAST(N'1981-03-21' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (71, N'Marinda', 48, CAST(N'2001-04-29' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (72, N'Laquanda', 79, CAST(N'2018-09-27' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (73, N'Stefany', 30, CAST(N'2019-06-28' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (74, N'Buster', 37, CAST(N'2005-03-13' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (76, N'Marna', 78, CAST(N'2019-08-13' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (77, N'Annice', 3, CAST(N'1989-08-07' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (78, N'Lavern', 98, CAST(N'1987-10-20' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (79, N'Beverly', 70, CAST(N'2022-02-24' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (80, N'Joyce', 20, CAST(N'1977-11-25' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (81, N'Lincoln', 98, CAST(N'1993-03-15' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (82, N'Jeramy', 13, CAST(N'1973-08-01' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (83, N'Milan', 9, CAST(N'1987-11-17' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (84, N'Mose', 89, CAST(N'2020-08-29' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (86, N'Shandra', 30, CAST(N'1993-07-08' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (87, N'Boris', 84, CAST(N'2021-03-13' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (89, N'Marcelina', 88, CAST(N'2019-04-29' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (90, N'Marcelina', 29, CAST(N'2018-09-12' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (91, N'Norberto', 40, CAST(N'1971-04-13' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (92, N'Sheena', 81, CAST(N'1976-03-22' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (93, N'Aja', 13, CAST(N'1993-08-11' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (94, N'Harvey', 13, CAST(N'2019-09-19' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (95, N'Velma', 26, CAST(N'2004-09-13' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (97, N'Syble', 66, CAST(N'1984-02-13' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (98, N'Dori', 11, CAST(N'1970-03-18' AS Date))
INSERT [dbo].[Department] ([ID], [Name], [EmployeeId], [CreationDate]) VALUES (100, N'Krystina', 11, CAST(N'1990-07-23' AS Date))
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (1, N'Ramsey', N'Paulene', 43, N'Punta Gorda')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (2, N'Lawton', N'Cathrine', 89, N'Sunnyvale')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (3, N'Greenberg', N'Hector', 73, N'Fort Worth')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (4, N'Bruno', N'Isis', 40, N'Saint Louis')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (5, N'Bernstein', N'Samual', 19, N'Torrance')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (6, N'Rooney', N'Toshiko', 73, N'Mesquite')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (8, N'Haney', N'Tawnya', 19, N'Columbus')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (9, N'Mcelroy', N'Cherish', 44, N'Medford')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (11, N'Wasson', N'Bruno', 49, N'Havre de Grace')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (12, N'Pino', N'Sammie', 51, N'Newport News')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (13, N'Keeney', N'Reita', 81, N'Salem')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (14, N'Kerns', N'Jonelle', 34, N'Anaheim')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (15, N'Coughlin', N'Chanell', 56, N'Layton')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (16, N'Bowden', N'Melanie', 76, N'Oakland')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (17, N'Centeno', N'Sanda', 55, N'Huntsville')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (18, N'Joy', N'Samira', 63, N'Kennewick')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (19, N'Livingston', N'Jazmin', 52, N'Vero Beach')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (20, N'Coleman', N'Lashawn', 46, N'Port Saint Lucie')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (21, N'Mahoney', N'Jennine', 97, N'Berkeley')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (22, N'Withers', N'Lelah', 97, N'Melbourne')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (23, N'Jaramillo', N'Roxann', 59, N'Orlando')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (25, N'Partridge', N'Shawnee', 41, N'Hesperia')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (26, N'Roman', N'Kandice', 23, N'Jersey City')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (27, N'Meadows', N'Jen', 35, N'Beaumont')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (29, N'Couch', N'Tomasa', 25, N'Orem')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (30, N'Martins', N'Gerry', 68, N'Bethlehem')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (31, N'Hannon', N'Leonora', 84, N'Saint Petersburg')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (32, N'New', N'Lorriane', 33, N'Chattanooga')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (33, N'Dabney', N'Calandra', 34, N'Bradenton')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (34, N'Healy', N'Malcom', 37, N'Houma')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (35, N'Foret', N'Harold', 33, N'Aurora')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (36, N'Loy', N'Joanie', 95, N'Santa Barbara')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (37, N'Atwood', N'Mikaela', 67, N'Charlotte')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (38, N'Geer', N'Jada', 74, N'Columbia')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (39, N'Sandlin-Waller', N'Darwin', 67, N'Jefferson')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (40, N'Brewer', N'Sandi', 34, N'Grayslake')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (41, N'Durand', N'Chantal', 63, N'Bridgeport')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (45, N'Walden', N'Jacqueline', 25, N'Normal')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (47, N'Henderson', N'Velva', 48, N'Scottsdale')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (48, N'Williford', N'Shea', 75, N'Columbus')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (49, N'Olive', N'Richie', 56, N'College Station')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (50, N'Pomeroy', N'Marquitta', 70, N'Omaha')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (51, N'Poe', N'Beckie', 95, N'Monterey')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (52, N'Shinn', N'Philomena', 79, N'Memphis')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (53, N'Shepherd', N'Shawanna', 88, N'Hartford')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (54, N'Fanning', N'Zina', 91, N'St. Petersburg')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (55, N'Reis', N'Lai', 35, N'Richmond County')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (57, N'Hauser', N'Kristin', 95, N'Fort Smith')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (58, N'Fortner', N'Hanh', 79, N'Olathe')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (61, N'Durden', N'Carlie', 61, N'North Port')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (62, N'Forrester', N'Harriette', 39, N'Dayton')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (63, N'Cameron', N'Kaila', 89, N'Ontario')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (65, N'Hughes', N'Stasia', 22, N'Pompano Beach')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (66, N'Mcbee', N'Louise', 90, N'Athens')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (67, N'Holden', N'Lara', 49, N'New London')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (68, N'Olsen', N'Yesenia', 27, N'Detroit')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (69, N'Dawson', N'Savannah', 18, N'Nashua')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (70, N'Woodall', N'Ching', 42, N'Sioux City')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (71, N'Hales', N'Shenika', 93, N'Kansas City')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (72, N'Wiles', N'Carly', 80, N'Providence')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (73, N'Laplante', N'Shoshana', 55, N'New Bedford')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (75, N'Ramos', N'Hiroko', 28, N'Portland')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (76, N'Porter', N'Monique', 50, N'Evansville')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (77, N'Blaylock', N'Jo', 35, N'West Covina')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (78, N'Weldon', N'Rossana', 55, N'Cedar Rapids')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (79, N'Penrod', N'Ellamae', 19, N'Grayslake')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (80, N'Small', N'Wava', 79, N'Fort Wayne')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (81, N'Nielsen', N'Dane', 71, N'Fairfield')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (82, N'Keefer', N'Susanne', 38, N'New Haven')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (84, N'Holliday', N'Jeffrey', 31, N'Merced')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (85, N'Bragg', N'Toccara', 83, N'Worcester')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (86, N'Royster', N'Lesli', 47, N'Anaheim')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (88, N'Heath', N'Marcelene', 48, N'Moreno Valley')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (89, N'Wu', N'Eilene', 83, N'Laredo')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (92, N'Fulcher', N'Wen', 80, N'Fontana')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (94, N'Mills', N'Jeanice', 74, N'New York')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (95, N'Hoff', N'Marylin', 72, N'Marina')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (96, N'Felton', N'Erna', 68, N'Danbury')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (97, N'Friedman', N'Tamara', 43, N'Mesa')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (98, N'Lance', N'Duane', 21, N'Coral Springs')
INSERT [dbo].[Employee] ([ID], [LastName], [FirstName], [Age], [City]) VALUES (100, N'Giron', N'Jon', 84, N'Indianapolis')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [CHK_EmployeeAge] CHECK  (([Age]>=(18)))
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [CHK_EmployeeAge]
GO
/****** Object:  StoredProcedure [dbo].[UpdateCity]    Script Date: 14/07/2022 20:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateCity](@City nvarchar(30))  
AS 
begin
 update Employee
 set City = 'istanbul'
 where City = @City
end
GO
