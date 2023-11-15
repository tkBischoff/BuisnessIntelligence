CREATE OR REPLACE TABLE EXA_DB.MAP_QUERY_CATEGORY AS (
    SELECT
        category.ID AS CATEGORY_ID,
        pq.ID AS QUERY_ID
    FROM EXA_DB.FACTS facts
    INNER JOIN EXA_DB.QUERYDIM query
        ON
            facts.QUERYID = query.ID
    INNER JOIN EXA_DB.ANONIDDIM anonid
        ON
            facts.ANONID = anonid.ID
    INNER JOIN EXA_DB.PORN_QUERIES pq
        ON
            pq.ID = query.ID
    INNER JOIN EXA_DB.CATEGORY category
        ON
            LOWER(query.QUERY) LIKE '%' || LOWER(category.CATEGORY) || '%'
    WHERE
        anonid.STATEID IS NOT NULL
)