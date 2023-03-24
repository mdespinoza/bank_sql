-- Create a database called bank_db
CREATE DATABASE bank_db;

-- @blockDROP TABLE branch;

USE bank_db;
-- @block
-- Create tables for the bank database based on the schema 
-- table 1: bank
CREATE TABLE bank(
    bank_id INT NOT NULL AUTO_INCREMENT,
    bank_name VARCHAR(50) NOT NULL,
    bank_address VARCHAR(50) NOT NULL,
    bank_city VARCHAR(50) NOT NULL,
    bank_state VARCHAR(50) NOT NULL,
    bank_zip VARCHAR(50) NOT NULL,
    bank_phone VARCHAR(50) NOT NULL,
    bank_email VARCHAR(50) NOT NULL,
    bank_total_accounts INT NOT NULL,
    bank_total_customers INT NOT NULL,
    PRIMARY KEY (bank_id)
);
-- table 2: branch 
CREATE TABLE branch(
    branch_id INT NOT NULL AUTO_INCREMENT,
    branch_name VARCHAR(50) NOT NULL,
    branch_address VARCHAR(50) NOT NULL,
    branch_city VARCHAR(50) NOT NULL,
    branch_state VARCHAR(50) NOT NULL,
    branch_zip VARCHAR(50) NOT NULL,
    branch_phone VARCHAR(50) NOT NULL,
    branch_email VARCHAR(50) NOT NULL,
    branch_total_accounts INT NOT NULL,
    branch_total_customers INT NOT NULL,
    PRIMARY KEY (branch_id),
    bank_id INT NOT NULL,
    FOREIGN KEY (bank_id) REFERENCES bank(bank_id) 
);
-- table 3: customer
CREATE TABLE customer(
    customer_id INT NOT NULL AUTO_INCREMENT,
    customer_first_name VARCHAR(50) NOT NULL,
    customer_last_name VARCHAR(50) NOT NULL,
    customer_middle_name VARCHAR(50) NOT NULL,
    customer_address VARCHAR(50) NOT NULL,
    customer_city VARCHAR(50) NOT NULL,
    customer_state VARCHAR(50) NOT NULL,
    customer_zip VARCHAR(50) NOT NULL,
    customer_social_security VARCHAR(50) NOT NULL,
    customer_phone VARCHAR(50) NOT NULL,
    customer_email VARCHAR(50) NOT NULL,
    customer_start_date DATE NOT NULL,
    customer_status VARCHAR(50) NOT NULL,
    PRIMARY KEY (customer_id),
    branch_id INT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);
