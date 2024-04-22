--DOWN
DROP table if EXISTS Models

 
DROP table if EXISTS Managers

 

DROP table if EXISTS Judges
IF EXISTS(select* from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    where CONSTRAINT_NAME='fk_Judges_staffid')
    alter table Transactions DROP CONSTRAINT fk_Judges_staffid
 
 
DROP table if EXISTS Staff

 
DROP table if EXISTS Guests

DROP table if EXISTS Brands

 
DROP table if EXISTS Designers

 
GO
 
 
--UP METADATA
 


 
CREATE TABLE Models(
    modelid int not NULL,
    modelname varchar (50) not null,
    managerid int not NULL,
    gender varchar(50) not NULL,
    modelsize varchar(50) not NULL,
    brandid int not NULL,
    modelfees int not NULL,
 
    CONSTRAINT pk_Models_modelid PRIMARY KEY(modelid)
   
 
) 
 
CREATE TABLE Managers(
    managerid int not NULL,
    managername varchar (50) not null,
    modelid int not NULL,
    managerfees int not NULL,
    managercontact varchar(50) not NULL,
    agency varchar(50) not NULL,
    
 
    CONSTRAINT pk_Managers_managerid PRIMARY KEY(managerid)
 
) 
 


CREATE TABLE Staff(
    staffid int not NULL,
    staffname varchar (50) not null,
    department varchar (50) not null,
    staffcontact varchar(50) not NULL,
    
 
    CONSTRAINT pk_Staff_staffid PRIMARY KEY(staffid)
 
)  



CREATE TABLE Judges(
    judgeid int not NULL,
    judgename varchar (50) not null,
    staffid int not NULL,
    vote int not NULL,
    judgecontact varchar(50) not NULL,
    
 
    CONSTRAINT pk_Judges_judgeid PRIMARY KEY(judgeid),
    CONSTRAINT fk_Judges_staffid FOREIGN KEY(staffid)
    REFERENCES Staff(staffid)
   
 
)  
 
CREATE TABLE Guests(
    guestid int not NULL,
    guestname varchar (50) not null,
    gueststatus int not NULL,
    seatingpriority varchar(50) not NULL,
    staffid int not NULL,
    poll int not NULL,
    
 
    CONSTRAINT pk_Guests_guestid PRIMARY KEY(guestid)
   
 
)   

CREATE TABLE Brands(
    brandid int not NULL,
    brandname varchar (50) not null,
    designerid int not NULL,
    brandseason varchar(50) not NULL,
    brandforte varchar(50) not NULL,
    
 
    CONSTRAINT pk_Brands_brandid PRIMARY KEY(brandid)
 
) 

CREATE TABLE Designers(
    designerid int not NULL,
    designername varchar (50) not null,
    brandid int not NULL,
    staffid int not NULL,
    designerforte varchar(50) not NULL,
    designercontact varchar(50) not NULL,
    
 
    CONSTRAINT pk_Designers_designerid PRIMARY KEY(designerid)
 
) 
 

 
GO
 
 
 
 
 
 
 
 
 
INSERT INTO [dbo].[Models]
( -- Columns to insert data into
modelid,
modelname,
managerid,
gender,
modelsize,
brandid,
modelfees
)
VALUES
(1, 'Barbara Palvin',   101,    'F',    'S',    2011, 15000),
(2, 'Gigi Hadid',   102,    'F',    'S',    2001, 18000),
(3, 'Kylie Jenner', 103,    'F',    'M',   2010, 25000),
(4, 'Kendal Jenner',    104 ,'F',   'M',    2002, 22000),
(5, 'Irina Shayke', 105,    'F',    'XS',   2009, 14000),
(6,'Candace Swanepoel', 106,    'F',    'S',    2003, 19000),
(7, 'Kate Hudson',  107,    'F',    'L',   2008, 20000),
(8, 'Mike McMillan',    108,    'M',    'L',    2004, 13000),
(9, 'Pietro Boselli',   109,    'M',    'XL',   2007, 10000),
(10,    'David Beckham',    110,    'M',    'L',    2005, 20000),
(11 , 'Lucky Smith' ,111,   'M',    'M',    2006, 8000)
GO
 
 
 
