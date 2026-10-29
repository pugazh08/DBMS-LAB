SQL> CREATE SEQUENCE student_seq08 START WITH 1 INCREMENT BY 1;

Sequence created.

SQL> CREATE TABLE studentsare (student_id INT PRIMARY KEY, student_name VARCHAR(100), student_email VARCHAR(100));

Table created.

SQL> INSERT INTO studentsare (student_id, student_name, student_email) VALUES (student_seq08.NEXTVAL, 'Alice Johnson', 'alice@example.com');

1 row created.

SQL> INSERT INTO studentsare (student_id, student_name, student_email) VALUES (student_seq08.NEXTVAL, 'Bob Smith', 'bob@example.com');

1 row created.

SQL> INSERT INTO studentsare (student_id, student_name, student_email) VALUES (student_seq08.NEXTVAL, 'Charlie Brown', 'charlie@example.com');

1 row created.

SQL> CREATE VIEW student_viewwe AS SELECT student_id, student_name, student_email FROM studentsare;

View created.

SQL> INSERT INTO studentsare (student_id, student_name, student_email) VALUES (student_seq08.NEXTVAL, 'Diana Prince', 'diana@example.com');

1 row created.

SQL> SELECT * FROM student_viewwe;

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
STUDENT_EMAIL
--------------------------------------------------------------------------------
         1
Alice Johnson
alice@example.com

         2
Bob Smith
bob@example.com

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
STUDENT_EMAIL
--------------------------------------------------------------------------------

         3
Charlie Brown
charlie@example.com

         4
Diana Prince

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
STUDENT_EMAIL
--------------------------------------------------------------------------------
diana@example.com


SQL> UPDATE studentsare SET student_email = 'new_bob@example.com' WHERE student_name = 'Bob Smith';

1 row updated.

SQL> SELECT * FROM student_viewwe;

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
STUDENT_EMAIL
--------------------------------------------------------------------------------
         1
Alice Johnson
alice@example.com

         2
Bob Smith
new_bob@example.com

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
STUDENT_EMAIL
--------------------------------------------------------------------------------

         3
Charlie Brown
charlie@example.com

         4
Diana Prince

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
STUDENT_EMAIL
--------------------------------------------------------------------------------
diana@example.com


SQL> DELETE FROM studentsare WHERE student_name = 'Charlie Brown';

1 row deleted.

SQL> SELECT * FROM student_viewwe;

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
STUDENT_EMAIL
--------------------------------------------------------------------------------
         1
Alice Johnson
alice@example.com

         2
Bob Smith
new_bob@example.com

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
STUDENT_EMAIL
--------------------------------------------------------------------------------

         4
Diana Prince
diana@example.com


SQL> CREATE INDEX idx_student_emaill ON studentsare (student_email);

Index created.

