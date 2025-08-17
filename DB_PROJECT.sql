 create database ecomm_project;
 use ecomm_project;

  create table warehouse
 (
 w_no int primary key,
    location varchar(50)
 );
 create table products
 (
 p_no int primary key,
    pname varchar(50),
    price float,
    mrp float,
    category varchar(20)
 );
 create table stock
 (
 p_no int,
    w_no int,
    quantity int,
    exp_date date,
    primary key(p_no,w_no),
    foreign key(p_no) references products(p_no),
    foreign key(w_no) references warehouse(w_no)
 );
create table supplies
 (
 p_no int,
    w_no int,
    supp_date date,
    quantity int,
    exp_date date,
    primary key(p_no,w_no,supp_date),
    foreign key(p_no) references products(p_no),
    foreign key(w_no) references warehouse(w_no)
);
create table expired
 (
 p_no int,
    w_no int,
    ret_date date,
    quantity int,
    primary key(p_no,w_no,ret_date),
    foreign key(p_no) references products(p_no),
    foreign key(w_no) references warehouse(w_no)
 );
create table customer
 (
 username varchar(50) primary key,
    pass varchar(50),
    cname varchar(50),
    phno varchar(10),
    email varchar(50)
 );
create table card
 (
 cno int,
    username varchar(50),
    cvv int,
    exp_date date,
    nameoncard varchar(50),
    card_type varchar(20),
    primary key(cno,username),
    foreign key(username) references customer(username)
 );
create table address_
 (
	ad_no int,
    username varchar(50),
    hno varchar(10),
    street varchar(10),
    city varchar(50),
    pincode int,
    primary key(ad_no,username),
    foreign key (username) references customer(username)
 );
create table cart
 (
 username varchar(50),
    p_no int,
    quantity int,
    primary key(username,p_no),
    foreign key (username) references customer(username),
    foreign key (p_no) references products(p_no)
 );
create table delivery_service
 (
 ds_id int primary key,
    ds_name varchar(50),
    contact varchar(50)
 );
create table order_
 (
	order_id int primary key,
    order_date date,
    order_status varchar(20),
    w_no int,
    username varchar(50),
    tot_price float,
    gorss_price float,
    discount float,
    ad_no int,
    ds_id int,
    tracking_id int,
    dstatus varchar(20),
    foreign key (w_no) references warehouse(w_no),
    foreign key (username) references customer(username),
    foreign key (ad_no, username) references address_(ad_no, username),
    foreign key (ds_id) references delivery_service(ds_id)
 );
create table order_item
(
 order_id int,
 p_no int,
 quantity int,
 primary key(order_id,p_no),
 foreign key(order_id) references order_(order_id),
 foreign key(p_no) references products(p_no)
 );
create table payment
 (
 payment_id int primary key,
 payment_status varchar(20),
 amount float,
 cno int,
 username varchar(50),
 order_id int,
 foreign key (cno,username) references card(cno,username),
 foreign key (order_id) references order_(order_id)
 );