-- Insert rows into table 'managers' in schema '[dbo]'
INSERT INTO [dbo].[Managers]
( -- Columns to insert data into
managerid,
managername,
modelid,
managerfees,
managercontact,
agency
)
VALUES
(101,   'Aaliyah Serrano', 3,   $1000,  1234567890, 'Next NY'),
(102,   'Jennifer Johnson', 2,  $2000,  9876543210, 'Jag Models'),
(103,   'Natalie Robinson', 5,  $1500,  3456789012, 'Future Models'),
(104,   'John Ferguson',    4,  $4000,  4567890123, 'Wilhelmina New York'),
(105,   'Samuel Patterson', 1,  $3000,  5432123456, 'Crawford Models'),
(106,   'Jasmine James',    6,  $2400,  8909876543, 'Ford Models'),
(107,   'Patricia Hamilton',    8,  $6300,  6152437893, 'CAA'),
(108,   'Michael Hensley',  7,  $3600,  8273619463, 'State Management'),
(109,   'Elijah Fisher',    9,  $2800,  8723543456, 'VNY Models'),
(110,   'Justin Wright',    11, $4100,  2342654575, 'One Management'),
(111,   'Paula Reyes',  10, $5200,  3468454453, 'DNA Models')
GO
 

-- Insert rows into table 'staff' in schema '[dbo]'
INSERT INTO [dbo].[staff]
( -- Columns to insert data into
staffid,
staffname,
department,
staffcontact
)
VALUES
(301,   'Anthony Montoya',' Logistics', '8723468295'),
(302,   'Mattie Demers',    'Photography',  '9823572863'),
(303,   'Collin Canady',    'Hospitality',' 6236356924'),
(304,   'Haven Mathis'  ,'Lights and Stage',    '2351083245'),
(305,   'Jaleel Patrick',   'Logistics',    '4302384565'),
(306,   'Marlon Tharp'  ,'Hospitality', '2193436571'),
(307,'Taylor Baggett' ,'Lights and Stage','   6802943643'),
(308,   'Jala Arreola'  ,'Hospitality', '2934875602'),
(309,   'Maricela Doty' ,'Logistics',   '2965635434'),
(310,   'Gabriel Howe'  ,'Photography', '3683655434'),
(311,   'James Charles' ,'Hospitality', '3134683234')
GO
 



-- Insert rows into table 'judges' in schema '[dbo]'
INSERT INTO [dbo].[judges]
( -- Columns to insert data into
judgeid,
judgename,
staffid,
vote,
judgecontact
)
VALUES
(1001,  'Jamie Pennington', 311,  2, 'jamie@gmail.com'),
(1002,  'Jett Rush',    301, 4,   'Jett@gmail.com'),
(1003,  'Nancy Fields', 310,    3,   'nancy@gmail.com'),
(1004,  'Fernando Craig',  302, 1,   'fernando@gmail.com'),
(1005,  'Bridger Li',   309,    6, 'bridger@gmail.com'),
(1006,  'Erica Avila',  303, 3,   'erica@gmail.com'),
(1007,  'Julius Page',  308,   5,   'julius@gmail.com'),
(1008,  'Karen Watts',304 ,1,   'karen@gmail.com'),
(1009,  'Amaris Anderson',  307,    8, 'amaris@gmail.com'),
(1010,  'Valery Carlson',   306, 9,   'valery@gmail.com'),
(1011,  'Steve Hunt',   305 ,3,   'steve@gmail.com')
 
GO
 
-- Insert rows into table 'guests' in schema '[dbo]'
INSERT INTO [dbo].[guests]
( -- Columns to insert data into
guestid,
guestname,
gueststatus,
seatingpriority,
staffid,
poll
)
VALUES
(10001, 'Rutwik Ghag'   ,1, 'Medium',   303,   5),
(10002, 'Ishita Joshi', 1,  'Medium',  301 ,2),
(10003, 'Siddhi Bhandari'   ,1, 'High', 311 ,1),
(10004, 'Ayushi Bhatnagar', 1,  'High', 309 ,1),
(10005, 'Forum Dattani' ,1, 'High',308, 4),
(10006,'Puneet Shetty'  ,1, 'High', 302,    1),
(10007, 'Zinkal Thakkar '   ,1, 'Medium',  305 ,7),
(10008, 'Nikita Sirvani'    ,1, 'Low',  307  ,4),
(10009, 'Vedant Rawat'  ,1, 'Low'   ,306,  2),
(10010, 'Anand Vamasi ' ,1, 'Medium',  310  ,8)
GO
 
