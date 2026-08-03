SQL> Create table Studentage(StudentID int PRIMARY KEY, Name varchar(30), Age int);

Table created.

SQL> Insert into Studentage values(1,'Alice', 20);

1 row created.

SQL> Insert into Studentage values(2,'bob', 22);

1 row created.

SQL> Insert into Studentage values(3,'Charlie', 21);

1 row created.

SQL> Insert into Studentage values(4,'David', 19);

1 row created.

SQL> Create table Coursesage (CourseID int PRIMARY KEY, CourseName varchar(20));

Table created.

SQL> Insert into Coursesage values (101, 'Database Management');

1 row created.

SQL> Insert into Coursesage values (102, 'Algorithm');

1 row created.

SQL> Insert into Coursesage values (103, 'Web Development');

1 row created.

SQL> Create table Enrollmentsage (StudentID int REFERENCES Studentage(StudentID), CourseID int REFERENCES Coursesage(CourseID));

Table created.

SQL> Insert into Enrollmentsage values(1,101);

1 row created.

SQL> Insert into Enrollmentsage values(1,102);

1 row created.

SQL> Insert into Enrollmentsage values(2,102);

1 row created.

SQL> Insert into Enrollmentsage values(3,101);

1 row created.

SQL> Insert into Enrollmentsage values(3,103);

1 row created.

SQL> SELECT * FROM Studentage;

 STUDENTID NAME                                  AGE
---------- ------------------------------ ----------
         1 Alice                                  20
         2 bob                                    22
         3 Charlie                                21
         4 David                                  19

SQL> SELECT Name, Age FROM Studentage WHERE Age > 20;

NAME                                  AGE
------------------------------ ----------
bob                                    22
Charlie                                21

SQL> SELECT Name FROM Studentage WHERE StudentID IN (SELECT StudentID FROM Enrollmentsage WHERE CourseID = (SELECT CourseID FROM Coursesage WHERE CourseName = 'Database Management'));

NAME
------------------------------
Alice
Charlie

SQL> SELECT CourseID, CourseName FROM Coursesage WHERE CourseID IN ( SELECT CourseID FROM Enrollmentsage GROUP BY CourseID HAVING COUNT(*) > 1 );

  COURSEID COURSENAME
---------- --------------------
       101 Database Management
       102 Algorithm

SQL> SELECT AVG(Age) AS AverageAge FROM Studentage;

AVERAGEAGE
----------
      20.5

SQL> SELECT Name, Age FROM Studentage WHERE Age > (SELECT AVG(Age) FROM Studentage);

NAME                                  AGE
------------------------------ ----------
bob                                    22
Charlie                                21

