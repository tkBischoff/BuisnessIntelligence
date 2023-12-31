# Search Query Data Analysis (Course "Business Intelligence")

### by Mariem Ben Salah, Tim Bischoff, Sebastian Rohrscheidt and Robert Wienröder
<br>
This project is part of the course "Business Intelligence" in BHT's Master's degree "Data Science"
<br>
For this task we collected and analyzed data of Web searches in 2006.
The main goal was to learn how to wrangle data (with ROLAP and SQL).

## Subtasks
1. Define five interesting analysis question on this data set.<br>
   You might pick up more, since not all chosen questions are answerable with the existing data and your additional data sources. 
2. Import missing data from one additional data source of your choice for resolving your queries into the database.<br>
   Use your knowledge on JDBC and Extract-Transform-Load. Please check legal issues when importing data from “The Web”.
3. Formalize at least five of your queries with ROLAP Statements on EXASOL.<br>
   Utilize operators such as SLICE, DICE, CUBE, ROLLUP, PARTITION BY, GROUPING SETS and other standard SQL statements such as joins,
   unions or intersections etc.
   (see the EXASOL manual for details on the syntax).
4. Display your results as charts, for example with http://d3js.org or JFreeChart 
5. Create a presentation for about 12 minutes and explain your analysis goal, your data sets, showcase selected “cool/surprising”
   queries and results/insights,
   explain why this is an important valuable finding, show your schema and explain your workload.
6. Create an appendix in your presentation, where you show the ROLAP queries and results as screenshots. Name on each slide, what this
   query should have done.
   Add to the appendix screenshots of the tables you created, including schema information.  
7. Upload this presentation to the Moodle-system with a filename <your name> (PDF/PPT) and present it in front of your peers.
   Check if your peers liked it and considered it insightful. ☺

## Additional remarks from the lecturer
I would be highly interested in: Understanding sessions, how users search, when users break up searches, typical user intentions or user journeys etc. 
There are many interesting data sources on the Web; some do come in an easily joinable format. 
https://query.wikidata.org
www.programmableweb.com
www.Internetarchive.com   + Memeto Protocol  [Fehler! Verweisquelle konnte nicht gefunden werden.]

## Evaluation criteria (50 points)
- Novelty and wow-factor regarding your topic
- Variety and soundness of SQL/ROLAP queries, results and table schema
- Efforts into data importing and cleansing
- Analytical insights
- Talk and slides



# Research Questions

### Overall Trends

1. categories of porn:<br>
   which porn categories are the most popular ones generally?<br>
   **MARIEM**

2. clicks:<br>
   which websites were clicked most often?<br>
   what were the queries/categories/keywords that generated the most clicks?<br>
   what queries/categories/keywords ended most sessions?<br>
   **MARIEM**

3. categories of users:<br>
   what percentage of users consumes porn on a regular basis/from time to time/never?<br>

4. traffic (sessions/queries):<br>
   what percentage of sessions and/or queries was porn-related?<br>
   *(yielding the overall percentage of the query traffic related to porn)*

### Temporal Trends

5. differences throughout:<br>
   the day?<br>
   the week?<br>
   the entire three months?<br>
   **ROBERT**

6. (possible) outliers:<br>
   what about outliers?<br>
   what about certain events? (for example on march 15th people were arrested for child porn stuff<br>
   **ROBERT**

7. sessions:<br>
   how long did the sessions related to porn usually go?<br>
   *(average duration, range of durations)*<br>

 
### Geographical Trends

8. states:<br>
   most popular categories per state?<br>
   how common are certain queries in different states?<br>
   **TIM**


### *kicked out:*

9. *demographic trends: split by age, gender, ethnicity, etc.*<br>

10. *illegal: which proportion does illegal stuff have?*<br>

