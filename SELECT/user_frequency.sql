SELECT
    a.ANONID,
    t."day of the year",
    COUNT(*)
FROM EXA_DB.FACTS f
JOIN EXA_DB.TIMEDIM t ON f.TIMEID = t.ID
JOIN EXA_DB.PORN_QUERIES p ON f.QUERYID = p.ID
JOIN EXA_DB.ANONIDDIM a ON f.ANONID = a.ID
WHERE
    p.QUERY IS NOT NULL AND
    f.CLICK IS NOT FALSE
GROUP BY CUBE(a.ANONID, t."day of the year")
ORDER BY
    CASE
        WHEN GROUPING(a.ANONID) = 0 THEN a.ANONID
        WHEN GROUPING(t."day of the year") = 0 THEN t."day of the year"
    END;
