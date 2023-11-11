UPDATE EXA_DB.QUERYDIM
SET PORNQUERY =
    CASE
        WHEN LOWER(QUERY) LIKE '%xxx%' THEN true
        WHEN LOWER(QUERY) LIKE '%porn%' THEN true
        WHEN LOWER(QUERY) LIKE '%sex%' THEN true
        WHEN LOWER(QUERY) LIKE '%fuck%' THEN true
        ELSE false
    END

