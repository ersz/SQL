USE [data]
GO

SELECT
   sys.columns.name AS ColumnName,
   tables.name AS TableName
FROM
  sys.columns
JOIN sys.tables ON
  sys.columns.object_id = tables.object_id
WHERE
 sys.columns.name like '%ord_no%' -- <- to find all tables, change sys.tables.name like '%oeord%';
