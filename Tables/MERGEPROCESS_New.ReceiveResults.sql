CREATE TABLE [MERGEPROCESS_New].[ReceiveResults]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[ProcessDate] [datetime] NOT NULL CONSTRAINT [processdate_def] DEFAULT (getdate()),
[targetid] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subordinateid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ErrorColumn] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorMessage] [nvarchar] (2500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ObjectType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
