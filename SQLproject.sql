create database arena;

create table department(
department_no int primary key  ,
department_name varchar(15) ,
);

create table branch(
branch_no int primary key 
);

create table employee(
employee_id int ,
f_name varchar(15) ,
l_name varchar(15) ,
email varchar(150),
address varchar(50),
salary decimal(10,2),
manager_id int ,
department_no int,
branch_no int,
primary key(employee_id),
foreign key(manager_id) references employee(employee_id),
foreign key(department_no) references department(department_no),
foreign key(branch_no)references branch(branch_no));

create table customer (
customer_id int ,
f_name varchar(15) ,
l_name varchar(15) ,
address varchar(50),
start_date date,
duration int,
c_email varchar(150),
employee_id int,
primary key (customer_id),
foreign key(employee_id) references employee(employee_id));


create table phone_customer(
customer_id int ,
phone char(11) ,
primary key(customer_id,phone),
foreign key(customer_id) references customer(customer_id)) ;


create table phone_employee(
employee_id int ,
phone char(11) ,
primary key(employee_id,phone),
foreign key(employee_id) references employee(employee_id)) ;


create table branch_location (
branch_no int,
location varchar(50),
primary key (branch_no,location),
foreign key (branch_no) references branch(branch_no)
);


create table branch_hotline(
branch_no int ,
hotline char(6) not null,
primary key (branch_no,hotline),
foreign key (branch_no) references branch(branch_no)
);

create table equipment(
machine_code varchar(15) ,
equipment_name varchar(40),
periodic_maintaince varchar(15),
branch_no int ,
primary key(machine_code),
foreign key(branch_no)references branch(branch_no)
);

alter table equipment alter column periodic_maintaince varchar(40);
alter table equipment add e_type varchar(15) ;

create table equipment_type(
machine_code varchar(15) not null,
type varchar(50),
primary key(machine_code,type),
foreign key(machine_code) references equipment (machine_code)
);

drop table equipment_type;

create table classes(
class_name varchar(50) not null,
cost decimal(6,2),
time time,
primary key(class_name)
);

create table sessions(
customer_id int,
employee_id int,
session_name varchar(50),
primary key(customer_id,employee_id,session_name),
foreign key(customer_id) references customer(customer_id),
foreign key(employee_id) references employee(employee_id),
foreign key(session_name) references classes(class_name)
);
 


create table c_equipment(
customer_id int,
code varchar(15),
primary key (customer_id,code ),
foreign key(customer_id) references customer(customer_id),
foreign key(code) references equipment(machine_code)
);

create table c_branch(
customer_id int,
branch_no int,
primary key(customer_id ,branch_no),
foreign key(customer_id) references customer(customer_id),
foreign key(branch_no) references branch(branch_no));


   
INSERT INTO department (department_no,department_name)
VALUES
(1, 'HR');
INSERT INTO department (department_no,department_name)
VALUES
(2, 'Finance');
INSERT INTO department (department_no,department_name)
values
(3, 'IT');
INSERT INTO department (department_no,department_name)
VALUES
(4, 'Marketing');
INSERT INTO department (department_no,department_name)
VALUES
(5,  'Trainers');

-- Insert data into the branch table
INSERT INTO branch
VALUES (1);
INSERT INTO branch
VALUES (2);
INSERT INTO branch
VALUES (3);
INSERT INTO branch
VALUES (4);
INSERT INTO branch
VALUES (5);

