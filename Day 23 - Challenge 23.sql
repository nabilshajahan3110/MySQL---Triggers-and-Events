
# DAY 23 - Challenge 23

# TRIGGERS AND EVENTS

USE Challenge;

CREATE TABLE Teachers (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Subject VARCHAR(50),
    Experience INT,
    Salary DECIMAL(10,2)
);

INSERT INTO teachers (Name, Subject, Experience, Salary) VALUES
('Alice Johnson', 'Mathematics', 5, 50000.00),
('Bob Smith', 'Science', 8, 55000.00),
('Carol Davis', 'English', 6, 52000.00),
('David Wilson', 'History', 10, 60000.00),
('Eva Brown', 'Geography', 7, 54000.00),
('Frank Miller', 'Art', 4, 48000.00),
('Grace Lee', 'Physics', 9, 57000.00),
('Hannah White', 'Chemistry', 3, 47000.00);

SELECT * FROM Teachers;

# 1. Create a before insert trigger named before_insert_teacher that will 
# raise an error “salary cannot be negative” if the salary 
# inserted to the table is less than zero

DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON Teachers FOR EACH ROW
BEGIN

IF NEW.Salary < 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be negative value';

END IF;

END $$
DELIMITER ;

INSERT INTO teachers (Name, Subject, Experience, Salary) VALUES
('Barry Allen', 'Mathematics', 5, -50000.00);