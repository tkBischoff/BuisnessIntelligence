create or replace table EXA_DB.USER_SESSIONS
(
    ANONID            DECIMAL(18),
    "day of the year" VARCHAR(3) UTF8,
    "hour"            VARCHAR(2) UTF8,
    "minute"          VARCHAR(2) UTF8,
    "second"          VARCHAR(2) UTF8,
    QUERY             VARCHAR(5000) UTF8,
    URL               VARCHAR(5000) UTF8,
    TIME_SPAMP_SECOND DOUBLE
)
/

Quercies Tables:

>>>>> Make Table USER_SESSIONS

CREATE TABLE EXA_DB.USER_SESSIONS AS
SELECT DISTINCT facts.ANONID,
                timet."day of the year", timet."hour", timet."minute", timet."second",
                query.QUERY,
                url.URL,
                "day of the year" * 86400 + "hour" * 3600 + "minute" * 60 + "second" AS TIME_SPAMP_SECOND
FROM EXA_DB.QUERYDIM query

JOIN EXA_DB.KEYWORDS key ON query.QUERY LIKE '%' || key.KEYWORD1 || '%'
    AND query.QUERY LIKE '%' || key.KEYWORD2 || '%'
JOIN EXA_DB.FACTS facts ON query.ID = facts.QUERYID
JOIN EXA_DB.TIMEDIM timet ON facts.TIMEID = timet.ID
JOIN EXA_DB.URLDIM url ON facts.URLID = url.ID

GROUP BY AnonID, "day of the year", "hour", "minute", "second", "QUERY", "URL"
ORDER BY AnonID, "day of the year", "hour", "minute", "second";


>>>>>> MAKE USER_AVERAGE

CREATE TABLE EXA_DB.USER_AVERAGE AS
SELECT AnonID,
       COUNT(*) AS query_count,
       COUNT(DISTINCT "day of the year") AS search_days_count,
       ROUND(COUNT(*) / COUNT(DISTINCT "day of the year")) AS average_queries_per_day
FROM EXA_DB.USER_SESSIONS
GROUP BY AnonID
ORDER BY query_count DESC;
