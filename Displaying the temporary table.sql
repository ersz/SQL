USE [data_ZZ]	
GO

SELECT
	(Select count(mfg_voc)	
	 From [data_ZZ].[dbo].[oeor_sql] 	
	 Where status = 4 and mfg_voc = 'HLH') as 'HLH total', *
FROM 
	dbo.[Missing Tracking Numbers]
WHERE
	mfg_voc <> 'AC' and ship_to_name <> 'Help Task'
Order by
	2 DESC;
