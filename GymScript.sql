USE [Gym]
GO
/****** Object:  UserDefinedFunction [dbo].[CalculateCustomerAgeInYear]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CalculateCustomerAgeInYear](@birthdate date)  
RETURNs int
AS 
begin
declare @age int
 set @age = year(GETDATE()) - year(@birthdate);
 return @age
end
GO
/****** Object:  UserDefinedFunction [dbo].[CalculateWorkingHour]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CalculateWorkingHour](@Coach_id int)  
RETURNs int
AS 
begin
declare @workingHours int
 set @workingHours = (select ending_hour - starting_hour from coach_details where @Coach_id = coach_id);
 return @workingHours
end
GO
/****** Object:  Table [dbo].[CUSTOMER_DETAILS]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER_DETAILS](
	[CUSTOMER_ID] [int] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_CODE] [int] NULL,
	[BIRTH_DAY] [date] NULL,
	[GENDER] [varchar](1) NULL,
	[CREATEING_DATE] [date] NULL,
	[LOCATION_ID] [int] NULL,
	[CUSTOMER_PRO_CODE] [varchar](30) NULL,
 CONSTRAINT [PK_CUSTOMER_DETAILS_ID] PRIMARY KEY CLUSTERED 
(
	[CUSTOMER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCustomerAccordingToGender]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetCustomerAccordingToGender](@gender varchar(1))  
RETURNS TABLE  
AS  
RETURN  
    SELECT * FROM CUSTOMER_DETAILS WHERE @gender = gender
GO
/****** Object:  Table [dbo].[COACH]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COACH](
	[COACH_ID] [int] IDENTITY(1,1) NOT NULL,
	[COACH_NAME] [varchar](100) NULL,
	[IF_INVALID] [varchar](50) NULL,
 CONSTRAINT [PK_COACH_ID] PRIMARY KEY CLUSTERED 
(
	[COACH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COACH_DETAILS]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COACH_DETAILS](
	[COACH_ID] [int] IDENTITY(1,1) NOT NULL,
	[COACH_CODE] [int] NULL,
	[STARTING_HOUR] [int] NULL,
	[ENDING_HOUR] [int] NULL,
	[SPORT_ID] [int] NULL,
 CONSTRAINT [PK_COACH_DETAILS_ID] PRIMARY KEY CLUSTERED 
(
	[COACH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SPORT]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPORT](
	[SPORT_ID] [int] IDENTITY(1,1) NOT NULL,
	[SPORT_NAME] [varchar](100) NULL,
	[IF_INVALID] [varchar](50) NULL,
 CONSTRAINT [PK_SPORT_ID] PRIMARY KEY CLUSTERED 
(
	[SPORT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ShowCoachInformation]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[ShowCoachInformation]
as select c.coach_name, s.sport_name, cd.STARTING_HOUR, cd.ENDING_HOUR 
from ((coach c
inner join COACH_DETAILS cd on cd.coach_code = c.COACH_ID)
 inner join sport s on cd.SPORT_ID = s.SPORT_ID);
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CUSTOMER_ID] [int] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_NAME] [varchar](100) NULL,
	[CUSTOMER_PHONE] [varchar](50) NULL,
	[IF_INVALID] [varchar](50) NULL,
 CONSTRAINT [PK_CUSTOMER_ID] PRIMARY KEY CLUSTERED 
(
	[CUSTOMER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER_SPORT]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER_SPORT](
	[CUSTOMER_SPORT_ID] [int] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_NAME] [varchar](100) NULL,
	[SPORT_NAME_ONE] [varchar](100) NULL,
	[COACH_NAME_ONE] [varchar](100) NULL,
	[SPORT_NAME_TWO] [varchar](100) NULL,
	[COACH_NAME_TWO] [varchar](100) NULL,
	[IF_INVALID] [varchar](30) NULL,
 CONSTRAINT [PK_CUSTOMER_SPORT_ID] PRIMARY KEY CLUSTERED 
(
	[CUSTOMER_SPORT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER_SPORT_DETAILS]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER_SPORT_DETAILS](
	[CUSTOMER_SPORT_ID] [int] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_SPORT_CODE] [int] NULL,
	[CUSTOMER_ID] [int] NULL,
	[STARTING_DATE_ONE] [date] NULL,
	[ENDING_DATE_ONE] [date] NULL,
	[STARTING_DATE_TWO] [date] NULL,
	[ENDING_DATE_TWO] [date] NULL,
	[SPORT_HOUR_ONE] [int] NULL,
	[SPORT_HOUR_TWO] [int] NULL,
	[SPORT_ID_ONE] [int] NULL,
	[SPORT_ID_TWO] [int] NULL,
	[COACH_ID_ONE] [int] NULL,
	[COACH_ID_TWO] [int] NULL,
	[LAST_CHARGE_DATE_ONE] [date] NULL,
	[LAST_CHARGE_DATE_TWO] [date] NULL,
 CONSTRAINT [PK_CUSTOMER_SPORT_DETAILS_ID] PRIMARY KEY CLUSTERED 
(
	[CUSTOMER_SPORT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INVOICE]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INVOICE](
	[INVOICE_ID] [int] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_NAME] [varchar](100) NULL,
	[SPORT_NAME_ONE] [varchar](100) NULL,
	[SPORT_NAME_TWO] [varchar](100) NULL,
	[DAY_COUNT_ONE] [int] NULL,
	[DAY_COUNT_TWO] [int] NULL,
	[TOTAL_COST] [int] NULL,
	[INVOICE_DATE] [date] NULL,
	[REFUND_STATUS] [varchar](3) NULL,
 CONSTRAINT [PK_INVOICE_ID] PRIMARY KEY CLUSTERED 
(
	[INVOICE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INVOICE_DETAILS]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INVOICE_DETAILS](
	[INVOICE_ID] [int] IDENTITY(1,1) NOT NULL,
	[INVOICE_CODE] [int] NULL,
	[CUSTOMER_ID] [int] NULL,
	[LAST_CARGE_DATE_ONE] [date] NULL,
	[NEXT_CHARGE_DATE_ONE] [date] NULL,
	[LAST_CARGE_DATE_TWO] [date] NULL,
	[NEXT_CHARGE_DATE_TWO] [date] NULL,
	[BANK_ACCOUNT] [varchar](100) NULL,
	[COST_SPORT_ONE] [int] NULL,
	[COST_SPORT_TWO] [int] NULL,
 CONSTRAINT [PK_INVOICE_DETAILS_ID] PRIMARY KEY CLUSTERED 
(
	[INVOICE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOCATION]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOCATION](
	[LOCATION_ID] [int] IDENTITY(1,1) NOT NULL,
	[LOCATION_NAME] [varchar](100) NULL,
	[IF_INVALID] [varchar](50) NULL,
 CONSTRAINT [PK_LOCATION_ID] PRIMARY KEY CLUSTERED 
(
	[LOCATION_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOG]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOG](
	[LOG_ID] [int] IDENTITY(1,1) NOT NULL,
	[TABLE_NAME] [varchar](100) NULL,
	[IF_SUCCESSFUL] [varchar](30) NULL,
 CONSTRAINT [PK_LOG_ID] PRIMARY KEY CLUSTERED 
(
	[LOG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOG_DETAILS]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOG_DETAILS](
	[LOG_ID] [int] IDENTITY(1,1) NOT NULL,
	[LOG_CODE] [int] NULL,
	[OPERATION_NAME] [varchar](50) NULL,
	[OPERATION_DATE] [date] NULL,
	[CUSTOMER_ID] [int] NULL,
	[SPORT_ID] [int] NULL,
	[COACH_ID] [int] NULL,
	[PROMOTION_ID] [int] NULL,
	[LOCATION_ID] [int] NULL,
	[INVOICE_ID] [int] NULL,
	[ERROR_CODE] [int] NULL,
	[ERROR_DETAILS] [varchar](100) NULL,
	[BY_USER] [varchar](50) NULL,
 CONSTRAINT [PK_LOG_DETAILS_ID] PRIMARY KEY CLUSTERED 
(
	[LOG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROMOTION]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROMOTION](
	[PROMOTION_ID] [int] IDENTITY(1,1) NOT NULL,
	[CREATING_DATE] [date] NULL,
	[STARTING_DATE] [date] NULL,
	[ENDING_DATE] [date] NULL,
	[PROMOTION_TYPE] [varchar](50) NULL,
	[PROMOTION_CODE] [varchar](30) NULL,
	[PLAYER_COUNT] [int] NULL,
	[DISCOUNT_PERCENTAGE] [int] NULL,
	[IF_INVALID] [varchar](50) NULL,
 CONSTRAINT [PK_PROMOTION_ID] PRIMARY KEY CLUSTERED 
(
	[PROMOTION_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REFUND_INVOICE]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REFUND_INVOICE](
	[REFUND_ID] [int] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_NAME] [varchar](100) NULL,
	[CANCEL_REGISTRATION_ONE] [date] NULL,
	[CANCEL_REGISTRATION_TWO] [date] NULL,
	[REFUND_ONE] [int] NULL,
	[REFUND_TWO] [int] NULL,
	[REFUND_TOTAL] [int] NULL,
 CONSTRAINT [PK_REFUND_ID] PRIMARY KEY CLUSTERED 
(
	[REFUND_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[COACH] ON 

INSERT [dbo].[COACH] ([COACH_ID], [COACH_NAME], [IF_INVALID]) VALUES (1, N'AHMET', N'INVALID')
INSERT [dbo].[COACH] ([COACH_ID], [COACH_NAME], [IF_INVALID]) VALUES (2, N'HAKAN', N'VALID')
INSERT [dbo].[COACH] ([COACH_ID], [COACH_NAME], [IF_INVALID]) VALUES (3, N'BETÜL', N'INVALID')
INSERT [dbo].[COACH] ([COACH_ID], [COACH_NAME], [IF_INVALID]) VALUES (4, N'SÜLEYMAN', N'VALID')
INSERT [dbo].[COACH] ([COACH_ID], [COACH_NAME], [IF_INVALID]) VALUES (5, N'SALMA', N'VALID')
SET IDENTITY_INSERT [dbo].[COACH] OFF
GO
SET IDENTITY_INSERT [dbo].[CUSTOMER] ON 

INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [CUSTOMER_NAME], [CUSTOMER_PHONE], [IF_INVALID]) VALUES (1, N'Cathleen Watts', N'1-696-987-4166', N'VALID')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [CUSTOMER_NAME], [CUSTOMER_PHONE], [IF_INVALID]) VALUES (2, N'Philip Garza', N'1-725-557-8113', N'VALID')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [CUSTOMER_NAME], [CUSTOMER_PHONE], [IF_INVALID]) VALUES (3, N'Barbara Rose', N'1-224-830-6576', N'VALID')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [CUSTOMER_NAME], [CUSTOMER_PHONE], [IF_INVALID]) VALUES (4, N'Daria Lowe', N'1-768-305-5167', N'VALID')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [CUSTOMER_NAME], [CUSTOMER_PHONE], [IF_INVALID]) VALUES (5, N'Lillith Ashley', N'1-578-824-1334', N'VALID')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [CUSTOMER_NAME], [CUSTOMER_PHONE], [IF_INVALID]) VALUES (14, N'Whitney Santiago', N'1-660-345-3248', N'VALID')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [CUSTOMER_NAME], [CUSTOMER_PHONE], [IF_INVALID]) VALUES (15, N'Akeem Fitzgerald', N'1-847-841-2013', N'VALID')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [CUSTOMER_NAME], [CUSTOMER_PHONE], [IF_INVALID]) VALUES (16, N'Yoshio Rivas', N'1-808-459-8082', N'VALID')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [CUSTOMER_NAME], [CUSTOMER_PHONE], [IF_INVALID]) VALUES (17, N'Jade Farrell', N'1-520-452-3554', N'VALID')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [CUSTOMER_NAME], [CUSTOMER_PHONE], [IF_INVALID]) VALUES (18, N'Kevyn Baldwin', N'1-733-141-7431', N'VALID')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [CUSTOMER_NAME], [CUSTOMER_PHONE], [IF_INVALID]) VALUES (19, N'Akeem Little', N'1-811-429-1181', N'VALID')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [CUSTOMER_NAME], [CUSTOMER_PHONE], [IF_INVALID]) VALUES (20, N'Roanna Walker', N'1-304-217-7755', N'VALID')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [CUSTOMER_NAME], [CUSTOMER_PHONE], [IF_INVALID]) VALUES (21, N'Jameson Ryan', N'1-510-664-3867', N'VALID')
INSERT [dbo].[CUSTOMER] ([CUSTOMER_ID], [CUSTOMER_NAME], [CUSTOMER_PHONE], [IF_INVALID]) VALUES (22, N'Cherokee Buckley', N'1-344-884-6832', N'VALID')
SET IDENTITY_INSERT [dbo].[CUSTOMER] OFF
GO
SET IDENTITY_INSERT [dbo].[CUSTOMER_DETAILS] ON 

INSERT [dbo].[CUSTOMER_DETAILS] ([CUSTOMER_ID], [CUSTOMER_CODE], [BIRTH_DAY], [GENDER], [CREATEING_DATE], [LOCATION_ID], [CUSTOMER_PRO_CODE]) VALUES (12, 5, CAST(N'2054-04-21' AS Date), N'M', CAST(N'2023-07-06' AS Date), 7, NULL)
INSERT [dbo].[CUSTOMER_DETAILS] ([CUSTOMER_ID], [CUSTOMER_CODE], [BIRTH_DAY], [GENDER], [CREATEING_DATE], [LOCATION_ID], [CUSTOMER_PRO_CODE]) VALUES (13, 1, CAST(N'2054-06-15' AS Date), N'F', CAST(N'2023-02-02' AS Date), 12, NULL)
INSERT [dbo].[CUSTOMER_DETAILS] ([CUSTOMER_ID], [CUSTOMER_CODE], [BIRTH_DAY], [GENDER], [CREATEING_DATE], [LOCATION_ID], [CUSTOMER_PRO_CODE]) VALUES (14, 2, CAST(N'2083-12-24' AS Date), N'F', CAST(N'2021-08-26' AS Date), 11, NULL)
INSERT [dbo].[CUSTOMER_DETAILS] ([CUSTOMER_ID], [CUSTOMER_CODE], [BIRTH_DAY], [GENDER], [CREATEING_DATE], [LOCATION_ID], [CUSTOMER_PRO_CODE]) VALUES (15, 2, CAST(N'2080-11-14' AS Date), N'M', CAST(N'2022-09-27' AS Date), 14, NULL)
INSERT [dbo].[CUSTOMER_DETAILS] ([CUSTOMER_ID], [CUSTOMER_CODE], [BIRTH_DAY], [GENDER], [CREATEING_DATE], [LOCATION_ID], [CUSTOMER_PRO_CODE]) VALUES (17, 21, CAST(N'2100-03-25' AS Date), N'F', CAST(N'2021-08-23' AS Date), 5, NULL)
SET IDENTITY_INSERT [dbo].[CUSTOMER_DETAILS] OFF
GO
SET IDENTITY_INSERT [dbo].[LOCATION] ON 

INSERT [dbo].[LOCATION] ([LOCATION_ID], [LOCATION_NAME], [IF_INVALID]) VALUES (4, N'Pamela Leblanc', N'VALID')
INSERT [dbo].[LOCATION] ([LOCATION_ID], [LOCATION_NAME], [IF_INVALID]) VALUES (5, N'Rylee Campos', N'VALID')
INSERT [dbo].[LOCATION] ([LOCATION_ID], [LOCATION_NAME], [IF_INVALID]) VALUES (6, N'Rina Potts', N'VALID')
INSERT [dbo].[LOCATION] ([LOCATION_ID], [LOCATION_NAME], [IF_INVALID]) VALUES (7, N'Kessie Schultz', N'VALID')
INSERT [dbo].[LOCATION] ([LOCATION_ID], [LOCATION_NAME], [IF_INVALID]) VALUES (8, N'Lisandra Alexander', N'VALID')
INSERT [dbo].[LOCATION] ([LOCATION_ID], [LOCATION_NAME], [IF_INVALID]) VALUES (9, N'Kenneth Cleveland', N'VALID')
INSERT [dbo].[LOCATION] ([LOCATION_ID], [LOCATION_NAME], [IF_INVALID]) VALUES (10, N'Joel Kramer', N'VALID')
INSERT [dbo].[LOCATION] ([LOCATION_ID], [LOCATION_NAME], [IF_INVALID]) VALUES (11, N'Halee Wells', N'VALID')
INSERT [dbo].[LOCATION] ([LOCATION_ID], [LOCATION_NAME], [IF_INVALID]) VALUES (12, N'Jorden Byrd', N'VALID')
INSERT [dbo].[LOCATION] ([LOCATION_ID], [LOCATION_NAME], [IF_INVALID]) VALUES (13, N'Guinevere Fox', N'VALID')
INSERT [dbo].[LOCATION] ([LOCATION_ID], [LOCATION_NAME], [IF_INVALID]) VALUES (14, N'Simone Ellis', N'VALID')
INSERT [dbo].[LOCATION] ([LOCATION_ID], [LOCATION_NAME], [IF_INVALID]) VALUES (15, N'Elaine Rivas', N'VALID')
SET IDENTITY_INSERT [dbo].[LOCATION] OFF
GO
SET IDENTITY_INSERT [dbo].[SPORT] ON 

INSERT [dbo].[SPORT] ([SPORT_ID], [SPORT_NAME], [IF_INVALID]) VALUES (1, N'swimming', N'INVALID')
INSERT [dbo].[SPORT] ([SPORT_ID], [SPORT_NAME], [IF_INVALID]) VALUES (2, N'swimming', N'VALID')
INSERT [dbo].[SPORT] ([SPORT_ID], [SPORT_NAME], [IF_INVALID]) VALUES (3, N'swimming', N'INVALID')
INSERT [dbo].[SPORT] ([SPORT_ID], [SPORT_NAME], [IF_INVALID]) VALUES (4, N'volleyball', N'VALID')
INSERT [dbo].[SPORT] ([SPORT_ID], [SPORT_NAME], [IF_INVALID]) VALUES (5, N'futball', N'VALID')
SET IDENTITY_INSERT [dbo].[SPORT] OFF
GO
/****** Object:  Index [CH_INVOICE_CODE]    Script Date: 15/07/2022 15:19:07 ******/
ALTER TABLE [dbo].[INVOICE_DETAILS] ADD  CONSTRAINT [CH_INVOICE_CODE] UNIQUE NONCLUSTERED 
(
	[INVOICE_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_RPOMOTION_CODE]    Script Date: 15/07/2022 15:19:07 ******/
ALTER TABLE [dbo].[PROMOTION] ADD  CONSTRAINT [UK_RPOMOTION_CODE] UNIQUE NONCLUSTERED 
(
	[PROMOTION_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_RPOMOTION_TYPE]    Script Date: 15/07/2022 15:19:07 ******/
ALTER TABLE [dbo].[PROMOTION] ADD  CONSTRAINT [UK_RPOMOTION_TYPE] UNIQUE NONCLUSTERED 
(
	[PROMOTION_TYPE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT] ADD  DEFAULT (NULL) FOR [SPORT_NAME_TWO]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT] ADD  DEFAULT (NULL) FOR [COACH_NAME_TWO]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS] ADD  DEFAULT (NULL) FOR [STARTING_DATE_TWO]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS] ADD  DEFAULT (NULL) FOR [ENDING_DATE_TWO]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS] ADD  DEFAULT (NULL) FOR [SPORT_HOUR_TWO]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS] ADD  DEFAULT (NULL) FOR [SPORT_ID_TWO]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS] ADD  DEFAULT (NULL) FOR [COACH_ID_TWO]
