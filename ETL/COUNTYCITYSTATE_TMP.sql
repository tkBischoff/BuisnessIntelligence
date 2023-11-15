CREATE TABLE TMP_TABLES.COUNTYCITYSTATE AS
SELECT
    anonid.ANONID,
    query.QUERY,
    "state".NAME AS "STATE",
    county.NAME AS COUNTY,
    city.NAME AS CITY
FROM EXA_DB.FACTS facts
INNER JOIN EXA_DB.ANONIDDIM anonid
    ON
        facts.ANONID = anonid.ANONID
INNER JOIN EXA_DB.QUERYDIM query
    ON
        facts.QUERYID = query.ID
LEFT JOIN EXA_DB."STATE" "state"
    ON
        LOWER(query.QUERY) LIKE '% ' || LOWER("state".NAME) || ' %'
LEFT JOIN EXA_DB.COUNTY county
    ON
        LOWER(query.QUERY) LIKE '% ' || LOWER(county.NAME) || ' county%'
LEFT JOIN EXA_DB.CITY city
    ON
        LOWER(query.QUERY) LIKE '% ' || LOWER(city.NAME) || ' %'
        AND city.POPULATION > 100000
ORDER BY
    anonid.ANONID