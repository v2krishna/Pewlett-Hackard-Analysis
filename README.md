# Pewlett-Hackard-Analysis

## Overview of Project
The main purpose of the project is to predict the number of employees eligible for retirement, to understand how many unique employees will be eligible per Job Title,
also get list of employees who are eligible for mentoring the new hires based on the age factor. This will help the HR Analyst to make sure the vacant positions will be replaced with the new hires and have enough people mentoring them.

### ERD Diagram 
Below Entity Relationship Diagram gives the HR related tables which are needed for our findings.
![EmployeeDB.png](/EmployeeDB.png.png)

## Number of Employees Retiring Per Title
In order to the find the Unique number of employees retiring per Job Title, followed the below steps:

1. Retrieve the list of employees born between 1952 and 1955
1. Join the table with  Titles to get the Job Title of each employee and add the from_date, to_date of each title.
1. Create a table "retirement_titles" <br/>
  ![retirement_titles](/retirement_titles.png) <br/>
1. Using the DISTINCT ON (emp_no) get the latest Job Title of each employee.
1. Create a temp table called "unique_titles"
  ![unique_titles](/unique_titles.png) <br/>
1. Final Step Retrieve the number of employees per Title <br/>
  ![retiring_titles](/retiring_titles.png)
  
