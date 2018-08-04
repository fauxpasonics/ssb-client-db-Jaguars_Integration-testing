CREATE TABLE [dbo].[Account_Custom]
(
[SSB_CRMSYSTEM_ACCT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SSID_Winner] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_Ids] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DimCustIDs] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[new_ssbcrmsystemssidwinnersourcesystem] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[emailaddress1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mobilephone] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[telephone2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[new_SSB_PrimaryArchticsID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [dbo].[Account_Custom] ADD CONSTRAINT [PK_Account_Custom] PRIMARY KEY CLUSTERED  ([SSB_CRMSYSTEM_ACCT_ID])
GO
