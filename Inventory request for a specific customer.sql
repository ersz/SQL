USE [data_XX]
GO

SELECT
    idx.item_no,
    idx.item_desc_1,
    idx.item_desc_2,
    idx.activity_dt,
    FLOOR(loc.qty_on_hand) as 'Qty on hand',
    FLOOR(loc.qty_allocated) as 'Qty allocated',
    FLOOR(loc.qty_on_hand -  loc.qty_allocated) as 'Avalaible'
FROM 
  imi1122_sql idx INNER JOIN imi3344_sql loc
ON idx.item_no = loc.item_no
WHERE
  loc.qty_on_hand > 0 and (idx.item_no like '%ac%' or idx.item_no like '%cs%' or idx.item_no like '%my%')
ORDER BY
  idx.item_no;
