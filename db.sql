
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
    quest_desc [NVARCHAR](300) NOT NULL,
    correct_ans [NVARCHAR](50) NOT NULL,
    ans1 [NVARCHAR](50) NOT NULL,
    ans2 [NVARCHAR](50) NOT NULL,
    quest_category [NVARCHAR](50) NOT NULL
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
 
-- Insert rows into table 'questions'
INSERT INTO questions
( -- columns to insert data into
 [questId], [quest_desc], [correct_ans], [ans1], [ans2], [quest_category]
)
VALUES
( -- first row: values for the columns in the list above
 '1', 'What golfers first name means "Victory" in Hindi?', 'Vijay Singh','Vinay Deris','Vijay ahgg','Golf'
),
( -- Second row: values for the columns in the list above
 '2', 'As of 2019, who is the only player in NBA history to have sired three sons who also played in the NBA?', 'Rick Barry','Barry James','Deris Hugo','Basketball'
),
( -- third row: values for the columns in the list above
 '3', 'Which team actually chose the long-lasting Vince Carter during 1998 NBA Draft?', 'Golden State Warriors','Celtics','Cleaveland Calvaliers','Basketball'
),
( -- fourth row: values for the columns in the list above
 '4', 'Muhammad Ali retired from boxing in 1981, what was his career record?', '55 wins, 5 defeats','50 wins, 0 defeats','5 wins, 5 defeats','Boxing'
),
( -- fifth row: values for the columns in the list above
 '5', 'Which NBA player infamously turned down a $21-million contract in 2004 and saw his career end soon afterwards?', 'Latrell Sprewell','Lebron James','Latel Spreewell','Basketball'
),
( -- sixth row: values for the columns in the list above
 '6', 'Which famous golf player was nicknamed "Golden Bear"?', 'Jack Nicklaus','Thomas Gray','Tonny Gretchen','Golf'
),
( -- seventh row: values for the columns in the list above
 '7', 'Tiger Woods became a professional golfer in what year?', '1996','1994','1999','Golf'
),
( -- eighth row: values for the columns in the list above
 '8', 'What is the average total length of a NFL football game?', '3 Hours','1 1/2 Hours','2 Hours','Football'
),
( -- nineth row: values for the columns in the list above
 '9', 'Which team plays at the oldest stadium in the NFL?', 'Chicago Bears','Chicago Cubs','Chicago Bulls','Football'
),
( -- tenth row: values for the columns in the list above
 '10', 'In what year was Michael Jackson featured as the halftime entertainment during the Super Bowl?', '1993','1995','1997','Football'
),
( -- eleventh row: values for the columns in the list above
 '11', 'Who is the only NFL player to have also played in the MLB World Series?', ' Deion Sanders',' Dennis anders',' nion Flander','Football'
),
( -- twelveth row: values for the columns in the list above
 '12', 'Which of the following is not a term that is used in the game of golf?', 'Offside','Ace','Fore','Golf'
),
( -- thirteenth row: values for the columns in the list above
 '13', 'Which Country won the 2015 Davis Cup?', 'Great Britain','France','USA','Soccer'
),
( -- fourteenth row: values for the columns in the list above
 '14', 'Eden Hazard is a member of which 2018 National Team?', 'Belgium','Brazil','Germany','Soccer'
),
( -- fifteenth row: values for the columns in the list above
 '15', 'Who was the captain of Spain in FIFA World Cup 2010?', 'Josef Martinez','Ronaldo','Perri Jose','Soccer'
),
( -- sixteenth row: values for the columns in the list above
 '16', 'In soccer, an "Olympic Goal" is a scored shot taken from the?', 'Corner Area','Free-kick Area','Penalty Area','Soccer'
),
( -- seventeenth row: values for the columns in the list above
 '17', 'What is Lionel Messi nickname?', 'The Flea','The Magician','The Foot','Soccer'
),
( -- eighteenth row: values for the columns in the list above
 '18', 'Who was the first woman to be inducted into the Soccer Hall of Fame?', 'April Heinrichs','April Dubios','Angela Hagris','Soccer'
),
( -- nineteenth row: values for the columns in the list above
 '19', 'For what club did Leo Messi play for in his youth career, 1995-2000?', 'Newells Old Boys','Newells Young Men','Newells Boys','Soccer'
),
( -- twentieth row: values for the columns in the list above
 '20', 'How many World Cups has Mia Hamm played in?', 'Four','Five','Three','Soccer'
)
-- add more rows here
GO

SELECT * FROM questions WHERE quest_category LIKE '%Football%'