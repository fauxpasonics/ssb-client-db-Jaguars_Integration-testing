CREATE TABLE [dbo].[PhoneUpdates_08022017]
(
[phoneprimary] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ssid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailPrimary] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DimCustomerId] [int] NOT NULL IDENTITY(1, 1)
)
GO
