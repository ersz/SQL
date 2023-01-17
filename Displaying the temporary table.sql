USE [data_ZZ]	
GO

SELECT (Select count(mfg_loc)
				From [data_ZZ].[dbo].[oeor_sql]
					Where status = 4 and mfg_loc = 'HLH') as 'HLH total', *
FROM dbo.[Missing Tracking Numbers] WHERE mfg_loc <> 'AC' and ship_to_name <> 'Help Task'
Order by 2 DESC;
