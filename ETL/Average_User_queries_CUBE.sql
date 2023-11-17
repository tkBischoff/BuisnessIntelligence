>>>>>>> Make Number of queries and Users with p-relation (COUNT)

SELECT
  count_type,
  SUM(count) as all_data,
  SUM(count_2) as p_data,
  ROUND(SUM(count_2) * 1.0 / SUM(count), 3) * 100 as percentage
FROM (
  SELECT 'query_count' as count_type, COUNT(QUERY) as count, NULL as count_2 FROM EXA_DB.QUERYDIM
  UNION ALL
  SELECT 'query_count' as count_type, NULL as count, COUNT(QUERY)  as count_2 FROM EXA_DB.USER_SESSIONS
  UNION ALL
  SELECT 'user_count' as count_type, NULL as count, COUNT(DISTINCT ANONID) as count_2 FROM EXA_DB.USER_SESSIONS
  UNION ALL
  SELECT 'user_count' as count_type, COUNT(DISTINCT ANONID) as count, NULL as count_2 FROM EXA_DB.ANONIDDIM
) AS subquery
GROUP BY count_type;


>>>> One User days and hours of search (CUBE)

SELECT "day of the year", "hour", COUNT(*) AS entry_count
FROM EXA_DB.USER_SESSIONS
WHERE AnonID = '285780'
GROUP BY CUBE ("day of the year", "hour")
ORDER BY "day of the year", entry_count;
