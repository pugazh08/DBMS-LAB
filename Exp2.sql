SQL> Create table Studentwe (StudentID int, Name varchar(30), Age int);

Table created.

SQL> Insert into Studentwe values(1,’Alice’, 20);

1 row created.

SQL> Insert into Studentwe values(2,’bob’, 22);

1 row created.

SQL> Insert into Studentwe values(3,’Charlie’, 21);

1 row created.

SQL> Create table Courseswe (CourseID int, CourseName varchar(20));

Table created.

SQL> Insert into Courseswe values(101,’Maths’);

1 row created.

SQL> Insert into Courseswe values(102,’English’);

1 row created.

SQL> Insert into Courseswe values(103,’History’);

1 row created.

SQL> Create table Enrollmentswe (EnrollmentID int, StudentID int, CourseID int, Grade varchar(5));

Table created.

SQL> Insert into Enrollmentswe values(1,1,101,’A’);

1 row created.

SQL> Insert into Enrollmentswe values(2,1,102,’B’);

1 row created.

SQL> Insert into Enrollmentswe values(3,2,101,’A-’);

1 row created.

SQL> Insert into Enrollmentswe values(4,3,103,’B+’);

1 row created.

SQL> Insert into Enrollmentswe values(5,3,102,’A’);

1 row created.

SQL> SELECT Studentwe.StudentID, Studentwe.Name, Studentwe.Age, Courseswe.CourseID, Courseswe.CourseName, Enrollmentswe.Grade FROM Studentwe INNER JOIN Enrollmentswe ON Studentwe.StudentID = Enrollmentswe.StudentID INNER JOIN Courseswe ON Enrollmentswe.CourseID = Courseswe.CourseID;

 STUDENTID NAME                                  AGE   COURSEID
---------- ------------------------------ ---------- ----------
COURSENAME           GRADE
-------------------- -----
         2 bob                                    22        101
Maths                A-

         1 Alice                                  20        101
Maths                A

         3 Charlie                                21        102
English              A


 STUDENTID NAME                                  AGE   COURSEID
---------- ------------------------------ ---------- ----------
COURSENAME           GRADE
-------------------- -----
         1 Alice                                  20        102
English              B

         3 Charlie                                21        103
History              B+


SQL> SELECT Studentwe.StudentID, Studentwe.Name, Studentwe.Age, Courseswe.CourseID, Courseswe.CourseName, Enrollmentswe.Grade FROM Studentwe LEFT JOIN Enrollmentswe ON Studentwe.StudentID = Enrollmentswe.StudentID LEFT JOIN Courseswe ON Enrollmentswe.CourseID = Courseswe.CourseID;

 STUDENTID NAME                                  AGE   COURSEID
---------- ------------------------------ ---------- ----------
COURSENAME           GRADE
-------------------- -----
         2 bob                                    22        101
Maths                A-

         1 Alice                                  20        101
Maths                A

         3 Charlie                                21        102
English              A


 STUDENTID NAME                                  AGE   COURSEID
---------- ------------------------------ ---------- ----------
COURSENAME           GRADE
-------------------- -----
         1 Alice                                  20        102
English              B

         3 Charlie                                21        103
History              B+


SQL> SELECT Studentwe.StudentID, Studentwe.Name, Studentwe.Age, Courseswe.CourseID, Courseswe.CourseName, Enrollmentswe.Grade FROM Courseswe RIGHT JOIN Enrollmentswe ON Courseswe.CourseID = Enrollmentswe.CourseID RIGHT JOIN Studentwe ON Enrollmentswe.StudentID = Studentwe.StudentID;

 STUDENTID NAME                                  AGE   COURSEID
---------- ------------------------------ ---------- ----------
COURSENAME           GRADE
-------------------- -----
         2 bob                                    22        101
Maths                A-

         1 Alice                                  20        101
Maths                A

         3 Charlie                                21        102
English              A


 STUDENTID NAME                                  AGE   COURSEID
---------- ------------------------------ ---------- ----------
COURSENAME           GRADE
-------------------- -----
         1 Alice                                  20        102
English              B

         3 Charlie                                21        103
History              B+


