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

select * from retirement_info