create database elearning;
use elearning;

-- Table creation

create table learners (
 learner_id  int primary key,
 full_name varchar(100),
 Country varchar (50)
 );
 
create table courses (
 course_id int primary key,
 course_name varchar(100),
 category varchar (50),
 unit_price decimal (10,2)
 );
 
create table purchases (
 purchase_id int primary key,
 learner_id int,
 course_id int,
 Quantity int,
 purchase_date date,
 foreign key (learner_id) references learners(learner_id),
 foreign key (course_id)  references courses(course_id)
 );
 
 -- Insert the values
 
Insert into learners VALUES
 (1, 'Indhira S', 'India'),
 (2, 'Rahul Kumar', 'India'),
 (3, 'Emily Johnson', 'USA'),
 (4, 'Ahmed Ali', 'UAE'),
 (5, 'Sophia Lee', 'Canada');
 
Insert into courses values
 (101, 'SQL for Beginners', 'Data', 1999.00),
 (102, 'Advanced Power BI', 'Data', 2999.00),
 (103, 'Python Programming', 'Programming', 2499.00),
 (104, 'Digital Marketing Basics', 'Marketing', 1799.00),
 (105, 'Excel for Analysts', 'Data', 1499.00);
 
Insert into purchases values
 (1001, 1, 101, 1, '2025-01-05'),
 (1002, 1, 102, 1, '2025-01-10'),
 (1003, 2, 103, 2, '2025-01-12'),
 (1004, 3, 101, 1, '2025-01-15'),
 (1005, 3, 104, 1, '2025-01-18'),
 (1006, 4, 105, 3, '2025-01-20'),
 (1007, 5, 102, 1, '2025-01-22');
 
 -- Using Inner Joins for Learner purchase details
 
select
 l.full_name as learner_name,
 l.country,
 c.course_name,
 c.category,
 p.quantity,
 format(p.quantity *c.unit_price, 2) as Total_amount,
 p.purchase_date 
 from purchases p
 inner join learners l
  on p.learner_id = l.learner_id
 inner join courses c
  on  p.course_id = c.course_id
 order by Total_amount DESC;
 
 -- Left joins for NOT purchase anything
 select 
    l.full_name AS learner_name,
    c.course_name,
    p.quantity,
    format(p.quantity * c.unit_price, 2) AS total_amount
from learners l
left join purchases p 
    on l.learner_id = p.learner_id
left join courses c 
    on p.course_id = c.course_id;
    
-- Right Join for never purchased
 select 
    c.course_name,
    l.full_name AS learner_name,
    p.quantity
from purchases p
right join courses c 
    on p.course_id = c.course_id
left join learners l
    on p.learner_id = l.learner_id;
    
-- Learner’s Total Spending and Country
 select 
    l.full_name as learner_name,
    l.country,
    format (SUM(p.quantity * c.unit_price), 2) as total_spent
from learners l
join purchases p 
    on l.learner_id = p.learner_id
join courses c 
    on p.course_id = c.course_id
group by l.learner_id, l.full_name, l.country
order by total_spent DESC;
 
-- Top 3 Most Purchased Courses by 
select 
    c.course_name,
    SUM(p.quantity) as total_quantity_sold
from courses c
join purchases p 
    on c.course_id = p.course_id
group by c.course_id, c.course_name
order by total_quantity_sold DESC
limit 3;

-- Category Revenue and Unique Learners  
select 
    c.category,
    format(SUM(p.quantity * c.unit_price), 2) as total_revenue,
    COUNT(DISTINCT p.learner_id) as unique_learners
from courses c
join purchases p 
    on c.course_id = p.course_id
group by c.category
order by total_revenue DESC;
 
-- Learners Who Purchased from More Than One Category
select 
    l.full_name as learner_name,
    COUNT(DISTINCT c.category) as category_count
from learners l
join purchases p 
    on l.learner_id = p.learner_id
join courses c 
    on p.course_id = c.course_id
group by l.learner_id, l.full_name
HAVING COUNT(DISTINCT c.category) > 1;
 
-- create database elearning;
use elearning;

-- Table creation

create table learners (
 learner_id  int primary key,
 full_name varchar(100),
 Country varchar (50)
 );
 
