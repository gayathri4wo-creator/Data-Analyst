CREATE DATABASE BookStore_DB;
USE BookStore_DB;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    BookID INT
);
INSERT INTO Orders VALUES
(201, 'Anu', 1001),
(202, 'Ram', 1002),
(203, 'Sam', 1003);
CREATE TABLE Order_History (
    OrderID INT,
    CustomerName VARCHAR(100),
    BookID INT,
    DeletedOn DATETIME
);

-- Trigger --
DELIMITER $$
CREATE TRIGGER AfterOrderDelete
AFTER DELETE
ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO Order_History VALUES 
    (OLD.OrderID, OLD.CustomerName, OLD.BookID, NOW());
END $$
DELIMITER ;
-- Test the Trigger --
DELETE FROM Orders WHERE OrderID = 202;
SELECT * FROM Order_History;

-- DCL Commands --
-- Grant --
GRANT SELECT ON BookStore_DB.* TO 'devi' @'localhost';
-- Revoke -- 
REVOKE SELECT ON BookStore_DB.* FROM 'devi' @'localhost';

-- TCL Commands --
CREATE TABLE Accounts (
    AccNo INT,
    Balance DECIMAL(10,2)
);
INSERT INTO Accounts VALUES
(501, 5000.00),
(502, 3000.00);

START TRANSACTION;
SET SQL_SAFE_UPDATES = 0;

-- Step 1: Debit
UPDATE Accounts
SET Balance = Balance - 2000
WHERE AccNo = 501;

-- Step 2: Savepoint after debit
SAVEPOINT after_debit;

-- Step 3: Error simulation
UPDATE Accounts
SET Balance = Balance + 2000
WHERE AccNo = 999;   --  Acc 999 does not exist --

-- Step 4: Since error occurred, rollback to the savepoint
ROLLBACK TO after_debit;

-- Step 5: End transaction
COMMIT;