INSERT INTO employee
VALUES (1, 'Ahmed', 'Elsayed','ahmedelsayed@gmail.com','sheraton, Cairo', 50000.00, 1, 1,5);
INSERT INTO employee
VALUES (2, 'Sara', 'Hassan', 'sarahassan@gmail.com','Zamalek, Cairo', 60000.00, 1, 2,3);
INSERT INTO employee
VALUES (3, 'Mohamed', 'Omar','mohamedOmar@gmail.com', 'Maadi, Cairo', 55000.00, 1, 3,2);
INSERT INTO employee
VALUES (4, 'Hana', 'Youssef','hanaYoussef@gmail.com', 'zamalek, Cairo', 58000.00, 3, 4,1);
INSERT INTO employee
VALUES (5, 'Ali', 'Khaled','alikhaled@gmail.com', 'maadi, Cairo', 62000.00, 3, 5,1);
INSERT INTO employee
VALUES (6, 'Mona', 'Gamal','monagamal@gmail.com', 'New Cairo, Cairo', 70000.00, 5, 1,4);
INSERT INTO employee
VALUES (7, 'Khaled', 'Adel','khaledadel@gmail.com', 'Garden City, Cairo', 48000.00, 4, 2,4);
INSERT INTO employee
VALUES (8, 'Laila', 'Fathy','lailafathy@gmail.com', '6th of October City, Cairo', 52000.00, 5, 3,2);
INSERT INTO employee
VALUES (9, 'Omar', 'Saad','omarsaad@gmail.com', 'Shobra, Cairo', 51000.00, 2, 4,1);
INSERT INTO employee
VALUES (10, 'Aya', 'Nabil','ayanabile@gmail.com', 'Dokki, Cairo', 53000.00, 2, 5,1);
update employee 
set manager_id=2
where employee_id=2
update employee 
set manager_id=3
where employee_id=3
update employee 
set manager_id=4
where employee_id=4
update employee 
set manager_id=5
where employee_id=5
-- Insert data into the customer table
INSERT INTO customer
VALUES (1,  'Ahmed', 'Ali','11 Tahrir St, Cairo', '2024-01-01', 12, 'ahmed.ali@example.com', 1);
INSERT INTO customer
VALUES (2 , 'Sara', 'Hassan','22 Zamalek St, Cairo', '2024-02-01', 6, 'sara.hassan@example.com', 2);
INSERT INTO customer 
VALUES (3 , 'Khaled', 'Omar','33 Mohandessin St, Giza', '2024-03-01', 9, 'khaled.omar@example.com', 3);
INSERT INTO customer
VALUES (4 , 'Mona', 'Youssef','44 Stanley St, Alexandria', '2024-04-01', 3, 'mona.youssef@example.com', 4);
INSERT INTO customer
VALUES (5 , 'Hana', 'Kamal', '55 Corniche St, Aswan','2024-05-01', 8, 'hana.kamal@example.com', 5);
INSERT INTO customer
VALUES (6 , 'Omar', 'Fathy','66 Luxor Temple St, Luxor', '2024-06-01', 12, 'omar.fathy@example.com', 1);
INSERT INTO customer 
VALUES (7, 'Laila', 'Saad', '77 Garden City St, Cairo', '2024-07-01', 5, 'laila.saad@example.com', 2);
INSERT INTO customer
VALUES (8, 'Amr', 'Nabil',  '88 Haram St, Giza','2024-08-01', 15, 'amr.nabil@example.com', 3);
INSERT INTO customer
VALUES (9, 'Noura', 'Gamal', '99 Sporting St, Alexandria', '2024-09-01', 7, 'noura.gamal@example.com', 4);
INSERT INTO customer
VALUES (10, 'Hussein', 'Adel',  '100 Nile St, Luxor','2024-10-01', 10, 'hussein.adel@example.com', 5);

-- Insert data into the phone_customer table
INSERT INTO phone_customer 
VALUES (1, '01234567890');
INSERT INTO phone_customer
VALUES (1, '01123456789');
INSERT INTO phone_customer
VALUES (2, '01012345678');
INSERT INTO phone_customer
VALUES (3, '01512345678');
INSERT INTO phone_customer
VALUES (3, '01211122334');
INSERT INTO phone_customer
VALUES (4, '01122334455');
INSERT INTO phone_customer
VALUES (4, '01033445566');
INSERT INTO phone_customer
VALUES (5, '01544556677');
INSERT INTO phone_customer
VALUES (6, '01255667788');
INSERT INTO phone_customer 
VALUES (7, '01166778899');
INSERT INTO phone_customer 
VALUES (8, '01234567880');
INSERT INTO phone_customer
VALUES (9, '01123636789');
INSERT INTO phone_customer
VALUES (9, '01012349878');
INSERT INTO phone_customer 
VALUES (10, '01512344678');


