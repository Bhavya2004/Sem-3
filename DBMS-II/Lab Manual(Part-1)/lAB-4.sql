Create database Worker_Info;

select*from person

select*from Department

select*from Designation

--From the above given tables perform the following queries:--

		--Stored Procedures--

-- 1.All tables insert and delete

	----------Person table Insert-----------

CREATE PROCEDURE PR_PERSON_INSERT1

@FIRSTNAME			VARCHAR(100),
@LASTNAME			VARCHAR(100),
@SALARY				DECIMAL(8,2),
@JOININGDATE		DATETIME,
@DEPARTMENTID		INT,
@DESIGNATIONID		INT
AS
BEGIN 
INSERT INTO PERSON
(

FIRSTNAME,
LASTNAME,
SALARY,
JOININGDATE,
DEPARTMENTID,
DESIGNATIONID
)
VALUES
(
		
@FIRSTNAME,		
@LASTNAME,		
@SALARY,			
@JOININGDATE,	
@DEPARTMENTID,	
@DESIGNATIONID	
)
END

		EXEC PR_PERSON_INSERT1 'BHAVYA','BARAI',50000,'2014-02-20',3,15
		SELECT*FROM PERSON

		----------Designation table Insert-----------
CREATE PROCEDURE PR_DESIGNATION_INSERT
@DESIGNATIONID INT,
@DESIGNATIONNAME VARCHAR(100)
AS
BEGIN 
INSERT INTO Designation
(
DESIGNATIONID,
DESIGNATIONNAME
)
VALUES
(
@DESIGNATIONID,
@DESIGNATIONNAME
)
END
	
	EXEC PR_DESIGNATION_INSERT 16,'FREELANCER'
	SELECT*FROM DESIGNATION

	----------Department table Insert-----------
CREATE PROCEDURE PR_DEPARTMENT_INSERT
@DEPARTMENTID INT,
@DEPARTMENTNAME VARCHAR(100)
AS
BEGIN 
INSERT INTO Department
(
DepartmentId,
DepartmentName
)
VALUES
(
@DEPARTMENTID,
@DEPARTMENTNAME
)
END
	
	EXEC PR_DEPARTMENT_INSERT 5,'CSE'
	SELECT*FROM DEPARTMENT

	----------Person table UPDATE-----------
CREATE PROCEDURE PR_PERSON_UPDATE
@WORKERID			INT,
@FIRSTNAME			VARCHAR(100),
@LASTNAME			VARCHAR(100),
@SALARY				DECIMAL(8,2),
@JOININGDATE		DATETIME,
@DEPARTMENTID		INT,
@DESIGNATIONID		INT
AS
BEGIN
UPDATE PERSON
SET
FIRSTNAME=    @FIRSTNAME,		
LASTNAME=     @LASTNAME	,	
SALARY=       @SALARY	,		
JOININGDATE=  @JOININGDATE,	
DEPARTMENTID= @DEPARTMENTID,
DESIGNATIONID=@DESIGNATIONID
WHERE WORKERID=@WORKERID
END

	EXEC PR_PERSON_UPDATE 103,'BHAVYA','BARAI',50000,'1991-05-14',1,11
	SELECT*FROM PERSON

	----------DESIGNATION table UPDATE-----------
CREATE PROCEDURE PR_DESIGNATION_UPDATE
@DESIGNATIONID	 INT,
@DESIGNATIONNAME VARCHAR(100)
AS
BEGIN 
UPDATE Designation
SET
DESIGNATIONID=@DESIGNATIONID,	
DESIGNATIONNAME=@DESIGNATIONNAME
WHERE DESIGNATIONID=@DESIGNATIONID
END
	
	EXEC PR_DESIGNATION_UPDATE 15,'MANAGER'
	SELECT*FROM Designation

	----------Department table UPDATE-----------
CREATE PROCEDURE PR_DEPARTMENT_UPDATE
@DEPARTMENTID INT,
@DEPARTMENTNAME VARCHAR(100)
AS
BEGIN
UPDATE Department
SET
DEPARTMENTID=@DEPARTMENTID,
DEPARTMENTNAME=@DEPARTMENTNAME
WHERE DEPARTMENTID=@DEPARTMENTID
END

		EXEC PR_DEPARTMENT_UPDATE 1,'IT'
		SELECT*FROM Department

	----------Person table DELETE-----------
CREATE  PROCEDURE PR_PERSON_DELETE
@WORKERID	INT
AS
BEGIN
DELETE FROM PERSON
WHERE WORKERID=@WORKERID
END
EXEC PR_PERSON_DELETE 108
SELECT * FROM person

