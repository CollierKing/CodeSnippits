Use AdventureWorks2012;

---------Performance Distribution with NTILE-------------
------------------Windowing Functions---------------

--One of our most important charts shows the loading time of the application, 
--which we monitor to ensure a user has a lightning fast experience.
--For the chart we’re after, we can use ntile to bin the data in sorted order. 
--ntile divides the rows evenly and sets the bin number for each row.
--We have our response times stored in client_timing_logs, and want to append the bin using ntile. 
--To do so, we’ll order by the app_duration column when assigning bins.

SELECT
WorkOrderID,
ProductID,
ScheduledStartDate,
ActualStartDate,
datediff(hh, ScheduledStartDate, ActualStartDate) as Hour_Delay,
ntile(10) over (order by datediff(hh, ScheduledStartDate, ActualStartDate) desc) as ntile

FROM Production.WorkOrderRouting
WHERE datediff(hh, ScheduledStartDate, ActualStartDate) >= '24'