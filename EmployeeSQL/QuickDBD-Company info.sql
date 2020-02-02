-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/CfomLM
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" char(10)   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" char(10)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" char(10)   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "gender" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" int   NOT NULL,
    "title" varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

select * from departments
select* from dept_emp
select * from dept_manager
select * from employees
select * from salaries
select * from titles

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no,e.first_name, e.last_name,e.gender ,s.salary
FROM salaries as s
INNER JOIN employees AS e ON
e.emp_no =s.emp_no;

-- 2. List employees who were hired in 1986.

SELECT * FROM employees WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

-- 3. List the manager of each department with the following information: department number, department name, 
-- -- -- the manager's employee number, last name, first name, and start and end employment dates
select dm.dept_no, d.dept_name,dm.emp_no,dm.from_date,dm.to_date,e.last_name,e.first_name
from departments as d,dept_manager as dm, employees as e 
where dm.emp_no=e.emp_no
and dm.dept_no = d.dept_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select de.emp_no,e.last_name, e.first_name,d.dept_name 
from departments as d, dept_emp as de, employees as e
where e.emp_no=de.emp_no
and d.dept_no=de.dept_no

-- -- -- 5. List all employee whose first name is "Hercules" and last names begin with "B."
select * from employees
where first_name like 'Hercules%' and last_name like 'B%'

-- -- -- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
 
--  SELECT e.emp_no,e.last_name,e.first_name
-- FROM employees as e
-- WHERE emp_no IN
-- (
--   SELECT emp_no
--   FROM dept_emp
--   WHERE dept_no IN
--   (
--     SELECT dept_no
--     FROM departments
--     WHERE dept_name='Sales'
--   )
-- );

-- select e.emp_no, e.last_name,e.first_name,d.dept_name
-- from departments as d
-- join employees as e on de.emp_no=e.emp_no
-- select de.emp_no 
-- join dept_emp as de on d.dept_no=de.dept_no
-- where d.dept_name='Sales'



-- -- -- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


-- -- -- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.


