CREATE TABLE TMP_TABLES.USER_STATE_MAP AS(
WITH
cte_state AS (
    SELECT
        ANONID,
        s.ID AS STATEID,
        COUNT("STATE") AS STATE_COUNT
    FROM TMP_TABLES.COUNTYCITYSTATE
    JOIN EXA_DB."STATE" s
        ON
            s.NAME = "STATE"
    GROUP BY
        ANONID,
        s.ID
),

cte_county AS (
    SELECT
        ANONID,
        c.STATEID AS STATEID,
        COUNT(c.NAME) AS COUNTY_COUNT
    FROM TMP_TABLES.COUNTYCITYSTATE
    INNER JOIN EXA_DB.COUNTY c
        ON
            c.NAME = COUNTY
    GROUP BY
        ANONID,
        c.ID,
        c.STATEID
),

cte_city AS (
    SELECT
        ANONID,
        c.STATEID AS STATEID,
        COUNT(c.NAME) AS CITY_COUNT
    FROM TMP_TABLES.COUNTYCITYSTATE
    INNER JOIN EXA_DB.CITY c
        ON
            c.NAME = CITY
    GROUP BY
        ANONID,
        C.STATEID
),

cte_state_counts AS (
    SELECT
        anondim.ANONID,
        st.ID AS STATEID,
        (
                COALESCE(SUM(cte_state.STATE_COUNT), 0)
                + COALESCE(SUM(cte_county.COUNTY_COUNT), 0)
                + COALESCE(SUM(cte_city.CITY_COUNT), 0)
        ) AS STATE_SUM
    FROM EXA_DB.ANONIDDIM anondim
    CROSS JOIN EXA_DB."STATE" st
    LEFT JOIN cte_state
        ON
            st.ID = cte_state.STATEID
            AND anondim.ANONID = cte_state.ANONID
    LEFT JOIN cte_county
        ON
            st.ID = cte_county.STATEID
            AND anondim.ANONID = cte_state.ANONID
    LEFT JOIN cte_city
        ON
            st.ID = cte_city.STATEID
            AND anondim.ANONID = cte_city.ANONID
    GROUP BY
        anondim.ANONID,
        st.ID
    ORDER BY
        anondim.ANONID,
        st.ID
),

cte_user_state_map AS (
    SELECT
        ANONID,
        STATEID,
        STATE_SUM
    FROM (
        SELECT
            ANONID,
            STATEID,
            STATE_SUM,
            ROW_NUM BER() OVER (
                PARTITION BY ANONID ORDER BY STATE_SUM DESC
            ) AS ROW_NUM
            FROM cte_state_counts
         ) ranked
    WHERE
        ROW_NUM = 1
        AND STATE_SUM != 0
        --AND ANONID = 242669
)

    SELECT * FROM cte_user_state_map
)




