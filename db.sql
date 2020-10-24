
/*
- Install SQL Managment Server To use with VSC
-- To run script you you need to the SQL Server
*/


-- Create a new database called 'SportzQuiz'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- -- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'SportzQuiz'
)
CREATE DATABASE SportzQuiz
GO

-- Create a new table called 'TableName' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('SportzQuiz.Users', 'U') IS NOT NULL
DROP TABLE SportzQuiz.Users
GO
-- Create the table in the specified schema
CREATE TABLE Users
(
    userId INT NOT NULL PRIMARY KEY , -- primary key column
    username [NVARCHAR](50) NOT NULL,
    email [NVARCHAR](50) NOT NULL,
    user_score [NVARCHAR](50) NOT NULL
    -- specify more columns here
);
GO

-- Create a new table called 'Quiz' in schema 'SportzQuiz'
-- Drop the table if it already exists
IF OBJECT_ID('SportzQuiz.quiz', 'U') IS NOT NULL
DROP TABLE SportzQuiz.quiz
GO
-- Create the table in the specified schema
CREATE TABLE quiz
(
    quizId INT NOT NULL PRIMARY KEY, -- primary key column
    category [NVARCHAR](50) NOT NULL,
    num_questions [NVARCHAR](50) NOT NULL,
    userId INT,
    FOREIGN KEY (userId) REFERENCES Users (userId)
    -- specify more columns here
);
GO

-- Create a new table called 'questions' in schema 'SportzQuiz'
-- Drop the table if it already exists
IF OBJECT_ID('SportzQuiz.questions', 'U') IS NOT NULL
DROP TABLE SportzQuiz.questions
GO
-- Create the table in the specified schema
CREATE TABLE questions
(
    questId INT NOT NULL PRIMARY KEY, -- primary key column
    quest_desc [NVARCHAR](70) NOT NULL,
    correct_ans [NVARCHAR](50) NOT NULL,
    ans1 [NVARCHAR](50) NOT NULL,
    ans2 [NVARCHAR](50) NOT NULL
    -- specify more columns here
);
GO

-- Insert rows into table 'Users'
INSERT INTO Users
( -- columns to insert data into
 [userId], [username], [email], [user_score]
)
VALUES
( -- first row: values for the columns in the list above
 '1', 'aoyetibo', 'gabesupo@gmail.com', '0'
),
( -- second row: values for the columns in the list above
 '2', 'gabesupo', 'aoyetibo@hotmail.com', '10'
),
( -- third row: values for the columns in the list above
 '3', 'gunther', 'gunther3209@gmail.com', '5'
)
-- add more rows here
GO

SELECT * FROM Users; 

-- Delete rows from table 'Users'
DELETE FROM Users
WHERE userId = 1	/* add search conditions here */
GO

/*
-- Allows user to Know whiuch sport quiz they played 
-- UserId Provides Foreing Key.
*/
-- Insert rows into table 'quiz'
INSERT INTO quiz
( -- columns to insert data into
 [quizId], [category], [num_questions], [userId]
)
VALUES
( -- first row: values for the columns in the list above
 '1', 'Soccer', '10', '3'
),
( -- second row: values for the columns in the list above
 '2', 'Football', '15', '1'
),
( -- second row: values for the columns in the list above
 '3', 'Hockey', '5', '2'
),
( -- second row: values for the columns in the list above
 '4', 'Soccer', '11', '2'
),
( -- second row: values for the columns in the list above
 '5', 'Basketball', '20', '3'
),
( -- second row: values for the columns in the list above
 '6', 'Baseball', '9', '1'
)
-- add more rows here
GO

-- Select rows from a Table or View 'quiz' in schema 'SchemaName'
SELECT * FROM quiz
 