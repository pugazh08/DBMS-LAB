SQL> INSERT INTO system.employeepersonaldetails VALUES (7, 'Test', 20, 9000000001);
INSERT INTO system.employeepersonaldetails VALUES (7, 'Test', 20, 9000000001)
                   *
ERROR at line 1:
ORA-01031: insufficient privileges


SQL> CONNECT system/&&sys_pwd
Connected.

SQL> GRANT INSERT ON employeepersonaldetails TO student2;

Grant succeeded.

SQL> CONNECT student2/student2pwd
Connected.

SQL> INSERT INTO system.employeepersonaldetails VALUES (7, 'Test', 20, 9000000001);

1 row created.

SQL> ROLLBACK;

Rollback complete.

SQL> CONNECT system/&&sys_pwd
Connected.

SQL> REVOKE INSERT ON employeepersonaldetails FROM student2;

Revoke succeeded.

SQL> REVOKE SELECT ON employeepersonaldetails FROM student2;

Revoke succeeded.

SQL> CONNECT student2/student2pwd
Connected.

SQL> SELECT * FROM system.employeepersonaldetails;
SELECT * FROM system.employeepersonaldetails
                     *
ERROR at line 1:
ORA-00942: table or view does not exist