insert into warehouse values(1,'HYDERABAD');
insert into warehouse values(2,'BENGALURU');
insert into warehouse values(3,'MUMBAI');

 insert into products values(1,'OPPO F-19 
PRO',22000,25000,'ELECTRONICS');
 insert into products values(2,'REALME 8 
PRO',18000,20000,'ELECTRONICS');
 insert into products values(3,'PARLE-G',48,50,'FOOD');
 insert into products values(4,'DIARY MILK',67,70,'FOOD');
 insert into products values(5,'BOAT HEADSET',1500,2000,'ACCESORIES');
 insert into products values(6,'CINTHOL SOAP',30,33,'COSMETICS');
 insert into products values(7,'MAGGIE',69,72,'GROCERIES');
 insert into products values(8,'BOOST',100,105,'GROCERIES');


insert into stock values(1,1,4,null);
insert into stock values(2,1,11,null);
insert into stock values(3,1,7,CONVERT(date,'2022-10-11',23));
insert into stock values(4,1,11,CONVERT(date,'2022-10-01',23));
insert into stock values(5,1,10,CONVERT(date,'2022-10-21',23));
insert into stock values(3,2,9,CONVERT(date,'2022-10-01',23));
insert into stock values(4,2,18,CONVERT(date,'2022-10-30',23));
insert into stock values(5,2,10,null);
insert into stock values(6,2,19,CONVERT(date,'2022-10-11',23));
insert into stock values(7,2,11,CONVERT(date,'2022-10-10',23));
insert into stock values(1,3,1,null);
insert into stock values(2,3,6,null);
insert into stock values(6,3,13,CONVERT(date,'2022-10-09',23));
insert into stock values(7,3,5,CONVERT(date,'2022-10-05',23));
insert into stock values(8,3,4,CONVERT(date,'2022-10-04',23));


insert into supplies values(1,1,CONVERT(date,'2020-10-11',23),5,null);
insert into supplies values(2,1,CONVERT(date,'2020-10-01',23),11,null);
insert into supplies values(3,1,CONVERT(date,'2020-10-14',23),9,CONVERT(date,'2022-10-11',23));
insert into supplies values(4,1,CONVERT(date,'2020-10-12',23),11,CONVERT(date,'2022-10-01',23));
insert into supplies values(5,1,CONVERT(date,'2020-10-22',23),13,CONVERT(date,'2022-10-21',23));
insert into supplies values(3,2,CONVERT(date,'2020-10-19',23),10,CONVERT(date,'2022-10-01',23));
insert into supplies values(4,2,CONVERT(date,'2020-10-16',23),22,CONVERT(date,'2022-10-30',23));
insert into supplies values(5,2,CONVERT(date,'2020-10-14',23),10,null);
insert into supplies values(6,2,CONVERT(date,'2020-10-10',23),19,CONVERT(date,'2022-10-11',23));
insert into supplies values(7,2,CONVERT(date,'2020-10-10',23),14,CONVERT(date,'2022-10-10',23));
insert into supplies values(1,3,CONVERT(date,'2020-10-07',23),11,null);
insert into supplies values(2,3,CONVERT(date,'2020-10-18',23),1,null);
insert into supplies values(6,3,CONVERT(date,'2020-10-14',23),7,CONVERT(date,'2022-10-09',23));
insert into supplies values(7,3,CONVERT(date,'2020-10-25',23),16,CONVERT(date,'2022-10-05',23));
insert into supplies values(8,3,CONVERT(date,'2020-10-29',23),5,CONVERT(date,'2022-10-04',23));
insert into supplies values(8,3,CONVERT(date,'2020-10-20',23),9,CONVERT(date,'2021-01-01',23));



insert into expired values(8,3,CONVERT(date,'2021-01-01',23),5);



insert into customer values('SUSHITH','SUS','SUSHITH 
REDDY','1111111111','sushith@xyz.com');
 insert into customer values('PARTHIV','PAR','PARTHIV 
REDDY','2222222222','parthiv@xyz.com');
 insert into customer values('ABHINAV','ABHI','ABHINAV 
REDDY','3333333333','abhinav@xyz.com');
 insert into customer values('ROHITH','ROH','ROHITH 
RAO','4444444444','rohith@xyz.com');


insert into card values(1000,'SUSHITH',123,CONVERT(date,'2025-12-31',23),'A','VISA');
insert into card values(1001,'SUSHITH',456,CONVERT(date,'2025-12-31',23),'B','RUPAY');
insert into card values(1002,'PARTHIV',789,CONVERT(date,'2025-12-31',23),'C','MASTER CARD');
insert into card values(1003,'PARTHIV',145,CONVERT(date,'2025-12-31',23),'D','AMERICAN EXPRESS');
insert into card values(1004,'ROHITH',567,CONVERT(date,'2025-12-31',23),'E','RUPAY');
insert into card values(1005,'ABHINAV',123,CONVERT(date,'2025-12-31',23),'F','VISA');


 insert into address_ values(1,'SUSHITH','1-1','A','HYDERABAD',500001);
 insert into address_ values(2,'SUSHITH','1-2','B','HYDERABAD',500002);
 insert into address_ values(1,'PARTHIV','1-3','C','HYDERABAD',500003);
 insert into address_ values(2,'PARTHIV','1-4','D','HYDERABAD',500004);
 insert into address_ values(1,'ABHINAV','1-5','E','HYDERABAD',500005);
 insert into address_ values(1,'ROHITH','1-6','F','HYDERABAD',500006);

 insert into cart values('SUSHITH',1,1);
insert into cart values('SUSHITH',3,2);
 insert into cart values('SUSHITH',6,5);
 insert into cart values('SUSHITH',8,3);
 insert into cart values('PARTHIV',2,1);
 insert into cart values('PARTHIV',4,3);
 insert into cart values('PARTHIV',5,4);
 insert into cart values('PARTHIV',6,2);
 insert into cart values('ROHITH',2,1);
 insert into cart values('ROHITH',7,4);
 insert into cart values('ABHINAV',3,3);
 insert into cart values('ABHINAV',5,1);

  insert into delivery_service values(1,'INDIA 
POST','indiapost@indiapost.gov.in');
 insert into delivery_service values(2,'BLUE DART','bluedart@bluedart.com');
 insert into delivery_service values(3,'FEDEX','fedex@fedex.com');
 insert into delivery_service values(4,'DHL','dhl@dhl.com');


 insert into order_ values(1,CONVERT(date,'2020-12-31',23),'SUCCESS',1,'SUSHITH',22098,25100,3004,1,1,1,'DELIVERED');
insert into order_ values(2,CONVERT(date,'2021-01-02',23),'SUCCESS',2,'SUSHITH',268,280,12,2,2,2,'DELIVERED');
insert into order_ values(3,CONVERT(date,'2021-01-05',23),'SUCCESS',2,'PARTHIV',531,554,23,1,3,3,'DELIVERED');
insert into order_ values(4,CONVERT(date,'2021-01-09',23),'SUCCESS',3,'PARTHIV',500,525,25,2,4,4,'DELIVERED');
insert into order_ values(5,CONVERT(date,'2021-01-11',23),'SUCCESS',3,'ROHITH',18000,20000,2000,1,1,5,'DELIVERED');
insert into order_ values(6,CONVERT(date,'2021-01-16',23),'SUCCESS',3,'ABHINAV',90,99,9,1,2,6,'DELIVERED');
insert into order_ values(7,CONVERT(date,'2021-01-19',23),'SUCCESS',1,'ABHINAV',1500,200,500,1,3,7,'DELIVERED');
insert into order_ values(8,CONVERT(date,'2021-01-22',23),'NO STOCK',null,'SUSHITH',22148,25155,3007,1,null,null,null);
insert into order_ values(9,CONVERT(date,'2021-01-25',23),'NO STOCK',null,'PARTHIV',22136,25142,3006,2,null,null,null);
insert into order_ values(10,CONVERT(date,'2021-01-31',23),'PAYMENT FAILED',null,'ROHITH',18000,20000,2000,1,null,null,null);


 insert into order_item values(1,1,1);
 insert into order_item values(1,3,2);
 insert into order_item values(2,4,4);
 insert into order_item values(3,3,1);
 insert into order_item values(3,7,3);
 insert into order_item values(4,8,5);
 insert into order_item values(5,2,1);
 insert into order_item values(6,6,3);
 insert into order_item values(7,5,3);
insert into order_item values(8,1,1);
 insert into order_item values(8,3,1);
 insert into order_item values(8,8,1);
 insert into order_item values(9,1,1);
 insert into order_item values(9,4,1);
 insert into order_item values(9,7,1);
 insert into order_item values(10,2,1);


  insert into payment values(1,'SUCCESS',22098,1000,'SUSHITH',1);
 insert into payment values(2,'SUCCESS',268,1001,'SUSHITH',2);
 insert into payment values(3,'SUCCESS',531,1002,'PARTHIV',3);
 insert into payment values(4,'SUCCESS',500,1003,'PARTHIV',4);
 insert into payment values(5,'SUCCESS',18000,1004,'ROHITH',5);
 insert into payment values(6,'SUCCESS',90,1005,'ABHINAV',6);
 insert into payment values(7,'SUCCESS',1500,1005,'ABHINAV',7);
 insert into payment values(8,'INSUFFICIENT FUNDS',18000,1004,'ROHITH',10);



