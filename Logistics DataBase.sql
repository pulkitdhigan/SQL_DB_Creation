-- Creating project Database for Logistics
create database logistics_project;
use logistics_project;

-- 1) Employee_Details Table:
create table Employee_Details (
Emp_ID int(5),
Emp_Name varchar(30),
Emp_branch varchar(15),
Emp_Designation varchar(40),
Emp_Addr varchar (100),
Emp_Cont_No varchar(10), 
primary Key (Emp_ID) );

-- 2) Membership Table:
create table Membership (
M_ID int,
Start_Date varchar(200),
End_Date varchar(200),
primary key (M_ID) );

-- 3) Customer Table:
create table Customer (
Cust_ID int(4),
Cust_Name varchar(30),
Cust_Email_ID varchar(50),
Cust_Cont_No varchar(10),
Cust_Addr varchar(100),
Cust_Type varchar(30),
Membership_M_ID int,
Primary Key (Cust_ID),
foreign key (Membership_M_ID) references membership(M_ID) );

-- 4) Payment_Details Table:
create table Payment_Details (
Payment_ID varchar(40),
Amount int,
Payment_Status varchar(10),
Payment_Date text,
Payment_Mode varchar(25),
Shipment_Sh_ID varchar(6),
Shipment_Client_C_ID int(4),
primary key (Payment_ID),
foreign Key (Shipment_Sh_ID) references Shipment_Details(SD_ID),
foreign key (Shipment_Client_C_ID) references customer(Cust_ID) );

-- 5) Shipment_Details Table:
create table Shipment_Details (
SD_ID varchar(6),
SD_Content varchar(40),
SD_Domain varchar(15),
SD_Type varchar(15),
SD_Weight varchar(10),
SD_Charges int(10),
SD_Addr varchar(100),
DS_Addr varchar(100),
Customer_Cust_ID int(4),
primary key (SD_ID),
foreign key (Customer_Cust_ID) references Customer(Cust_ID) );

-- 6) Status table:
create table Status (
Current_ST varchar(15),
Sent_Date text,
Delivery_Date text,
SH_ID varchar(6),
primary key (SH_ID) );

-- 7) Employee Manages Shipment Table:
create table Employee_Manages_Shipment (
Employee_E_ID int(5),
Shipment_SH_ID varchar(6),
Status_SH_ID varchar(6),
foreign key (Employee_E_ID) references Employee_Details(Emp_ID) ,
foreign key (Shipment_SH_ID) references Shipment_Details(SD_ID),
foreign key (Status_SH_ID) references status(SH_ID) );