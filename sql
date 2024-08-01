1)Display all the information of the EMP table?
select * from empy;

2)Display unique Jobs from EMP table?
SELECT DISTINCT job FROM EMPY;

3)List the emps in the asc order of their Salaries?
SELECT * FROM EMPY ORDER BY sal ASC;

4)List the details of the emps in asc order of the Dptnos and desc of Jobs? 
SELECT * FROM EMPY ORDER BY deptno ASC, job DESC;

5)Display all the unique job groups in the descending order?
SELECT DISTINCT job FROM EMPY ORDER BY job DESC;

6)#Display all the details of all ‘Mgrs’
SELECT * FROM EMPY WHERE job = 'Manager';

7)List the emps who joined before 1981.
SELECT * FROM EMPY WHERE hiredate < '1981-01-01';

8)List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.
SELECT Empno, Ename, Sal, (Sal / 365) AS Daily_Sal, (Sal * 12) AS Annsal
FROM EMPY ORDER BY Annsal ASC;

9)Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
SELECT Empno, Ename, job, Hiredate, FLOOR(DATEDIFF(CURDATE(), Hiredate) / 365) AS Exp
FROM EMPY WHERE job = 'Manager';

10)List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369.
SELECT Empno, Ename, Sal, FLOOR(DATEDIFF(CURDATE(), Hiredate) / 365) AS Exp
FROM EMPY WHERE job = 7369;

11)Display all the details of the emps whose Comm. Is more than their Sal.
SELECT * FROM EMPY WHERE Comm > Sal;

12)List the emps in the asc order of Designations of those joined after the second half of 1981.
SELECT * FROM EMPY
WHERE Hiredate > '1981-06-30'ORDER BY job ASC;

13)List the emps along with their Exp and Daily Sal is more than Rs.100.
SELECT Empno, Ename, Sal, FLOOR(DATEDIFF(CURDATE(), Hiredate) / 365) AS Exp,
(Sal / 30) AS Daily_Sal FROM EMPY WHERE (Sal / 30) > 100;

14)List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
SELECT * FROM EMPY WHERE job IN ('CLERK', 'ANALYST')
ORDER BY job DESC;

15)List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority.
SELECT * FROM EMPY WHERE Hiredate IN ('1981-05-01', '1981-12-03', '1981-12-17', '1980-01-19')
ORDER BY Hiredate ASC;

16)List the emp who are working for the Deptno 10 or20
SELECT * FROM EMPY WHERE Deptno IN (10, 20);

17)List the emps who are joined in the year 81.
SELECT * FROM EMPY WHERE YEAR(Hiredate) = 1981;

18)List the emps who are joined in the month of Aug 1980.
SELECT * FROM EMPY WHERE YEAR(Hiredate) = 1980 AND MONTH(Hiredate) = 8;

19)List the emps Who Annual sal ranging from 22000 and 45000
SELECT * FROM EMPY WHERE (Sal * 12) BETWEEN 22000 AND 45000;

20)List the Enames those are having five characters in their Names.
SELECT Ename FROM EMPY WHERE LENGTH(Ename) = 5;

21)List the Enames those are starting with ‘S’ and with five characters.
SELECT Ename FROM EMPY WHERE Ename LIKE 'S____' AND LENGTH(Ename) = 5;

22)List the emps those are having four chars and third character must be r 
SELECT * FROM EMPY WHERE LENGTH(Ename) = 4 AND Ename LIKE '__r_';

23)List the Five character names starting with ‘S’ and ending with ‘H’.
SELECT * FROM EMPY WHERE LENGTH(Ename) = 5 AND Ename LIKE 'S___H';

24)List the emps who joined in January
SELECT * FROM EMPY WHERE MONTH(Hiredate) = 1;

25)List the emps who joined in the month of which second character is ‘a’.
SELECT * FROM EMPY WHERE MONTHNAME(Hiredate) LIKE '_a%';

26)List the emps whose Sal is four digit number ending with Zero.
SELECT * FROM EMPY WHERE Sal BETWEEN 1000 AND 9999 AND Sal % 10 = 0;

27)List the emps whose names having a character set ‘ll’ together.
SELECT * FROM EMPY WHERE Ename LIKE '%ll%';

28)List the emps those who joined in 80’s.
SELECT * FROM EMPY WHERE YEAR(Hiredate) BETWEEN 1980 AND 1989;

29)List the emps who does not belong to Deptno 20.
SELECT * FROM EMPY WHERE Deptno <> 20;

30)List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries.
SELECT * FROM EMPY WHERE job NOT IN ('PRESIDENT', 'MGR')
ORDER BY Sal ASC;

31)List all the emps who joined before or after 1981.
SELECT * FROM EMPY WHERE Hiredate < '1981-01-01' OR Hiredate >= '1981-01-01';

32)List the emps whose Empno not starting with digit78.
SELECT * FROM EMPY WHERE Empno NOT LIKE '78%';

33)List the emps who are working under ‘MGR’.
SELECT * FROM EMPY WHERE JOB IN (SELECT Empno FROM EMPY WHERE job = 'MANAGER');

34)List the emps who joined in any year but not belongs to the month of March.
SELECT * FROM EMPY WHERE MONTH(Hiredate) <> 3;

35)List all the Clerks of Deptno 20.
SELECT * FROM EMPY WHERE job = 'CLERK' AND Deptno = 20;

36)List the emps of Deptno 30 or 10 joined in the year 1981
SELECT * FROM EMPY WHERE Deptno IN (10, 30) AND YEAR(Hiredate) = 1981;

37)Display the details of SMITH.
SELECT * FROM EMPY WHERE Ename = 'SMITH';

38)Display the location of  SMITH.
SELECT D.Loc FROM EMPY E JOIN DEPT D ON E.Deptno = D.Deptno
WHERE E.Ename = 'SMITH';

39)List the total information of EMP table along with DNAME and Loc of all the emps Working Under ‘ACCOUNTING’ & ‘RESEARCH’ in the asc Deptno.
SELECT E.*, D.DNAME, D.Loc FROM EMPY E JOIN DEPT D ON E.Deptno = D.Deptno
WHERE D.DNAME IN ('ACCOUNTING', 'RESEARCH') ORDER BY E.Deptno ASC;

40)List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and ‘ANALYST’ working in New York,Dallas with an exp more than 7 years without receiving the Comm asc order of Loc.

SELECT E.Empno, E.Ename, E.Sal, D.DNAME FROM EMPY E JOIN DEPT D ON E.Deptno = D.Deptno
WHERE E.job IN ('MGR', 'ANALYST') AND D.Loc IN ('New York', 'Dallas') AND TIMESTAMPDIFF(YEAR, E.Hiredate, CURDATE()) > 7
AND E.Comm IS NULL ORDER BY D.Loc ASC;

41)#Display the Empno, Ename, Sal, Dname, Loc, Deptno, Job of all emps working at CJICAGO or working for ACCOUNTING dept with Ann Sal>28000, but the Sal should not be=3000 or 2800 who doesn’t belongs to the Mgr and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the asc order of Deptno and desc order of job.

SELECT E.Empno, E.Ename, E.Sal, D.DNAME, D.Loc, E.Deptno, E.Job
FROM EMPY E JOIN DEPT D ON E.Deptno = D.Deptno
WHERE (D.Loc = 'CHICAGO' OR D.DNAME = 'ACCOUNTING')AND (E.Sal * 12 > 28000)AND E.Sal NOT IN (3000, 2800)AND E.Job <> 'MANAGER'
AND SUBSTRING(E.Empno, 3, 1) IN ('7', '8') ORDER BY E.Deptno ASC, E.Job DESC;


