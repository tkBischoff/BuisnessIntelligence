SELECT
    p.QUERY,
    t.WEEKDAY,
    t."day of the year",
    t."hour",
    f.ANONID,
    f.TIMEID,
    COUNT(*) AS record_count
FROM EXA_DB.FACTS f
JOIN EXA_DB.PORN_QUERIES p ON f.QUERYID = p.ID
JOIN EXA_DB.TIMEDIM t ON f.TIMEID = t.ID
GROUP BY GROUPING SETS (
    (p.QUERY, f.ANONID, f.TIMEID, t."day of the year"),
    (p.QUERY, f.ANONID, f.TIMEID, t.WEEKDAY),
    (p.QUERY, f.ANONID, f.TIMEID, t."hour")
)
ORDER BY
    CASE
        WHEN GROUPING(t."day of the year") = 0 THEN t."day of the year"
        WHEN GROUPING(t.WEEKDAY) = 0 THEN t.WEEKDAY
        WHEN GROUPING(t."hour") = 0 THEN t."hour"
    END,
    p.QUERY, f.ANONID, f.TIMEID;
