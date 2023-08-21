CREATE TABLE dept_emp (
	emp_no INT ,
	dept_no VARCHAR (10) ,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR (10) ,
	emp_no INT ,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR (30) NOT NULL,
	birth_date VARCHAR (30) NOT NULL,
	first_name VARCHAR (30) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	sex VARCHAR (30) NOT NULL,
	hire_date VARCHAR (30) NOT NULL
);

CREATE TABLE salaries(
	emp_no INT ,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
); 

CREATE TABLE titles(
	title_id VARCHAR (10) NOT NULL PRIMARY KEY,
	title VARCHAR (30) NOT NULL
);