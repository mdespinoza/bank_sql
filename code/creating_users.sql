-- Create a user in the DB
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password'; --- note the password here should be changed to something more secure than 'password' 
-- Grant privileges to the user in the DB
GRANT ALL PRIVILEGES ON * . * TO 'user'@'localhost';
-- Flush privileges
FLUSH PRIVILEGES;

-- @block: creating another user that only has access to the database 'bank_db' with all privileges and can only be accessed from the localhost
CREATE USER 'bank_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON bank_db.* TO 'bank_user'@'localhost';
FLUSH PRIVILEGES;

-- @block: creating another user that only has access to the database 'bank_db' with all privileges and can be accessed from any host
-- create a user that can access with any host
CREATE USER 'bank_user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON bank_db.* TO 'bank_user'@'%';
FLUSH PRIVILEGES;