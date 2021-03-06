CREATE TABLE [dbo].[Contact_Custom]
(
[SSB_CRMSYSTEM_ACCT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SSID_Winner] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_Ids] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountId] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DimCustIDs] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MDMProcess_UpdatedDate] [datetime] NULL,
[New_Turnkey_ChildrenPresent] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[New_Turnkey_DiscretionaryIncome] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[New_Turnkey_Age] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[New_Turnkey_Gender] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[New_Turnkey_HouseholdIncome] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[New_CurrentSTH] [bit] NULL,
[New_RookieSTH] [bit] NULL,
[New_PriorSTH] [bit] NULL,
[New_TicketBuyerType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[New_RenewedCY] [bit] NULL,
[New_MiniBuyer] [bit] NULL,
[New_SingleBuyer] [bit] NULL,
[New_GroupBuyer] [bit] NULL,
[New_NonTicketBuyer] [bit] NULL,
[New_NumTickets_CY] [int] NULL,
[New_NumEvents_CY] [int] NULL,
[New_TicketsPerEvent_CY] [numeric] (18, 2) NULL,
[New_TotalSpend_CY] [numeric] (18, 2) NULL,
[New_AvgSpend_CY] [numeric] (18, 2) NULL,
[New_AvgPrice_CY] [numeric] (18, 2) NULL,
[New_NumTickets_PY] [int] NULL,
[New_NumEvents_PY] [int] NULL,
[New_TicketsPerEvent_PY] [numeric] (18, 2) NULL,
[New_TotalSpend_PY] [numeric] (18, 2) NULL,
[New_AvgSpend_PY] [numeric] (18, 2) NULL,
[New_AvgPrice_PY] [numeric] (18, 2) NULL,
[New_NumTickets_PY2] [int] NULL,
[New_NumEvents_PY2] [int] NULL,
[New_TicketsPerEvent_PY2] [numeric] (18, 2) NULL,
[New_TotalSpend_PY2] [numeric] (18, 2) NULL,
[New_AvgSpend_PY2] [numeric] (18, 2) NULL,
[New_AvgPrice_PY2] [numeric] (18, 2) NULL,
[new_ssbcrmsystemssidwinnersourcesystem] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[emailaddress1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mobilephone] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[telephone2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[emailaddress2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[emailaddress3] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[new_SSB_PrimaryArchticsID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[new_race] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [dbo].[Contact_Custom] ADD CONSTRAINT [PK_Contact_Custom] PRIMARY KEY CLUSTERED  ([SSB_CRMSYSTEM_CONTACT_ID])
GO
