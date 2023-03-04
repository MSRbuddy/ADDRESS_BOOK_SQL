------ UC 10: Ability to get number of contact persons by Type------
select Count(*) as NumberOfContacts,Type
from Address_Book_Table
Group by Type;

-------- Creating Tables Based on ER Diagrams  --------

create table Address_Book(
Address_BookID int identity(1,1) primary key,
Address_BookName varchar(200)
)
insert into Address_Book values ('MARS Book'),('RAMS Book');

select * from Address_Book;

create table Contact_Person(
AddressBook_ID int,
Contact_ID int identity(1,1) primary key,
FirstName varchar(100),
LastName varchar(100),
Address varchar(250),
City varchar(100),
State varchar(100),
zip BigInt,
PhoneNumber BigInt,
Email varchar(200),
foreign key (AddressBook_ID) references Address_Book(Address_BookID))

insert into Contact_Person values
(1,'Vijaya','Macha','645 Catherine Street','Bangalore','Karnataka',243001,9842905050,'vijaya@gmail.com'),
(2,'Ganesh','Dasari','836 Heritage Rd','Chennai','Tamil Nadu',134002,9840208500,'ganesh@gmail.com'),
(2,'Keerthi','Ganesh','19 Augusta Avenue','Lucknow','Uttar Pradesh',113201,8721050553,'keerthi@gmail.com'),
(1,'Srishanth','Dasari','356 Newburgh','Bangalore','Karnataka',243001,9842905050,'srishanth@gmail.com');

select * from Contact_Person;

create table ContactType
(ContactType_ID int identity(1,1) primary key,
ContactType_Name varchar(200)
)

insert into ContactType values
('Family'),('Friends'),('Profession');

select * from ContactType;

create Table TypeManager(
ContactType_Identity int,
Contact_Identity int,
foreign key (ContactType_Identity) references ContactType(ContactType_ID),
foreign key (Contact_Identity) references Contact_Person(Contact_ID)
)

insert into TypeManager values
(1,3),
(2,3),
(3,1),
(1,2),
(2,4);

select * from TypeManager;

------ UseCase 11: Create Contact for both Family and Friends Type ------ 

select Address_BookName,Concat(FirstName,' ',LastName) as Name,Concat(Address,' ,',City,' ,',State,' ,',zip) as Address,PhoneNumber,Email,ContactType_Name
from Address_Book 
Full JOIN Contact_Person on Address_Book.Address_BookID=AddressBook_ID 
Full JOIN TypeManager on TypeManager.Contact_Identity=Contact_ID
Full JOIN ContactType on TypeManager.ContactType_Identity=ContactType_ID