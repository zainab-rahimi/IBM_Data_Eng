# Dates in sql

To calculate age in sql from a date, we need to calculate the date difference between current date and birthdate in terms of year
```SELECT YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, BIRTH_DATE_column))) FROM table_name```

Another example to calculate the duration of a service

```SELECT EMPL_ID,
YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE))),
(SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE)))) 
FROM JOB_HISTORY) 
FROM JOB_HISTORY```
