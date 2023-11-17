WITH cte_state_category_counts AS (
    SELECT
        s.NAME AS "STATE",
        category.CATEGORY,
        COUNT(category.CATEGORY) AS COUNT
    FROM EXA_DB.FACTS facts
    INNER JOIN EXA_DB.PORN_QUERIES pq
        ON
            pq.ID = facts.QUERYID
    INNER JOIN EXA_DB.ANONIDDIM anonid
        ON
            anonid.ID = facts.ANONID
    INNER JOIN EXA_DB."STATE" s
        ON
            S.ID = anonid.STATEID
    INNER JOIN EXA_DB.MAP_QUERY_CATEGORY mqc
        ON
            mqc.QUERY_ID = facts.QUERYID
    INNER JOIN EXA_DB.CATEGORY category
        ON
            category.ID = mqc.CATEGORY_ID
    GROUP BY
        s.NAME,
        category.CATEGORY
    ORDER BY
        s.NAME,
        category.CATEGORY
)

SELECT
    "STATE",
    CATEGORY
FROM (
    SELECT
        "STATE",
        CATEGORY,
        RANK() OVER (
            PARTITION BY "STATE" ORDER BY COUNT DESC
        ) AS ROW_NUM
    FROM cte_state_category_counts
)
WHERE
    ROW_NUM = 1