--------------DEPATRMENT TABLE DELETE--------------
CREATE  PROCEDURE PR_DEPARTMENT_DELETE
@DEPARTMENTID	INT
AS
BEGIN
DELETE FROM Department
WHERE DepartmentID=@DEPARTMENTID
END
EXEC PR_DEPARTMENT_DELETE 5
SELECT * FROM Department

--------------DESIGNATION TABLE DELETE--------------
CREATE  PROCEDURE PR_DESIGNATION_DELETE
@DESIGNATIONID	INT
AS
BEGIN
DELETE FROM Designation
WHERE DesignationID=@DESIGNATIONID
END
EXEC PR_DESIGNATION_DELETE 16
SELECT * FROM Designation


--2.All tables SelectAll (If foreign key is available than do write join and take columns on select list)
	--PERSON TABLE(FOREIGN KEY AVAILABLE) 
Create proc PR_SelectAll_Person
as	
Select WorkerID,FirstName,LastName,Salary,JoiningDate,P.DepartmentID,P.DesignationID,DesignationName,DepartmentName
 From Person P
		Inner Join Department D1
		On P.DepartmentId = D1.DepartmentId
		Inner Join Designation D2
		On P.DesignationId = D2.DesignationId

EXEC PR_SelectAll_Person
	--DEPARTMENT TABLE(FOREIGN KEY NOT AVAILABLE)
Create Procedure PR_SelectAll_Department
as
Select *From Department

EXEC PR_SelectAll_Department

	--DESIGNATION TABLE(FOREIGN KEY NOT AVAILABLE)
Create Procedure PR_SelectAll_Designation
as
Select *From Designation

EXEC PR_SelectAll_Designation

	--3. All tables SelectPK
--PERSON TABLE
Create Proc PR_SelectPK_Person
@WorkerID Int
as
Select *From Person
where WorkerID = @WorkerID

EXEC PR_SelectPK_Person 101

--DEPARTMENT TABLE
Create Proc PR_SelectPK_Department
@DepartmentID Int
as
Select *From Department
where DepartmentID = @DepartmentID

EXEC PR_SelectPK_Department 1

--DESIGNATION TABLE
Create Proc PR_SelectPK_Designation
@DesignationID Int
as
Select *From Designation
where DesignationID= @DesignationID;

EXEC PR_SelectPK_Designation 12

--4.Create Procedure that takes Department Name & Designation Name as Input and 
--Returns a table with Worker’s First Name, Salary, Joining Date & Department Name
 
 Create Proc PR_Table_Person
@DesignationName	 Varchar(100),
@DepartmentName      Varchar(100)
as
Select FirstName,Salary,JoiningDate,DepartmentName
 From Person P
		Inner Join Department D1
		On P.DepartmentId = D1.DepartmentId
		Inner Join Designation D2
		On P.DesignationId = D2.DesignationId
		where DesignationName=@DesignationName and DepartmentName = @DepartmentName;
		
EXEC PR_Table_Person 'WELDER','ADMIN'

--5.Create Procedure that takes FirstName as an input parameter and displays’ all the details of 
--the worker with their department & designation name.
Create proc PR_SelectByFirstName_Person
@FirstName varchar(100)
as	
Select WorkerID,FirstName,LastName,Salary,JoiningDate,P.DepartmentID,P.DesignationID,DesignationName,DepartmentName
 From Person P
		Inner Join Department D1
		On P.DepartmentId = D1.DepartmentId
		Inner Join Designation D2
		On P.DesignationId = D2.DesignationId	
		where FirstName = @FirstName

EXEC PR_SelectByFirstName_Person 'BHOOMI'

--6.Create Procedure which displays department wise maximum, minimum & total salaries.
Create Proc PR_Max_Min_total_Department
as
Select D.Departmentname,Max(salary) as Max_sal,Min(salary) as Min_sal,Sum(salary) as Total
	From Person p
	Inner Join Department D
	On P.DepartmentId = D.departmentId
	Group By Departmentname

EXEC PR_Max_Min_total_Department


---------VIEWS-----------

--1. Create a view that display first 100 workers details.

Create View View_Top100
As
	Select top 100 * from Person;

select * from View_Top100


--2. Create a view that displays designation wise maximum, minimum & total salaries.
CREATE VIEW DESIGN_SALARY
	AS
	SELECT DESIGNATION.DESIGNATIONID,
		   MAX(PERSON.SALARY) AS 'Max_Salary',
		   MIN(PERSON.SALARY) AS 'Min_Salary',
		   SUM(PERSON.SALARY) AS 'Total_Salary'
	FROM PERSON INNER JOIN DESIGNATION
	ON PERSON.DESIGNATIONID=DESIGNATION.DESIGNATIONID
	GROUP BY DESIGNATION.DESIGNATIONID

