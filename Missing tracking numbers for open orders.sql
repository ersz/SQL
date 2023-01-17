
CREATE VIEW "Missing Tracking Numbers" AS
SELECT ZZ2.mfg_loc, ZZ2.ord_no as 'CES Order#', ZZ2.ship_instruction_1 as 'Customer Order#', ZZ2.user_def_fld_1 as 'Tracking#',
	   trs.TrackingID as 'Tracking #2', ZZ2.cmt_3 as 'Batch', ZZ2.ship_to_name, ZZ2.ship_to_addr_1, ZZ2.ship_to_addr_2, ZZ2.ship_to_addr_3, ZZ2.ship_via_cd,
	   CASE
	      WHEN ship_via_cd = 'CPU' THEN 'Pick up'
		  ELSE 'CEC'
	   END 'SHIPPER'	  
FROM [data_ZZ].[dbo].[oeor_sql] ZZ2 LEFT OUTER JOIN [Rep].[dbo].[TrackingS] trs ON ZZ2.ord_no = trs.OrderNumber
WHERE status = 4 and user_def_fld_1 IS NULL and trs.TrackingID IS NULL

UNION ALL

SELECT XX4.mfg_loc, XX4.ord_no as 'CES Order#', XX4.cmt_3 as 'Customer Order#', XX4.user_def_fld_1 as 'Tracking#',
	   trs.TrackingID as 'Tracking #2', XX4.cmt_3 as 'Batch', XX4.ship_to_name, XX4.ship_to_addr_1, XX4.ship_to_addr_2, XX4.ship_to_addr_3, XX4.ship_via_cd,
	   CASE
	      WHEN ship_via_cd = 'CPU' THEN 'Pick up'
		  ELSE 'CEC'
	   END 'SHIPPER'
FROM [data_XX].[dbo].[oeor_sql] XX4 LEFT OUTER JOIN [Rep].[dbo].[TrackingS] trs ON XX4.ord_no = trs.OrderNumber
WHERE status = 4 and user_def_fld_1 IS NULL

UNION ALL

SELECT CC96.mfg_loc, CC96.ord_no as 'CES Order#', CC96.ship_instruction_1 as 'Customer Order#', CC96.user_def_fld_1 as 'Tracking#',
	   trs.TrackingID as 'Tracking #2', CC96.cmt_3 as 'Batch', CC96.ship_to_name, CC96.ship_to_addr_1, CC96.ship_to_addr_2, CC96.ship_to_addr_3, CC96.ship_via_cd,
	   CASE
	      WHEN ship_via_cd = 'CPU' THEN 'Pick up'
		  ELSE 'CEC'
	   END 'SHIPPER'
FROM [data_CC].[dbo].[oeor_sql] CC96 LEFT OUTER JOIN [Rep].[dbo].[TrackingS] trs ON CC96.ord_no = trs.OrderNumber
WHERE status = 4 and user_def_fld_1 IS NULL and trs.TrackingID IS NULL;