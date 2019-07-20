--ANSWER TO QUESTION 1
SELECT employees.emp_no, employees.last_name, employees.first_name,employees.gender, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

--ANSWER TO QUESTION 2
SELECT * FROM employees
WHERE hire_date LIKE '1986%';

--ANSWER TO QUESTION 3

SELECT  dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager AS dm
   INNER JOIN departments AS d
       ON (dm.dept_no = d.dept_no)
   INNER JOIN employees AS e
       ON (dm.emp_no = e.emp_no);

--ANSWER TO QUESTION 4
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN departments AS d ON
de.dept_no = d.dept_no
INNER JOIN employees AS e ON
de.emp_no = e.emp_no


SELECT * FROM dept_emp
--ANSWER TO QUESTION 5
SELECT * FROM employees
WHERE first_name = 'Hercules' 
AND 
last_name LIKE 'B%';

--ANSWER TO QUESTION 6
SELECT dept_emp.emp_no,  employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
WHERE employees.emp_no IN(
	SELECT dept_emp.emp_no FROM dept_emp
	WHERE dept_no = 'd007');	
	
	
--ANSWER TO QUESTION 7
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN departments AS d ON
d.dept_no = de.dept_no
INNER JOIN employees AS e ON
de.emp_no = e.emp_no
WHERE e.emp_no IN(
	SELECT dept_emp.emp_no FROM dept_emp
WHERE dept_no = 'd005' OR dept_no = 'd007');


--ANSWER TO QUESTION 8
SELECT last_name, COUNT(last_name) as "Frequency" FROM employees 
GROUP BY last_name
ORDER BY "Frequency" DESC;

--Epilogue
SELECT salary
FROM salaries
WHERE emp_no = 499942