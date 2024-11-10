UPDATE [AdventureWorksLT2022].[SalesLT].[SalesOrderHeader]
SET [OrderDate] = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 365), '2007-01-01')
