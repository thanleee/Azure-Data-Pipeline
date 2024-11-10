USE last_data_db
GO
CREATE OR ALTER PROC CreateSQLServelessViewData @ViewName NVARCHAR(100)
AS
BEGIN
    DECLARE @statement VARCHAR(MAX)
    set @statement = N'Create or alter view' + @ViewName+
    ' AS
    SELECT * FROM OPENROWSET(
        BULK ''https://fdestg.dfs.core.windows.net/gold/SalesLT/'+ @ViewName +'/'',
        FORMAT = ''DELTA''
    ) AS [result]'
    EXEC (@statement)
END
GO