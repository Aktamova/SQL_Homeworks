--Homework 1
/*Independent Subquery Question
Scenario:
You have two tables:
books: Contains information about books (id, title, author_id).
authors: Contains information about authors (id, name, country).
Write a query to find the titles of all books written by authors from 'United Kingdom'.*/

CREATE TABLE authors (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE books (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);
INSERT INTO authors (id, name, country) VALUES
(1, 'J.K. Rowling', 'United Kingdom'),
(2, 'George Orwell', 'United Kingdom'),
(3, 'Mark Twain', 'United States');

INSERT INTO books (id, title, author_id) VALUES
(1, 'Harry Potter', 1),
(2, '1984', 2),
(3, 'The Adventures of Tom Sawyer', 3);

-- with join
select books.id, name as Author, title as Book, country from authors
join books on authors.id = books.author_id
where country = 'United Kingdom'

-- with subquery
select * from books
where author_id = (select id from authors where country = 'United Kingdom')

--Homework 2
/*Correlated Subquery Question
Scenario:
You have a table employees with the following columns:

id: Employee ID.
name: Employee name.
department_id: Department the employee belongs to.
salary: Employee's salary.
Write a query to find the names of employees whose salaries are higher than the average salary of their respective departments.*/

