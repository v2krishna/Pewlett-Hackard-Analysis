# Pewlett-Hackard-Analysis

## Overview of Project
The main purpose of the project is to predict the number of employees eligible for retirement, to understand how many unique employees will be eligible per Job Title,
also get list of employees who are eligible for mentoring the new hires based on the age factor. This will help the HR Analyst to make sure the vacant positions will be replaced with the new hires and have enough people mentoring them.

### ERD Diagram 
Below Entity Relationship Diagram gives the HR related tables which are needed for our findings.
![EmployeeDB.png](/EmployeeDB.png.png)

## Results: 
###  Number of Employees Retiring Per Title
In order to the find the Unique number of employees retiring per Job Title, followed the below steps:

1. Retrieve the list of employees born between 1952 and 1955
1. Join the table with  Titles to get the Job Title of each employee and add the from_date, to_date of each title.
1. Create a table "retirement_titles" <br/>
  ![retirement_titles](/retirement_titles.png) <br/>
1. Using the DISTINCT ON (emp_no) get the latest Job Title of each employee.
1. Create a temp table called "unique_titles"  and export the data into unique_titles.csv <br/>
  ![unique_titles](/unique_titles.png) <br/>
1. Final Step Retrieve the number of retiring employees per Title <br/>
  ![retiring_titles](/retiring_titles.png) <br/>
1. Export the data into the retiring_titles.csv

### Mentorship Eligibility:
In order to find the employees who are eligible for mentoring the new hires.
1. Retrieve the list of employees who are born in 1965 
1. Join to the Dept_emp who are currently working in each dept
1. Get the Latest title for each employee
1. Final make sure you get he unique employee list with current title and load the data into mentorship_eligibilty
![mentorship_eligibilty](/mentorship_eligibilty.png)

## Summary:
1. Total number of employees that are eligible for retirement -- 90,398
1. Total number of new hires will be around same as the number of employees getting retired -- 90,398
1. Based on the observation, Senior Engineer and Senior Staff will be retiring more. So we need to make sure there are enough Senior Engineer and Senior Staff mentors should be available for mentoring the new hires.
1. There are total number of employees eligible for mentorship -- 1940 <br/>
1. Based on the Mentorship Eligible Data analysis, the number of new hires to mentors is 46 : 1, but there are no mentors in Manager position. 
1. Based on the current changes in the technologies, we can automate the routine tasks and re-evaluate which jobs needs to be filled with new hires. <br/>
![MentorsEligibleByTitles](/MentorsEligibleByTitles.png) <br/>


## Tools:
PostgresSQL, SQL