-- Insert rows into table 'brand' in schema '[dbo]'
INSERT INTO [dbo].[brands]
( -- Columns to insert data into
brandid,
brandname,
designerid,
brandseason,
brandforte)
VALUES
(2001,      'Louis Vuitton',    201,    'Fall','Tops'),
(2002,      'Prada',  202,    'Summer',   'Jeans'),
(2003,  'Fenti',   203,    'Spring',   'Shirts'),
(2004,  'Moshino',   204,    'Winter',   'blouses'),
(2005,'Armani',   205 ,'Fall',    'swimwear'),
(2006,'Versache',   206,    'Summer',   'cardigans'),
(2007,'Dolce & gabbana',   207 ,'Spring','jackets'),
(2008,'Dior',   208,    'Winter',   'lingerie'),
(2009,'Missoni',209    ,'Fall' ,'Shoes'),
(2010,'Valentino',   210,    'Summer',   'Blazer'),
(2011, 'Gucci', 211, 'Fall', 'boots')
GO
 
-- Insert rows into table 'designers' in schema '[dbo]'
INSERT INTO [dbo].[designers]
( -- Columns to insert data into
designerid,
designername,
brandid,
staffid,
designerforte,
designercontact
)
VALUES
(201,   'Marc Jacobs',  2001,   311,'    Tops',  'marc@gmail.com'),
(202,   'Prabal Gurung' ,2002,  302,   'Jeans',    'prabal@gmail.com'),
(203,   'Anna Sui', 2003,   301  ,'Shirts'   ,'anna@gmail.com'),
(204,   'Jeremy Scott', 2004,  305,    'blouses','jeremy@gmail.com'),
(205,   'Thom Browne'   ,2005   ,309,    'swimwear', 'thom@gmail.com'),
(206,   'Jason Wu', 2006,  310,    'cardigans' ,'jason@gmail.com'),
(207,   'Brandon Maxwell' , 2007,   308,'jackets',   'brandon@gmail.com'),
(208,   'Michael Kors', 2008,   306 ,'lingerie',    'michael@gmail.com'),
(209,   'Carolina herrara'  ,2009   ,307,'Shoes',   'carolina@gmail.com'),
(210,   'Alexander Wang',   2010,  304, 'Blazer','alexander@gmail.com'),
(211,   'Lewis Hamilton',   2011,  303, 'Boots','lewham@gmail.com')

GO
 




select * from Brands



/*1. To find models paid more than $15,000 */
select modelname as Model, gender as Gender
from Models
where modelfees > 15000
group by gender, modelname



/*2. To find the average pay by gender for models */
select avg(modelfees) as Pay, gender as Gender
from Models
group by gender



/*3. To find the average pay by season for models */
select avg(m.modelfees) as Pay, b.brandseason as Season
from Models m join Brands b on m.brandid = b.brandid
group by b.brandseason




/*4. To find the brand each model will represent and the season */
select Models.modelname as Model, Brands.brandname as Brand, Brands.brandseason as Fashion_Season
from Models JOIN Brands on Models.brandid=Brands.brandid
order by brandname






/*5. To find the most voted model */
Go
with model_query AS(
select vote,modelname
from Judges j JOIN Models m on j.vote = m.modelid 
)
SELECT count(vote) OVER(partition by modelname)AS count_of_votes,modelname,vote
FROM model_query
order by count_of_votes DESC

Drop view if EXISTS something
GO
Create view something AS
with model_query AS(
select vote,modelname
from Judges j JOIN Models m on j.vote = m.modelid )
SELECT count(vote) OVER(partition by modelname)AS count_of_votes,modelname,vote
FROM model_query
GO

Select distinct count_of_votes as No_of_votes, modelname as Model from something
order by count_of_votes DESC







/*6. To find the winning designer  */


select distinct d.designername as Designer, count_of_votes as Votes
from something s join Models m on s.vote = m.modelid join Brands b on m.brandid = b.brandid join Designers d on b.designerid = d.designerid
order by count_of_votes desc





