select 
	count(*)
from employees
where birth_date between '1952-01-01' AND '1955-12-31';

-- retirement eligibility
select first_name, last_name
from  employees
where (birth_date between '1953-01-01' and '1955-12-31') 
 AND  (hire_date between '1985-01-01' and '1988-12-31')
;

--number of employees retiring
select count(first_name) from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31')

--retirement eligibility into the retirment_info
select first_name, last_name INTO retirement_info
from  employees
where (birth_date between '1953-01-01' and '1955-12-31') 
 AND  (hire_date between '1985-01-01' and '1988-12-31')
;

select * from retirement_info;


DROP TABLE retirement_info;

--retirement eligibility into the retirment_info
select emp_no, first_name, last_name INTO retirement_info
from  employees
where (birth_date between '1953-01-01' and '1955-12-31') 
 AND  (hire_date between '1985-01-01' and '1988-12-31')
;

select * from retirement_info


---- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

---- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

---- Joining retirement_info and dept_emp tables with alias
SELECT 
	ri.emp_no,
 	ri.first_name,
	ri.last_name,
    de.to_date
FROM retirement_info ri
LEFT JOIN dept_emp   de ON ri.emp_no = de.emp_no;

-- Joining departments and dept_manager tables
SELECT 
	d.dept_name,
    dm.emp_no,
    dm.from_date,
    dm.to_date
FROM departments d
INNER JOIN dept_manager dm ON d.dept_no = dm.dept_no;

--current employee list
select 
	ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
into current_emp
from retirement_info ri
left join dept_emp as de on ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');


-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
where 
GROUP BY de.dept_no;

-- Employee count by retirement_info
SELECT COUNT(ce.emp_no), de.dept_no
FROM retirement_info as ce
inner jOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

-- Employee Information
select 
	e.emp_no,
	e.first_name,
	e.last_name,
	e.gender
INTO emp_info 
FROM employees e
INNER JOIN salaries as s on e.emp_no = s.emp_no
inner join dept_emp as de on de.emp_no = e.emp_no
where (e.birth_date between '1952-01-01' AND '1955-12-31')
  AND (e.hire_date  between '1985-01-01' AND '1988-12-31')
  AND (de.to_date = '9999-01-01')
  ;
  

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);


--dept retirees
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
into dept_info
from current_emp as ce 
inner join dept_emp as de on ce.emp_no = de.emp_no
inner join departments as d on de.dept_no = d.dept_no

------------------------------------
-- retirement titles 
select  
	e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
from employees e 
inner join titles t on e.emp_no = t.emp_no
where (e.birth_date between '1952-01-01' and '1955-12-31');




-- unique titles
select DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
into unique_titles
from retirement_titles rt
order by rt.emp_no, rt.to_date desc;

-- 
-- retiring_titles
select count(1)as count , 
	title
into retiring_titles
from  unique_titles 
group by title
order by count(1) desc;


-- Eligibility Program
select DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	tt.title
INTO mentorship_eligibilty
from employees  e
inner join dept_emp de on e.emp_no = de.emp_no
inner join  titles   tt on e.emp_no = tt.emp_no 
where e.birth_date between '1965-01-01' and '1965-12-31'
order by e.emp_no, tt.from_date desc, tt.to_date desc, de.to_date desc

DROP TABLE mentorship_eligibilty

select * from mentorship_eligibilty