SELECT * FROM DESIGN_SALARY;

--3. Create a view that displays Worker’s first name with their salaries & joining date, it also displays
--  duration column which is difference of joining date with respect to current date.

CREATE VIEW VIEW_FIRSTNAME_SALARY_JOININGDATE_DURATION
AS
	SELECT FIRSTNAME, SALARY, JOININGDATE, DATEDIFF(YEAR,JoiningDate,GETDATE()) AS 'DURATION' FROM Person;

SELECT * FROM VIEW_FIRSTNAME_SALARY_JOININGDATE_DURATION;


--4. Create a view which shows department & designation wise total number of workers.

CREATE VIEW VIEW_TOTAL_WORKER_BY_DEPARTMENT_DESIGNATION
AS
	SELECT DESIGNATIONNAME,DEPARTMENTNAME,COUNT(WORKERID) AS 'TOTAL_WORKER'
	FROM PERSON P INNER JOIN Department DP 
	ON P.DepartmentID  = DP.DepartmentID
	INNER JOIN Designation DS
	ON P.DesignationID = DS.DesignationID
	GROUP BY DS.DESIGNATIONNAME, DP.DEPARTMENTNAME;

SELECT * FROM VIEW_TOTAL_WORKER_BY_DEPARTMENT_DESIGNATION;

--5. Create a view that displays worker names who don’t have either in any department or designation.

CREATE VIEW VIEW_WORKER_WITHOUT_DEPARTMENT_OR_DESIGNATION
AS 
	SELECT FIRSTNAME FROM Person 
	WHERE DepartmentId IS NULL OR DesignationID IS NULL;

SELECT * FROM VIEW_WORKER_WITHOUT_DEPARTMENT_OR_DESIGNATION;


-------USER DEFINED FUNCTIONS--------

--1. Create a table valued function which accepts DepartmentID as a parameter & returns a worker
--  table based on DepartmentID.
CREATE FUNCTION FN_WORKERINFO(@DEPARTMENTID INT)
	RETURNS TABLE
	AS
	RETURN 
	(	
		SELECT 
			PERSON.WORKERID,
			PERSON.FIRSTNAME,
			PERSON.LASTNAME,
			PERSON.SALARY,
			PERSON.JOININGDATE,
			PERSON.DEPARTMENTID,
			PERSON.DESIGNATIONID
		FROM PERSON 
		INNER JOIN DEPARTMENT
		ON PERSON.DEPARTMENTID = DEPARTMENT.DEPARTMENTID
		WHERE PERSON.DEPARTMENTID=@DEPARTMENTID
	)

	SELECT * FROM FN_WORKERINFO(1)

--2. Create a table valued function which returns a table with unique city names from worker table.

CREATE FUNCTION FUN_UNIQUE_CITY_FROM_WORKER()
RETURNS TABLE
AS 
	RETURN (SELECT DISTINCT CITY FROM WORKER)


--3. Create a scalar valued function which accepts two parameters start date & end date, and 
--returns a date difference in days.

	CREATE FUNCTION FN_DATEDIFF(
		@STARTDATE DATETIME, 
		@ENDDATE DATETIME
	)
	RETURNS INT
	AS
	BEGIN
		RETURN DATEDIFF(DAY, @STARTDATE,@ENDDATE)
	END
	SELECT dbo.FN_DATEDIFF('2004-04-17','2022-07-31')AS 'DAY'


--4.  Create a scalar valued function which accepts two parameters year in integer & month in
--   integer and returns total days in passed month & year.


CREATE FUNCTION FUN_TOTAL_DAYS_BY_MONTH_AND_YEAR(@MONTH INT, @YEAR INT)
RETURNS INT
AS
BEGIN
	DECLARE @Date DATE = CAST(
                            CAST(@Year AS CHAR(4)) 
                            + RIGHT('0' + CAST(@Month AS VARCHAR(2)), 2)
                            + '01' AS DATE);

        RETURN DATEDIFF(DAY, 
            DATEADD(MONTH, DATEDIFF(MONTH, 0, @Date), 0),
            DATEADD(MONTH, DATEDIFF(MONTH, 0, @Date) + 1, 0));

END

SELECT DBO.FUN_TOTAL_DAYS_BY_MONTH_AND_YEAR(2,2012)

