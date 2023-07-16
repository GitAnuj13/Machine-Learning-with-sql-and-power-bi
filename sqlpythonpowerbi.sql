SELECT *
FROM dataset
WHERE Surname IS NULL
OR CreditScore IS NULL
OR [Geography] IS NULL
OR Gender IS NULL
OR Age IS NULL
OR Tenure IS NULL
OR Balance IS NULL
OR NumOfProducts IS NULL
OR HasCrCard IS NULL
OR IsActiveMember IS NULL
OR EstimatedSalary IS NULL
OR Exited IS NULL

-- Identify duplicate records
SELECT EstimatedSalary, HasCrCard,surname,creditscore,[geography],Gender ,Age,Tenure,Balance,NumOfProducts,HasCrCard,IsActiveMember,Exited,COUNT(*) AS DuplicateCount
FROM dataset
GROUP BY EstimatedSalary, HasCrCard,Surname,CreditScore,[geography],Gender ,Age,Tenure,Balance,NumOfProducts,HasCrCard,IsActiveMember,Exited
HAVING COUNT(*) > 1;


select * from  dataset
-- Remove unnecessary columns
ALTER TABLE dataset
DROP COLUMN RowNumber;
ALTER TABLE dataset
DROP COLUMN Surname;

SELECT COUNT(CustomerId) AS Count
FROM dataset
GROUP BY CustomerId;

# so it is a primary key so we can delete it as it would not contribute in our prediction
ALTER TABLE dataset
DROP COLUMN Customerid;

SELECT COUNT(Surname) AS Count
FROM dataset
GROUP BY Surname;


SELECT 
    COLUMN_NAME AS ColumnName, 
    COUNT(*) AS TotalCount, 
    COUNT(ISNULL(COLUMN_NAME, 0)) AS NonNullCount, 
    COUNT(*) - COUNT(ISNULL(COLUMN_NAME, 0)) AS NullCount, 
    DATA_TYPE AS DataType
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = 'dbo'
    AND TABLE_NAME = 'dataset'
GROUP BY 
    COLUMN_NAME, DATA_TYPE




