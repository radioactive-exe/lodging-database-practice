-- SELECT
--     s.name AS [SchemaName],
--     t.name AS [TableName],
--     SUM(p.rows) AS [RowCount]
-- FROM sys.tables t
-- INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
-- INNER JOIN sys.partitions p ON t.object_id = p.object_id
-- WHERE p.index_id IN (0, 1) -- 0 = Heap, 1 = Clustered Index
-- GROUP BY s.name, t.name
-- ORDER BY SchemaName DESC;

EXEC sp_spaceused;

SELECT
    InstanceName = @@SERVERNAME,
    DatabaseName = DB_NAME(),
    FileType = type_desc,
    [Size_MB] = CAST(CAST(size AS DECIMAL(10,2)) * 8.0 / 1024 AS DECIMAL(10,2)),
    [Physical_Name] = physical_name
FROM sys.master_files
WHERE database_id = DB_ID();
