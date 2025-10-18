Create database onlinebookstore;
use onlinebookstore;

-- create primary key for books(bookID) --
create table Book (
BookID INT PRIMARY KEY,
Title VARCHAR (100),
Author VARCHAR(100),
ISBN VARCHAR(30)
);

-- Create  foreign key in orders (bookId) --
create table orders (
orderID INT PRIMARY KEY,
orderdate date,
BookID INT,
foreign key (BookID) references Book(BookID)
);

-- add  a unique constrint to the ISBN column in book --
alter table Book
add constraint unique_isbn unique (ISBN);

insert into Book (BookID,title,author,ISBN) values (101,"Ponnian selvan","Kalki",777);
insert into orders (orderID,BookID) values (456,101);

-- deletebremove selected rows --
Delete from orders
where orderID = 456;

-- Truncate remove all rows but keeps the table structure --
Truncate table orders;