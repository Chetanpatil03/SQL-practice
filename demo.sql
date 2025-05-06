CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender CHAR(1),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    EnrollmentDate DATE
);

INSERT INTO Student (StudentID, FirstName, LastName, DateOfBirth, Gender, Email, PhoneNumber, EnrollmentDate)
VALUES 
(1, 'John', 'Doe', '2000-01-15', 'M', 'john.doe@example.com', '1234567890', '2023-09-01'),
(2, 'Jane', 'Smith', '1999-05-22', 'F', 'jane.smith@example.com', '0987654321', '2023-09-01');

UPDATE Student
SET FirstName = 'Ravi'
WHERE StudentID = 1;

