SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [MERGEPROCESS_New].[vw_Cust_Account_ColumnLogic]
AS

SELECT  q.Winning_ID AS targetid 
       ,Losing_ID AS subordinateid             
       ,1 AS CoalesceNonEmptyValues --New Kingsway feature to bring values from loser where winning record is null


	   ,/*donotbulkemail			 - Check yes if Either Record is Yes			*/ CASE WHEN winner.donotbulkemail = 1 OR loser.donotbulkemail = 1 THEN 1 ELSE 0 END																	 AS [donotbulkemail]
	   ,/*donotbulkpostalmail		 - Check yes if Either Record is Yes			*/ CASE WHEN winner.donotbulkpostalmail = 1 OR loser.donotbulkpostalmail = 1 THEN 1 ELSE 0 END															 AS [donotbulkpostalmail]
	   ,/*donotemail				 - Check yes if Either Record is Yes			*/ CASE WHEN winner.donotemail = 1 OR loser.donotemail = 1 THEN 1 ELSE 0 END																			 AS [donotemail]
	   ,/*donotfax					 - Check yes if Either Record is Yes			*/ CASE WHEN winner.donotfax = 1 OR loser.donotfax = 1 THEN 1 ELSE 0 END																				 AS [donotfax]
	   ,/*donotphone				 - Check yes if Either Record is Yes			*/ CASE WHEN winner.donotphone = 1 OR loser.donotphone = 1 THEN 1 ELSE 0 END																			 AS [donotphone]
	   ,/*donotpostalmail			 - Check yes if Either Record is Yes			*/ CASE WHEN winner.donotpostalmail = 1 OR loser.donotpostalmail = 1 THEN 1 ELSE 0 END																	 AS [donotpostalmail]
	   ,/*donotsendmm				 - Check yes if Either Record is Yes			*/ CASE WHEN winner.donotsendmm = 1 OR loser.donotsendmm = 1 THEN 1 ELSE 0 END																			 AS [donotsendmm]
	   ,/*participatesinworkflow	 - Check yes if Either Record is Yes			*/ CASE WHEN winner.participatesinworkflow = 1 OR loser.participatesinworkflow = 1 THEN 1 ELSE 0 END													 AS [participatesinworkflow]
	   ,/*donotbulkemailname		 - Check yes if Either Record is Yes (String)	*/ CASE WHEN winner.donotbulkemailname = 'Do Not Allow' OR loser.donotbulkemailname = 'Do Not Allow' THEN 'Do Not Allow' ELSE 'Allow' END				 AS [donotbulkemailname]
	   ,/*donotemailname			 - Check yes if Either Record is Yes (String)	*/ CASE WHEN winner.donotemailname = 'Do Not Allow' OR loser.donotemailname = 'Do Not Allow' THEN 'Do Not Allow' ELSE 'Allow' END						 AS [donotemailname]
	   ,/*donotfaxname				 - Check yes if Either Record is Yes (String)	*/ CASE WHEN winner.donotfaxname = 'Do Not Allow' OR loser.donotfaxname = 'Do Not Allow' THEN 'Do Not Allow' ELSE 'Allow' END							 AS [donotfaxname]
	   ,/*donotphonename			 - Check yes if Either Record is Yes (String)	*/ CASE WHEN winner.donotphonename = 'Do Not Allow' OR loser.donotphonename = 'Do Not Allow' THEN 'Do Not Allow' ELSE 'Allow' END						 AS [donotphonename]
	   ,/*donotpostalmailname		 - Check yes if Either Record is Yes (String)	*/ CASE WHEN winner.donotpostalmailname = 'Do Not Allow' OR loser.donotpostalmailname = 'Do Not Allow' THEN 'Do Not Allow' ELSE 'Allow' END				 AS [donotpostalmailname]
	   ,/*donotbulkpostalmailname	 - Check yes if Either Record is Yes (String)	*/ CASE WHEN winner.donotbulkpostalmailname = 'Do Not Allow' OR loser.donotbulkpostalmailname = 'Do Not Allow' THEN 'Do Not Allow' ELSE 'Yes' END		 AS [donotbulkpostalmailname]
	   ,/*lastusedincampaign		 - Most recent from both records				*/ CASE WHEN winner.lastusedincampaign < loser.lastusedincampaign THEN loser.lastusedincampaign ELSE winner.lastusedincampaign END						 AS [lastusedincampaign]

FROM [MERGEPROCESS_New].[Queue] q
	JOIN mergeprocess_new.tmp_pcaccount winner ON q.Winning_ID = winner.accountid
	JOIN mergeprocess_new.tmp_pcaccount loser ON q.Losing_ID = loser.accountid
WHERE q.ObjectType = 'Account'









GO