-- Insert data into the phone_employee table
INSERT INTO phone_employee VALUES (1, '01098765432');
INSERT INTO phone_employee VALUES (1, '01278765432');
INSERT INTO phone_employee VALUES (2, '01187654321');
INSERT INTO phone_employee VALUES (2, '01539856821');
INSERT INTO phone_employee VALUES (3, '01276543210');
INSERT INTO phone_employee VALUES (4, '01565432109');
INSERT INTO phone_employee VALUES (5, '01054321098');
INSERT INTO phone_employee VALUES (6, '01143210987');
INSERT INTO phone_employee VALUES (6, '01296596562');
INSERT INTO phone_employee VALUES (7, '01232109876');
INSERT INTO phone_employee VALUES (8, '01521098765');
INSERT INTO phone_employee VALUES (8, '01521065865');
INSERT INTO phone_employee VALUES (9, '01010987654');
INSERT INTO phone_employee VALUES (10, '01109876543');



-- Insert data into the branch_location table
INSERT INTO branch_location VALUES (1, 'new Cairo');
INSERT INTO branch_location VALUES (2, 'sheraton');
INSERT INTO branch_location VALUES (3, 'maadi');
INSERT INTO branch_location VALUES (4, 'madint nasr');
INSERT INTO branch_location VALUES (5, 'zamalek');

-- Insert data into the branch_hotline table
INSERT INTO branch_hotline VALUES (1, '123456');
INSERT INTO branch_hotline VALUES (2, '234567');
INSERT INTO branch_hotline VALUES (3, '345678');
INSERT INTO branch_hotline VALUES (4, '456789');
INSERT INTO branch_hotline VALUES (5, '567890');

-- Insert data into the equipment table
INSERT INTO equipment VALUES ('EQ001', 'Treadmill', '3 monthes',1);
INSERT INTO equipment VALUES ('EQ003', 'Elliptical', '3 monthes',2,'cardio');
INSERT INTO equipment VALUES ('EQ004', 'Rowing Machine', '3 monthes',2,'cardio');
INSERT INTO equipment VALUES ('EQ005', 'Dumbbells', '3 monthes',2,'strength');
INSERT INTO equipment VALUES ('EQ006', 'Bench Press', '3 monthes',2,'strength');
INSERT INTO equipment VALUES ('EQ007', 'Pull-up Bar', '3 monthes',3,'strength');
INSERT INTO equipment VALUES ('EQ008', 'Kettlebell', '3 monthes',3,'cardio');
INSERT INTO equipment VALUES ('EQ009', 'Resistance Bands', '3 monthes',4,'strength');
INSERT INTO equipment VALUES ('EQ010', 'Step Machine', '3 monthes',5,'cardio');

update equipment
set e_type='cardio'
where machine_code='EQ001'
update equipment
set e_type='cardio'
where machine_code='EQ002'
update equipment
set e_type='cardio'
where machine_code='EQ003'
update equipment
set e_type='cardio'
where machine_code='EQ004'
update equipment
set e_type='cardio'
where machine_code='EQ005'
update equipment
set e_type='strength'
where machine_code='EQ006'
update equipment
set e_type='strength'
where machine_code='EQ007'
update equipment
set e_type='strength'
where machine_code='EQ008'
update equipment
set e_type='cardio'
where machine_code='EQ009'
update equipment
set e_type='strength'
where machine_code='EQ010'


-- Insert data into the workout table
INSERT INTO  classes VALUES ('Yoga', 200.00, '08:00:00');
INSERT INTO  classes VALUES ('Pilates', 250.00, '09:00:00');
INSERT INTO  classes VALUES ('Spinning', 300.00, '10:00:00');
INSERT INTO  classes VALUES ('Zumba', 220.00, '11:00:00');
INSERT INTO  classes VALUES ('HIIT', 350.00, '12:00:00');
INSERT INTO  classes VALUES ('CrossFit', 400.00, '13:00:00');
INSERT INTO  classes VALUES ('Boxing', 300.00, '14:00:00');
INSERT INTO  classes VALUES ('Aerobics', 180.00, '15:00:00');
INSERT INTO  classes VALUES ('Stretching', 150.00, '16:00:00');
INSERT INTO  classes VALUES ('Meditation', 100.00, '17:00:00');


-- Insert data into the sessions table
INSERT INTO sessions VALUES (1, 2, 'yoga');
INSERT INTO sessions VALUES (2, 1, 'meditation');
INSERT INTO sessions VALUES (3, 4,'boxing' );
INSERT INTO sessions VALUES (2, 4, 'zumba');
INSERT INTO sessions VALUES (5, 2, 'crossFit');
INSERT INTO sessions VALUES (1, 1, 'aerobics');


