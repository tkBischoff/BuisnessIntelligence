-- Create a temporary table with unique row identifiers (temporary id)
CREATE TABLE TEMP_PORN_QUERIES AS
SELECT ROW_NUMBER() OVER (ORDER BY ID, KEYWORD1, KEYWORD2) AS TEMP_ID, t.*
FROM PORN_QUERIES t;

-- Now, replace the original table with the temporary one
DROP TABLE PORN_QUERIES;
ALTER TABLE TEMP_PORN_QUERIES RENAME TO PORN_QUERIES;

-- Delete all duplicate rows
DELETE FROM PORN_QUERIES
WHERE TEMP_ID NOT IN (
    SELECT MIN(TEMP_ID)
    FROM TEMP_PORN_QUERIES
    GROUP BY ID
);

-- Delete the temporary id column
ALTER TABLE PORN_QUERIES DROP COLUMN TEMP_ID;
