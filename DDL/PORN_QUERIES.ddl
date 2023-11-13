CREATE TABLE EXA_DB.PORN_QUERIES AS
SELECT DISTINCT q.ID, q.QUERY, ck.KEYWORD1, ck.KEYWORD2
FROM EXA_DB.QUERYDIM q
JOIN EXA_DB.KEYWORDS1 ck
ON q.QUERY LIKE '%' || ck.KEYWORD1 || '%'
    AND q.QUERY LIKE '%' || ck.KEYWORD2 || '%'