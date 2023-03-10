------UC-1Create Database-----------
create database Address_Book_Service_DB;

------ UC 2: Create Table ------
create table Address_Book_Table
(FirstName varchar(100),
SecondName varchar(100),
Address varchar(250),
City varchar(100),
State varchar(100),
zip BigInt,
PhoneNumber BigInt,
Email varchar(200)
)

------ UC 3: Insert Values to Table ------
Insert into Address_Book_Table(FirstName,SecondName,Address,City,State,zip,PhoneNumber,Email) 
values('Meghana','Dasari','645 Catherine Street','Bangalore','Karnataka',243001,9842905050,'meghana@gmail.com'),
('Rushitha','Kottala','836 Heritage Rd','Chennai','Tamil Nadu',134002,9840208500,'Rushitha@gmail.com'),
('Shruthi','Paspunoori','19 Augusta Avenue','Lucknow','Uttar Pradesh',113201,8721050553,'shruthi@gmail.com');

select * from Address_Book_Table;

------ UC 4: Ability to Edit Contact Person Based on their Name ------
EXEC sp_RENAME 'Address_Book_Table.SecondName' , 'LastName' , 'COLUMN';

--Edit Email based on Name--
Update Address_Book_Table
set Email='meghanad@gmail.com'
where FirstName='Meghana';

--Edit Address based on Name--
Update Address_Book_Table
set Address='836 Heritage Road'
where FirstName='Rushitha' and LastName='Kottala';

select * from Address_Book_Table;

------ UC 5: Ability to Delete Contact Person Based on their Name ------

delete 
from Address_Book_Table
where FirstName='Shruthi' and LastName='Paspunoori';

------ UC 6: Ability to Retrieve Person belonging to a City or State ------

select * 
from Address_Book_Table
where City='Bangalore' or State='Karnataka';

------ UC 7: Ability to Retrieve Count of Person belonging to a City or State ------
Insert into Address_Book_Table(FirstName,LastName,Address,City,State,zip,PhoneNumber,Email) 
values('Shruthi','Paspunoori','19 Augusta Avenue','Manglore','Karnataka',113201,8721050553,'shruthi@gmail.com');

select Count(*),state,City
from Address_Book_Table
Group by state,City;

select * from Address_Book_Table;