GO
ALTER TABLE [dbo].[INVOICE] ADD  DEFAULT (NULL) FOR [SPORT_NAME_TWO]
GO
ALTER TABLE [dbo].[INVOICE] ADD  DEFAULT (NULL) FOR [DAY_COUNT_TWO]
GO
ALTER TABLE [dbo].[INVOICE] ADD  DEFAULT (getdate()) FOR [INVOICE_DATE]
GO
ALTER TABLE [dbo].[INVOICE_DETAILS] ADD  DEFAULT (NULL) FOR [LAST_CARGE_DATE_TWO]
GO
ALTER TABLE [dbo].[INVOICE_DETAILS] ADD  DEFAULT (NULL) FOR [NEXT_CHARGE_DATE_TWO]
GO
ALTER TABLE [dbo].[INVOICE_DETAILS] ADD  DEFAULT (NULL) FOR [COST_SPORT_TWO]
GO
ALTER TABLE [dbo].[LOG_DETAILS] ADD  DEFAULT (NULL) FOR [CUSTOMER_ID]
GO
ALTER TABLE [dbo].[LOG_DETAILS] ADD  DEFAULT (NULL) FOR [SPORT_ID]
GO
ALTER TABLE [dbo].[LOG_DETAILS] ADD  DEFAULT (NULL) FOR [COACH_ID]
GO
ALTER TABLE [dbo].[LOG_DETAILS] ADD  DEFAULT (NULL) FOR [PROMOTION_ID]
GO
ALTER TABLE [dbo].[LOG_DETAILS] ADD  DEFAULT (NULL) FOR [LOCATION_ID]
GO
ALTER TABLE [dbo].[LOG_DETAILS] ADD  DEFAULT (NULL) FOR [INVOICE_ID]
GO
ALTER TABLE [dbo].[LOG_DETAILS] ADD  DEFAULT (NULL) FOR [ERROR_CODE]
GO
ALTER TABLE [dbo].[LOG_DETAILS] ADD  DEFAULT (NULL) FOR [ERROR_DETAILS]
GO
ALTER TABLE [dbo].[REFUND_INVOICE] ADD  DEFAULT (NULL) FOR [CANCEL_REGISTRATION_TWO]
GO
ALTER TABLE [dbo].[REFUND_INVOICE] ADD  DEFAULT (NULL) FOR [REFUND_TWO]
GO
ALTER TABLE [dbo].[COACH_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_COACH_DETAILS_COACH] FOREIGN KEY([COACH_CODE])
REFERENCES [dbo].[COACH] ([COACH_ID])
GO
ALTER TABLE [dbo].[COACH_DETAILS] CHECK CONSTRAINT [FK_COACH_DETAILS_COACH]
GO
ALTER TABLE [dbo].[COACH_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_COACH_SPORT] FOREIGN KEY([SPORT_ID])
REFERENCES [dbo].[SPORT] ([SPORT_ID])
GO
ALTER TABLE [dbo].[COACH_DETAILS] CHECK CONSTRAINT [FK_COACH_SPORT]
GO
ALTER TABLE [dbo].[CUSTOMER_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_DETAILS_CUSTOMER] FOREIGN KEY([CUSTOMER_CODE])
REFERENCES [dbo].[CUSTOMER] ([CUSTOMER_ID])
GO
ALTER TABLE [dbo].[CUSTOMER_DETAILS] CHECK CONSTRAINT [FK_CUSTOMER_DETAILS_CUSTOMER]
GO
ALTER TABLE [dbo].[CUSTOMER_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_LOCATION] FOREIGN KEY([LOCATION_ID])
REFERENCES [dbo].[LOCATION] ([LOCATION_ID])
GO
ALTER TABLE [dbo].[CUSTOMER_DETAILS] CHECK CONSTRAINT [FK_CUSTOMER_LOCATION]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_SPORT_COACH_ONE] FOREIGN KEY([COACH_ID_ONE])
REFERENCES [dbo].[COACH] ([COACH_ID])
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS] CHECK CONSTRAINT [FK_CUSTOMER_SPORT_COACH_ONE]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_SPORT_COACH_TWO] FOREIGN KEY([COACH_ID_TWO])
REFERENCES [dbo].[COACH] ([COACH_ID])
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS] CHECK CONSTRAINT [FK_CUSTOMER_SPORT_COACH_TWO]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_SPORT_CUSTOMER] FOREIGN KEY([CUSTOMER_ID])
REFERENCES [dbo].[CUSTOMER] ([CUSTOMER_ID])
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS] CHECK CONSTRAINT [FK_CUSTOMER_SPORT_CUSTOMER]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_SPORT_DETAILS_CUSTOMER_SPORT] FOREIGN KEY([CUSTOMER_SPORT_CODE])
REFERENCES [dbo].[CUSTOMER_SPORT] ([CUSTOMER_SPORT_ID])
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS] CHECK CONSTRAINT [FK_CUSTOMER_SPORT_DETAILS_CUSTOMER_SPORT]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_SPORT_ONE] FOREIGN KEY([SPORT_ID_ONE])
REFERENCES [dbo].[SPORT] ([SPORT_ID])
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS] CHECK CONSTRAINT [FK_CUSTOMER_SPORT_ONE]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMER_SPORT_TWO] FOREIGN KEY([SPORT_ID_TWO])
REFERENCES [dbo].[SPORT] ([SPORT_ID])
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS] CHECK CONSTRAINT [FK_CUSTOMER_SPORT_TWO]
GO
ALTER TABLE [dbo].[INVOICE_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_INVOICE_CUSTOMER] FOREIGN KEY([CUSTOMER_ID])
REFERENCES [dbo].[CUSTOMER] ([CUSTOMER_ID])
GO
ALTER TABLE [dbo].[INVOICE_DETAILS] CHECK CONSTRAINT [FK_INVOICE_CUSTOMER]
GO
ALTER TABLE [dbo].[INVOICE_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_INVOICE_DETAILS_INVOICE] FOREIGN KEY([INVOICE_CODE])
REFERENCES [dbo].[INVOICE] ([INVOICE_ID])
GO
ALTER TABLE [dbo].[INVOICE_DETAILS] CHECK CONSTRAINT [FK_INVOICE_DETAILS_INVOICE]
GO
ALTER TABLE [dbo].[LOG_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_LOG_COACH] FOREIGN KEY([COACH_ID])
REFERENCES [dbo].[COACH] ([COACH_ID])
GO
ALTER TABLE [dbo].[LOG_DETAILS] CHECK CONSTRAINT [FK_LOG_COACH]
GO
ALTER TABLE [dbo].[LOG_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_LOG_CUSTOMER] FOREIGN KEY([CUSTOMER_ID])
REFERENCES [dbo].[CUSTOMER] ([CUSTOMER_ID])
GO
ALTER TABLE [dbo].[LOG_DETAILS] CHECK CONSTRAINT [FK_LOG_CUSTOMER]
GO
ALTER TABLE [dbo].[LOG_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_LOG_DETAILS_LOG] FOREIGN KEY([LOG_CODE])
REFERENCES [dbo].[LOG] ([LOG_ID])
GO
ALTER TABLE [dbo].[LOG_DETAILS] CHECK CONSTRAINT [FK_LOG_DETAILS_LOG]
GO
ALTER TABLE [dbo].[LOG_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_LOG_INVOICE] FOREIGN KEY([INVOICE_ID])
REFERENCES [dbo].[INVOICE] ([INVOICE_ID])
GO
ALTER TABLE [dbo].[LOG_DETAILS] CHECK CONSTRAINT [FK_LOG_INVOICE]
GO
ALTER TABLE [dbo].[LOG_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_LOG_LOCATION] FOREIGN KEY([LOCATION_ID])
REFERENCES [dbo].[LOCATION] ([LOCATION_ID])
GO
ALTER TABLE [dbo].[LOG_DETAILS] CHECK CONSTRAINT [FK_LOG_LOCATION]
GO
ALTER TABLE [dbo].[LOG_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_LOG_PROMOTION] FOREIGN KEY([PROMOTION_ID])
REFERENCES [dbo].[PROMOTION] ([PROMOTION_ID])
GO
ALTER TABLE [dbo].[LOG_DETAILS] CHECK CONSTRAINT [FK_LOG_PROMOTION]
GO
ALTER TABLE [dbo].[LOG_DETAILS]  WITH CHECK ADD  CONSTRAINT [FK_LOG_SPORT] FOREIGN KEY([SPORT_ID])
REFERENCES [dbo].[SPORT] ([SPORT_ID])
GO
ALTER TABLE [dbo].[LOG_DETAILS] CHECK CONSTRAINT [FK_LOG_SPORT]
GO
ALTER TABLE [dbo].[COACH]  WITH CHECK ADD  CONSTRAINT [CH_VALID_COACH] CHECK  (([IF_INVALID]='VALID' OR [IF_INVALID]='INVALID'))
GO
ALTER TABLE [dbo].[COACH] CHECK CONSTRAINT [CH_VALID_COACH]
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH CHECK ADD  CONSTRAINT [CH_VALID_CUSTOMER] CHECK  (([IF_INVALID]='VALID' OR [IF_INVALID]='INVALID'))
GO
ALTER TABLE [dbo].[CUSTOMER] CHECK CONSTRAINT [CH_VALID_CUSTOMER]
GO
ALTER TABLE [dbo].[CUSTOMER_DETAILS]  WITH CHECK ADD  CONSTRAINT [CH_CUSTOMER_GENDER] CHECK  (([GENDER]='F' OR [GENDER]='M'))
GO
ALTER TABLE [dbo].[CUSTOMER_DETAILS] CHECK CONSTRAINT [CH_CUSTOMER_GENDER]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT]  WITH CHECK ADD  CONSTRAINT [CH_SPORT_NOT_EQUAL] CHECK  (([SPORT_NAME_ONE]<>[SPORT_NAME_TWO]))
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT] CHECK CONSTRAINT [CH_SPORT_NOT_EQUAL]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT]  WITH CHECK ADD  CONSTRAINT [CH_VALID_CUSTOMER_SPORT] CHECK  (([IF_INVALID]='VALID' OR [IF_INVALID]='INVALID'))
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT] CHECK CONSTRAINT [CH_VALID_CUSTOMER_SPORT]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS]  WITH CHECK ADD  CONSTRAINT [CH_COACH_NOT_SAME] CHECK  (([COACH_ID_ONE]<>[COACH_ID_TWO]))
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS] CHECK CONSTRAINT [CH_COACH_NOT_SAME]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS]  WITH CHECK ADD  CONSTRAINT [CH_HOUR_NOT_SAME] CHECK  (([SPORT_HOUR_ONE]<>[SPORT_HOUR_TWO]))
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS] CHECK CONSTRAINT [CH_HOUR_NOT_SAME]
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS]  WITH CHECK ADD  CONSTRAINT [CH_SPORT_ID_NOT_SAME] CHECK  (([SPORT_ID_ONE]<>[SPORT_ID_TWO]))
GO
ALTER TABLE [dbo].[CUSTOMER_SPORT_DETAILS] CHECK CONSTRAINT [CH_SPORT_ID_NOT_SAME]
GO
ALTER TABLE [dbo].[INVOICE]  WITH CHECK ADD  CONSTRAINT [CH_REFUND_STATUS] CHECK  (([REFUND_STATUS]='NO' OR [REFUND_STATUS]='YES'))
GO
ALTER TABLE [dbo].[INVOICE] CHECK CONSTRAINT [CH_REFUND_STATUS]
GO
ALTER TABLE [dbo].[INVOICE]  WITH CHECK ADD  CONSTRAINT [CH_SPORT_NAME_NOT_SAME] CHECK  (([SPORT_NAME_ONE]<>[SPORT_NAME_TWO]))
GO
ALTER TABLE [dbo].[INVOICE] CHECK CONSTRAINT [CH_SPORT_NAME_NOT_SAME]
GO
ALTER TABLE [dbo].[LOCATION]  WITH CHECK ADD  CONSTRAINT [CH_VALID_LOCATION] CHECK  (([IF_INVALID]='VALID' OR [IF_INVALID]='INVALID'))
GO
ALTER TABLE [dbo].[LOCATION] CHECK CONSTRAINT [CH_VALID_LOCATION]
GO
ALTER TABLE [dbo].[LOG]  WITH CHECK ADD  CONSTRAINT [CH_SUCCESSFUL_LOG] CHECK  (([IF_SUCCESSFUL]='TRUE' OR [IF_SUCCESSFUL]='FALSE'))
GO
ALTER TABLE [dbo].[LOG] CHECK CONSTRAINT [CH_SUCCESSFUL_LOG]
GO
ALTER TABLE [dbo].[PROMOTION]  WITH CHECK ADD  CONSTRAINT [CH_VALID_PROMOTION] CHECK  (([IF_INVALID]='VALID' OR [IF_INVALID]='INVALID'))
GO
ALTER TABLE [dbo].[PROMOTION] CHECK CONSTRAINT [CH_VALID_PROMOTION]
GO
ALTER TABLE [dbo].[SPORT]  WITH CHECK ADD  CONSTRAINT [CH_VALID_SPORT] CHECK  (([IF_INVALID]='VALID' OR [IF_INVALID]='INVALID'))
GO
ALTER TABLE [dbo].[SPORT] CHECK CONSTRAINT [CH_VALID_SPORT]
GO
/****** Object:  StoredProcedure [dbo].[UpdateValidation]    Script Date: 15/07/2022 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[UpdateValidation](@Customer_ID int)  
AS 
begin
declare @Satatus varchar(7)
 set @Satatus = (select IF_INVALID from CUSTOMER where @Customer_ID = Customer_ID);
 
 if(@Satatus = 'VALID')
 BEGIN
	update CUSTOMER
	set IF_INVALID = 'INVALID';
 END
  else 
  BEGIN
  update Customer
	set IF_INVALID = 'VALID';
  END
end
GO
