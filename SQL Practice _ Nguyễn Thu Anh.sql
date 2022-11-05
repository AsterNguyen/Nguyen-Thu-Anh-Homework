Thu Anh Nguyen

---Exercise 1---
select department_id from employees where last_name='Zlotkey'
---80
select last_name, hire_date from employees 
where department_id in (select department_id from employees where last_name='Zlotkey')
and last_name <> 'Zlotkey'

---Exercise 2---
select avg(salary) from employees
---6,461.68---
select employee_id, last_name, salary from employees 
where salary > (select avg(salary) from employees) 
order by salary asc 

---Exercise 3---
select department_id, last_name from employees 
where last_name like '%u%'

select employee_id, last_name from employees
where department_id in (select department_id from employees where last_name like '%u%')

---Exercise 4---
--Option 1
select e.last_name, e.department_id, e.job_id 
from employees e join departments d 
on e.department_id = d.department_id
where d.location_id = 1700

--Option 2
select last_name, department_id, job_id from employees
where department_id in
(select department_id from departments where location_id = 1700)

---Exercise 5---
--Option 1
select last_name, salary from employees 
where manager_id in
(select employee_id from employees where last_name='King')

--Option 2
select e.last_name, e.salary from employees e 
join employees manager 
on e.manager_id = manager.employee_id
where manager.last_name = 'King'

---Exercise 6---
--Option 1
select department_id, last_name, job_id from employees 
where department_id in 
(select department_id from departments where department_name = 'Executive')

--Option 2
select e.department_id, e.last_name, e.job_id from
employees e join departments d
on e.department_id = d.department_id 
where d.department_name = 'Executive'

---Exercise 7---
select employee_id, last_name, salary from employees
where salary > (select avg(salary) from employees)
And department_id in (select department_id from employees where last_name like '%u%')

---Exercise 8---
select cast(round(max(salary), 0) as int) Maximum, 
cast(round(min(salary), 0) as int) Minimum, 
cast(round(sum(salary), 0) as int) Sum, 
cast(round(avg(salary), 0) as int) Average from employees

---Exercise 9---
select last_name, len(last_name) name_length
from employees 
where last_name like '[JAM]%'
order by last_name

---Exercise 10---
select employee_id, last_name, salary, 
cast(round(salary*1.155,0) as int) New_Salary from employees

---Exercise 11---
SELECT e.last_name, e.department_id, d.department_name
FROM employees e
FULL JOIN departments d
ON e.department_id = d.department_id

---Exercise 12---
select e.employee_id, e.first_name, e.last_name, e.hire_date 
from employees e
join employees manager
on e.manager_id=manager.employee_id
where e.hire_date > manager.hire_date
and e.department_id in (select department_id from departments 
where location_id in (select location_id from locations where city = 'Toronto'))