create table courses (
 course_id int primary key,
 course_name varchar(100),
 category varchar (50),
 unit_price decimal (10,2)
 );
 
create table purchases (
 purchase_id int primary key,
 learner_id int,
 course_id int,
 Quantity int,
 purchase_date date,
 foreign key (learner_id) references learners(learner_id),
 foreign key (course_id)  references courses(course_id)
 );
 
 -- Insert the values
 
Insert into learners VALUES
 (1, 'Indhira S', 'India'),
 (2, 'Rahul Kumar', 'India'),
 (3, 'Emily Johnson', 'USA'),
 (4, 'Ahmed Ali', 'UAE'),
 (5, 'Sophia Lee', 'Canada');
 
Insert into courses values
 (101, 'SQL for Beginners', 'Data', 1999.00),
 (102, 'Advanced Power BI', 'Data', 2999.00),
 (103, 'Python Programming', 'Programming', 2499.00),
 (104, 'Digital Marketing Basics', 'Marketing', 1799.00),
 (105, 'Excel for Analysts', 'Data', 1499.00);
 
Insert into purchases values
 (1001, 1, 101, 1, '2025-01-05'),
 (1002, 1, 102, 1, '2025-01-10'),
 (1003, 2, 103, 2, '2025-01-12'),
 (1004, 3, 101, 1, '2025-01-15'),
 (1005, 3, 104, 1, '2025-01-18'),
 (1006, 4, 105, 3, '2025-01-20'),
 (1007, 5, 102, 1, '2025-01-22');
 
 -- Using Inner Joins for Learner purchase details
 
select
 l.full_name as learner_name,
 l.country,
 c.course_name,
 c.category,
 p.quantity,
 format(p.quantity *c.unit_price, 2) as Total_amount,
 p.purchase_date 
 from purchases p
 inner join learners l
  on p.learner_id = l.learner_id
 inner join courses c
  on  p.course_id = c.course_id
 order by Total_amount DESC;
 
 -- Left joins for NOT purchase anything
 select 
    l.full_name AS learner_name,
    c.course_name,
    p.quantity,
    format(p.quantity * c.unit_price, 2) AS total_amount
from learners l
left join purchases p 
    on l.learner_id = p.learner_id
left join courses c 
    on p.course_id = c.course_id;
    
-- Right Join for never purchased
 select 
    c.course_name,
    l.full_name AS learner_name,
    p.quantity
from purchases p
right join courses c 
    on p.course_id = c.course_id
left join learners l
    on p.learner_id = l.learner_id;
    
-- Learner’s Total Spending and Country
 select 
    l.full_name as learner_name,
    l.country,
    format (SUM(p.quantity * c.unit_price), 2) as total_spent
from learners l
join purchases p 
    on l.learner_id = p.learner_id
join courses c 
    on p.course_id = c.course_id
group by l.learner_id, l.full_name, l.country
order by total_spent DESC;
 
-- Top 3 Most Purchased Courses by 
select 
    c.course_name,
    SUM(p.quantity) as total_quantity_sold
from courses c
join purchases p 
    on c.course_id = p.course_id
group by c.course_id, c.course_name
order by total_quantity_sold DESC
limit 3;

-- Category Revenue and Unique Learners  
select 
    c.category,
    format(SUM(p.quantity * c.unit_price), 2) as total_revenue,
    COUNT(DISTINCT p.learner_id) as unique_learners
from courses c
join purchases p 
    on c.course_id = p.course_id
group by c.category
order by total_revenue DESC;
 
-- Learners Who Purchased from More Than One Category
select 
    l.full_name as learner_name,
    COUNT(DISTINCT c.category) as category_count
from learners l
join purchases p 
    on l.learner_id = p.learner_id
join courses c 
    on p.course_id = c.course_id
group by l.learner_id, l.full_name
HAVING COUNT(DISTINCT c.category) > 1;
 
-- courses with no purchase
select 
    c.course_name,
    c.category
from courses c
left join purchases p 
    on c.course_id = p.course_id
where p.purchase_id is null;

select 
    c.course_name,
    c.category
from courses c
left join purchases p 
    on c.course_id = p.course_id
where p.purchase_id is null;
