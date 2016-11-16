
--Create Table 
--users 
--(
--id int PRIMARY KEY NOT NULL, 
--name VARCHAR(40) NOT NULL, 
--date DATETIME2 NOT NULL);


--CREATE TABLE events 
--(
--id INT PRIMARY KEY NOT NULL, 
--type VARCHAR(15), 
--user_id INT NOT NULL, 
--date DATETIME2 NOT NULL, 
--FOREIGN KEY (user_id) REFERENCES users(id));


--use CohortAnalysis;

--drop table events
--drop table users

--exec sp_columns users

--select * from information_schema.columns 
--where table_name = 'users' order by ordinal_position

--select count(*) from users


--select * from information_schema.columns 
--where table_name = 'events' order by ordinal_position

--select count(*) from events


--SELECT * from users

--Split Users into Cohorts

Use CohortAnalysis

SELECT count(date) as users,
	month(date) as cohort
from users
group by month(date)
order by 2

--Split Events into Cohorts

SELECT count(date) as events,
	month(date) as cohort
from events
group by month(date)
order by 2

--In this query, we look at the total percent of twitter shares divided by the total # of engagements:

--Add rounding?'

--SELECT
--  (SELECT count(TYPE)
--   FROM events
--   WHERE TYPE= 'twitter share') AS twitter_shares,
--  (SELECT count(*)
--   FROM events) AS total,

--  (SELECT count(TYPE)
--   FROM events
--   WHERE TYPE= 'twitter share')/
--  (SELECT count(*)
--   FROM events)*100 AS percent_of_total;