Search for a USER

>>> Queries per hour

SELECT AnonID, "day of the year", "hour", COUNT(*) AS entry_count
FROM EXA_DB.USER_SESSIONS
WHERE AnonID = '476982'
GROUP BY AnonID, "day of the year", "hour"
ORDER BY "day of the year", "hour";

>>>> All Queries of a USER

SELECT *
FROM EXA_DB.USER_SESSIONS sess
WHERE AnonID = '476982'
    --AND "day of the year" = 095
ORDER BY TIME_SPAMP_SECOND;
