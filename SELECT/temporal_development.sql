SELECT
    p.QUERY,
    t.WEEKDAY,
    t."day of the year",
    t."hour",
    f.ANONID,
    f.TIMEID,
    COUNT(*)
FROM EXA_DB.FACTS f
JOIN EXA_DB.PORN_QUERIES p ON f.QUERYID = p.ID
JOIN EXA_DB.TIMEDIM t ON f.TIMEID = t.ID
GROUP BY ROLLUP(p.QUERY, t.WEEKDAY, t."day of the year", t."hour", f.ANONID, f.TIMEID)
HAVING COUNT(*) > 1;
