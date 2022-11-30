

-- Call upon the two required tables, select the requried columns and merge on employee number.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;
    

-- This time we call upon the required columns with a caveat of limiting the hire year to 1986
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
-- 36150 employees were hired in 1986



-- This time we utilize the employees table as a base, filter out just the managers of all departments
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_manager AS dm
    ON (dm.emp_no = e.emp_no)
INNER JOIN departments AS d
    ON (dm.dept_no = d.dept_no);
    

-- Fairly Simple, We implement the same method used to perform the previous query.
SELECT e.emp_no, de.dept_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
    ON (de.emp_no = e.emp_no)
INNER JOIN departments AS d
    ON (d.dept_no = de.dept_no);
    

--Call upon the Employees Table, select the emploees who's first name is Hercules and Last name starts with the letter 'B'
SELECT first_name, last_name, sex
FROM employees 
WHERE (first_name LIKE 'Hercules') AND last_name like 'B%'


-- Join in the department no. into the employees table in order to isolate all emplyees from sales.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_emp AS de
    ON (de.emp_no = e.emp_no)
WHERE de.dept_no LIKE 'd007';

-- Select the required Departments and join in the relavant employee information alongside their Department names. 
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e
    ON (e.emp_no = de.emp_no)
INNER JOIN departments AS d
    ON (d.dept_no = de.dept_no)
WHERE d.dept_no IN ('d007', 'd005')
;

--Lastly, We perform a GroupBy and AN Orderby operation inorder to sort how many employees 
-- share each last name 
SELECT COUNT(last_name) AS name_count, last_name
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;



