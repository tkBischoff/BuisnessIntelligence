SELECT DISTINCT
    p.QUERY,
    t.WEEKDAY,
    t."day of the year",
    t."hour",
    f.ANONID,
    f.TIMEID
FROM FACTS f
JOIN PORN_QUERIES p ON f.QUERYID = p.ID
JOIN TIMEDIM t ON f.TIMEID = t.ID;