-- Insert data into the c_equipment table
INSERT INTO c_equipment VALUES (1, 'EQ001');
INSERT INTO c_equipment VALUES (1, 'EQ002');
INSERT INTO c_equipment VALUES (1, 'EQ003');
INSERT INTO c_equipment VALUES (9, 'EQ004');
INSERT INTO c_equipment VALUES (2, 'EQ005');
INSERT INTO c_equipment VALUES (8, 'EQ006');
INSERT INTO c_equipment VALUES (2, 'EQ007');
INSERT INTO c_equipment VALUES (3, 'EQ008');
INSERT INTO c_equipment VALUES (4, 'EQ009');
INSERT INTO c_equipment VALUES (4,'EQ010');

-- Insert data into the c_branch table
INSERT INTO c_branch VALUES (1, 1);
INSERT INTO c_branch VALUES (2, 1);
INSERT INTO c_branch VALUES (3, 1);
INSERT INTO c_branch VALUES (4, 2);
INSERT INTO c_branch VALUES (5, 2);
INSERT INTO c_branch VALUES (6, 3);
INSERT INTO c_branch VALUES (7, 3);


--total salary for each department--
select d.department_name, sum(e.salary) as total_salary
from employee as e
inner join department as d on d.department_no = e.department_no
GROUP BY department_name;

--employees in each department--
select d.department_no, d.department_name ,e.f_name,e.l_name
from employee e inner join department d on e.department_no=d.department_no
order by d.department_no ;


--customer attend classes cost more than 200
select c.customer_id,c.f_name,c.l_name
from customer c 
JOIN sessions s on c.customer_id = s.customer_id
JOIN classes cl on s.session_name = cl.class_name
where cl.cost > 200;


--name of employee with max salary in each department
select  e.department_no, e.f_name,e.l_name, e.salary
from  employee e 
where e.salary = (
        select MAX(salary)
        from employee
        where department_no = e.department_no )
        order by e.department_no  ;


--employes name and address who work in department IT
select e.f_name,e.l_name,e.address,department_name
from employee as e join department d on e.department_no=d.department_no 
where department_name='it';

--customers who has no classes
select c.f_name,c.l_name,session_name
from customer as c left join sessions as s  on c.customer_id=s.customer_id
where session_name is null;


--no of equibments in each branch
select branch_no, count(*) as equipments_count
from equipment
group by branch_no 


--supervisors name of each dpartment
select e.f_name,e.l_name,d.department_name
from employee as e join department d on e.department_no=d.department_no
where exists (select manager_id
              from employee m 
			  where e.employee_id=m.manager_id);
			   

--give a message when insert a new equipment
create trigger equipment
on equipment
after insert 
as
begin
print 'new equipment added'
end;

insert into equipment
values ('EQ015','leg extension','3 monthes',1,'strength')
  
  insert into equipment
values ('EQ016','leg extension','3 monthes',1,'strength')
  
  insert into equipment
values ('EQ017','leg extension','3 monthes',1,'strength')
select*
from equipment

--procedure to get the info of employee
create procedure getemp @employee_id int
as 
 select * from employee
 where employee_id = @employee_id

 execute getemp 4
 execute getemp 8

 --procedure to add customer
 create procedure addcustomer @customer_id int ,@f_name varchar(15) ,@l_name varchar(15) ,@address varchar(50),@start_date date,@duration int ,@c_email varchar(150),@employee_id int
as 
begin
insert into customer values (@customer_id  ,@f_name ,@l_name  ,@address ,@start_date,@duration ,@c_email ,@employee_id  )
print 'customer added successfully'
end;
execute addcustomer 11, 'ramy', 'mohamed', 'maadi,cairo', '2024-12-20',3,'ramyahmed@gmail.com',2;
select *
from customer
where customer_id=11

 create procedure addcustomer2 @customer_id int ,@f_name varchar(15) ,@l_name varchar(15) ,@address varchar(50),@start_date date,@duration int ,@c_email varchar(150),@employee_id int
begin
insert into customer values (@customer_id  ,@f_name ,@l_name  ,@address ,@start_date,@duration ,@c_email ,@employee_id  )
print 'customer added successfully'
end;



select e.f_name,e.l_name,s.f_name,s.l_name
from employee as e ,employee as s
where s.employee_id=e.manager_id;









































































































































































