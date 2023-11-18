WITH SessionData AS (
    SELECT
        AnonID,
        "day of the year",
        "TIME_SPAMP_SECOND",
        "hour", "minute", "second",
        "URL",
        CASE
            WHEN (LEAD("TIME_SPAMP_SECOND") OVER (PARTITION BY AnonID ORDER BY AnonID,"day of the year", "hour", "minute", "second") - "TIME_SPAMP_SECOND") > 60*60*0.5 AND 
                "TIME_SPAMP_SECOND" != LEAD("TIME_SPAMP_SECOND") OVER (PARTITION BY AnonID ORDER BY AnonID, "day of the year", "hour", "minute", "second") OR 
                ANONID != LEAD(ANONID) OVER (PARTITION BY AnonID ORDER BY AnonID, "day of the year", "hour", "minute", "second") THEN 'session_end'
            ELSE 'TRUE'
        END AS is_session
    FROM
        EXA_DB.USER_SESSIONS
    ORDER BY
        AnonID,
        "day of the year", "hour", "minute", "second"
)
, URLFrequency AS (
    SELECT
        "URL",
        COUNT(*) AS frequency
    FROM
        SessionData
    WHERE
        is_session = 'session_end'
    GROUP BY CUBE
        ("URL")
)
SELECT
    u."URL",
    u.frequency,
    ROUND(u.frequency / first_entry.frequency * 100, 2) AS Percentage
FROM
    URLFrequency u
JOIN (
    SELECT
        MAX(frequency) AS frequency
    FROM
        URLFrequency
) first_entry ON 1 = 1
ORDER BY
    u.frequency DESC;