-- table 4: account
CREATE TABLE account(
    account_id INT NOT NULL AUTO_INCREMENT,
    account_type VARCHAR(50) NOT NULL,
    account_balance INT NOT NULL,
    account_status VARCHAR(50) NOT NULL,
    PRIMARY KEY (account_id),
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
-- table 5: employee 
CREATE TABLE employee(
    employee_id INT NOT NULL AUTO_INCREMENT,
    employee_first_name VARCHAR(50) NOT NULL,
    employee_last_name VARCHAR(50) NOT NULL,
    employee_middle_name VARCHAR(50) NOT NULL,
    employee_address VARCHAR(50) NOT NULL,
    employee_city VARCHAR(50) NOT NULL,
    employee_state VARCHAR(50) NOT NULL,
    employee_zip VARCHAR(50) NOT NULL,
    employee_social_security VARCHAR(50) NOT NULL,
    employee_phone VARCHAR(50) NOT NULL,
    employee_email VARCHAR(50) NOT NULL,
    employee_start_date DATE NOT NULL,
    employee_position VARCHAR(50) NOT NULL,
    employee_salary INT NOT NULL,
    employee_status VARCHAR(50) NOT NULL,
    PRIMARY KEY (employee_id),
    branch_id INT NOT NULL,
    customer_id INT NOT NULL,
    account_id INT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
-- table 6: loan 
CREATE TABLE loan(
    loan_id INT NOT NULL AUTO_INCREMENT,
    loan_type VARCHAR(50) NOT NULL,
    loan_amount INT NOT NULL,
    loan_status VARCHAR(50) NOT NULL,
    PRIMARY KEY (loan_id),
    account_id INT NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- @block
USE bank_db;

-- insert 10 tuples of data into each table
INSERT INTO bank(bank_name, bank_address, bank_city, bank_state, bank_zip, bank_phone, bank_email, bank_total_accounts, bank_total_customers) VALUES
('Bank of America', '123 Main St', 'New York', 'NY', '10001', '123-456-7890', 'bankofamerica@fakeemail.com', 100, 100),
('Chase', '456 Main St', 'New York', 'NY', '10001', '123-456-7890', 'chase@fakeemail.com', 100, 100),
('Wells Fargo', '789 Main St', 'New York', 'NY', '10001', '123-456-7890', 'WellsFargo@fakeemail.com', 100, 100),
('Citibank', '101 Main St', 'New York', 'NY', '10001', '123-456-7890', 'Citibank@fakeemail.com', 100, 100),
('Capital One', '102 Main St', 'New York', 'NY', '10001', '123-456-7890', 'CapitalOne@fakeemail.com', 100, 100),
('PNC Bank', '103 Main St', 'New York', 'NY', '10001', '123-456-7890', 'PncBank@fakeemail.com', 100, 100),
('TD Bank', '104 Main St', 'New York', 'NY', '10001', '123-456-7890', 'TDbank@fakeemail.com', 100, 100),
('Bank of the West', '105 Main St', 'New York', 'NY', '10001', '123-456-7890', 'Bankofthewest@fakeemail.com', 100, 100),
('BB&T', '106 Main St', 'New York', 'NY', '10001', '123-456-7890', 'bbt@fakeemail.com', 100, 100),
('SunTrust', '107 Main St', 'New York', 'NY', '10001', '123-456-7890', 'suntrust@fakeemail.com', 100, 100);

INSERT INTO branch(branch_name, branch_address, branch_city, branch_state, branch_zip, branch_phone, branch_email, branch_total_accounts, branch_total_customers, bank_id) VALUES
('Bank of America 1', '123 Main St', 'New York', 'NY', '10001', '123-456-7890', 'bankofamerica_1@fakeemail.com', 100, 100, 1),
('Bank of America 2', '456 Main St', 'New York', 'NY', '10001', '123-456-7890', 'bankofamerica_2@fakeemail.com', 100, 100, 1),
('Bank of America 3', '789 Main St', 'New York', 'NY', '10001', '123-456-7890', 'bankofamerica_3@fakeemail.com', 100, 100, 1),
('Bank of America 4', '101 Main St', 'New York', 'NY', '10001', '123-456-7890', 'bankofamerica_4@fakeemail.com', 100, 100, 1),
('Bank of America 5', '102 Main St', 'New York', 'NY', '10001', '123-456-7890', 'bankofamerica_5@fakeemail.com', 100, 100, 1),
('Bank of America 6', '103 Main St', 'New York', 'NY', '10001', '123-456-7890', 'bankofamerica_6@fakeemail.com', 100, 100, 1),
('Bank of America 7', '104 Main St', 'New York', 'NY', '10001', '123-456-7890', 'bankofamerica_7@fakeemail.com', 100, 100, 1),
('Bank of America 8', '105 Main St', 'New York', 'NY', '10001', '123-456-7890', 'bankofamerica_8@fakeemail.com', 100, 100, 1),
('Bank of America 9', '106 Main St', 'New York', 'NY', '10001', '123-456-7890', 'bankofamerica_9@fakeemail.com', 100, 100, 1),
('Bank of America 10', '107 Main St', 'New York', 'NY', '10001', '123-456-7890', 'bankofamerica_10@fakeemail.com', 100, 100, 1);

INSERT INTO customer(customer_first_name, customer_last_name, customer_middle_name, customer_address, customer_city, customer_state, customer_zip, customer_social_security, customer_phone, customer_email, customer_start_date, customer_status, branch_id) VALUES
('John', 'Smith', 'Bob', '123 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0001', 'fake_01@fakeemail.com', '2019-01-01', 'Active', 1),
('Jane', 'Doe', 'Sarah', '456 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0002', 'fake_02@fakeemail.com', '2019-01-01', 'Active', 1),
('Bob', 'Smith', 'John', '789 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0003', 'fake_03@fakeemail.com', '2019-01-01', 'Active', 1),
('Mary', 'Doe', 'Rose', '101 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0004', 'fake_04@fakeemail.com', '2019-01-01', 'Active', 1),
('John', 'Doe', 'Ted', '102 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0005', 'fake_05@fakeemail.com', '2019-01-01', 'Active', 1),
('Jane', 'Smith', 'Mary', '103 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0006', 'fake_06@fakeemail.com', '2019-01-01', 'Active', 1),
('Bob', 'Doe', 'Matthew', '104 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0007', 'fake_07@fakeemail.com', '2019-01-01', 'Active', 1),
('Mary', 'Smith', 'Lamb', '105 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0008', 'fake_08@fakeemail.com', '2019-01-01', 'Active', 1),
('John', 'Doe', 'David', '106 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0009', 'fake_09@fakeemail.com', '2019-01-01', 'Active', 1),
('Jane', 'Smith', 'Marry', '107 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0010', 'fake_10@fakeemail.com', '2019-01-01', 'Active', 1);

INSERT INTO account(account_type, account_balance, account_status, customer_id) VALUES
('Checking', 100, 'Active', 1),
('Savings', 100, 'Active', 2),
('Checking', 100, 'Active', 3),
('Savings', 100, 'Active', 4),
('Checking', 100, 'Active', 5),
('Savings', 100, 'Active', 6),
('Checking', 100, 'Active', 7),
('Savings', 100, 'Active', 8),
('Checking', 100, 'Active', 9),
('Savings', 100, 'Active', 10);

INSERT INTO employee(employee_first_name, employee_last_name, employee_middle_name, employee_address, employee_city, employee_state, employee_zip, employee_social_security, employee_phone, employee_email, employee_start_date, employee_salary, employee_status, employee_position, branch_id, customer_id, account_id) VALUES
('John', 'Smith', 'Bob', '123 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0001', 'employee_01_bank_of_america@fakeemail.com', '2019-01-01', 70000, 'Active', 'Manager', 1, 1, 1),
('Jane', 'Doe', 'Sarah', '456 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0002', 'employee_02_bank_of_america@fakeemail.com', '2019-01-01', 85000, 'Active', 'Accountant', 1, 2, 2),
('Bob', 'Smith', 'John', '789 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0003', 'employee_03_bank_of_america@fakeemail.com', '2019-01-01', 35000, 'Active', 'Teller', 1, 3, 3),
('Mary', 'Doe', 'Rose', '101 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0004', 'employee_04_bank_of_america@fakeemail.com', '2019-01-01', 50000, 'Active', 'Loan Officer', 1, 4, 4),
('John', 'Doe', 'Ted', '102 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0005', 'employee_05_bank_of_america@fakeemail.com', '2019-01-01',  90000, 'Active', 'Manager', 1, 5, 5),
('Jane', 'Smith', 'Mary', '103 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0006', 'employee_06_bank_of_america@fakeemail.com', '2019-01-01', 50000, 'Active', 'Accountant', 2, 6, 6),
('Bob', 'Doe', 'Matthew', '104 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0007', 'employee_07_bank_of_america@fakeemail.com', '2019-01-01', 35435, 'Active', 'Teller', 1, 7, 7),
('Mary', 'Smith', 'Lamb', '105 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0008', 'employee_08_bank_of_america@fakeemail.com', '2019-01-01',  100000, 'Active','Loan Officer', 2, 8, 8),
('John', 'Doe', 'David', '106 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0009', 'employee_09_bank_of_america@fakeemail.com', '2019-01-01', 98345, 'Active', 'Manager', 1, 9, 9),
('Jane', 'Smith', 'Marry', '107 Main St', 'New York', 'NY', '10001', '123-456-7890', '123-456-0010', 'employee_10_bank_of_america@fakeemail.com', '2019-01-01', 43000, 'Active', 'Accountant', 1, 10, 10);

INSERT INTO loan(loan_type, loan_amount, loan_status, customer_id, account_id) VALUES
('Car', 10000, 'OPEN', 1, 1),
('Home', 20000, 'OPEN', 2, 2),
('School', 45000, 'OPEN', 3, 3),
('Business', 250000, 'CLOSED', 4, 4),
('Car', 80302, 'CLOSED', 5, 5),
('School', 100000, 'CLOSED', 6, 6),
('Car', 200000, 'CLOSED', 7, 7),
('Home', 400000, 'OVERDUE', 8, 8),
('Car', 600000, 'OVERDUE', 9, 9),
('Home', 7000000, 'OVERDUE', 10, 10);

-- @block
-- sample queries

SELECT * FROM customer WHERE customer_id = 1;

-- @block
SELECT * FROM account WHERE account_id = 1;

-- @block
SELECT * FROM employee WHERE employee_salary > 50000;


-- @block
USE bank_db;
-- running this block will delete all the tables above
DROP TABLE loan;
DROP TABLE employee;
DROP TABLE account;
DROP TABLE customer;
DROP TABLE branch;
DROP TABLE bank;

