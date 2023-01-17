USE [data_XX]
GO

Select idx.item_no, idx.item_desc_1, idx.item_desc_2, idx.activity_dt, FLOOR(loc.qty_on_hand) as 'Qty on hand', FLOOR(loc.qty_allocated) as 'Qty allocated', FLOOR(loc.qty_on_hand -  loc.qty_allocated) as 'Avalaible'
From imi1122_sql idx INNER JOIN imi3344_sql loc on idx.item_no = loc.item_no
Where loc.qty_on_hand > 0 and (idx.item_no like '%ac%' or idx.item_no like '%cs%' or idx.item_no like '%my%')
Order by idx.item_no