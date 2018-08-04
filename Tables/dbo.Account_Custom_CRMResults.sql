CREATE TABLE [dbo].[Account_Custom_CRMResults]
(
[accountid] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[new_ssbcrmsystemssidwinner] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[str_number] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[new_ssbcrmsystemdimcustids] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CrmRecordId] [uniqueidentifier] NULL,
[IsNew] [bit] NULL,
[ErrorCode] [int] NULL,
[ErrorColumn] [int] NULL,
[CrmErrorMessage] [nvarchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
