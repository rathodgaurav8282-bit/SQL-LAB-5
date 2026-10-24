create database bank;

use bank;

create table accounts(
accoudemonts_id int,
account_type varchar(20),
balance float);

select * from accounts;

create table transactions(
transaction_id int,
transaction_date date,
amount float,
transaction_type varchar(20));

select * from transactions;

create table branches(
branch_id int,
branch_name varchar(100),
branch_address varchar(200),
branch_phone varchar(15));

select * from branches;


create table loan(
loan_id int,
loan_amt float,
Intrest_rate float,
s_date date,
e_date date);

select * from loan;

create table customer(
customer_id int,
f_name varchar(50),
l_name varchar(50),
email varchar(100),
phone varchar(15));

select * from customer;

alter table customer add dateofbirth date;

alter table customer modify phone varchar(20);

alter table loan add column customer_id int;

alter table loan add constraint fk_customer_lo
foreign key (customer_id) references customer(customer_id);

alter table customer add constraint pr primary key(customer_id);

alter table transactions add column account_id int;

alter table transactions add constraint fk_account_transaction
foreign key (account_id) references accounts(account_id);

alter table transactions add constraint pr primary key(account_id);

alter table accounts rename column accoudemonts_id to account_id;

alter table transactions add constraint fk_account_tran
foreign key (account_id) references accounts(account_id);

alter table accounts add constraint pek primary key(account_id);

alter table loan add column cus_id int;

alter table customer  add constraint pr primary key(customer_id);

alter table loan add constraint fk_customer_loa 
foreign key (customer_id) references customer(customer_id);

alter table customer add column branch_id int;

alter table customer add constraint fk_branch_customer
foreign key (branch_id) references branches(branch_id);

alter table branches add constraint pri primary key (branch_id);

alter table transactions  add column customer_id int;

alter table transactions add constraint fk_customer_transactio
foreign key (customer_id) references customer(customer_id);

use bank;

insert into customer values(101,"Rahul","Sharma","rahul.sharma@gmail.com","9999999999","1998-04-15");
insert into customer values(102,"Priya","Patil","priya@gmail.com","9988776655","2000-09-20");
insert into customer values(103,"Amit","Patel","amit.patel@gmail.com","9876500001","1995-06-18");
insert into customer values(104,"Sneha","Joshi","sneha.joshi@gmail.com","9876500002","1997-09-12");
insert into customer values(105,"Rohan","Kulkarni","rohan.k@gmail.com","9876500003","1993-11-25");

select * from customer;

insert into loan values(301,500000,8.50,"2025-01-15","2030-01-15",101);
insert into loan values(302,300000,9.25,"2025-02-10","2028-02-10",102),
						(303,750000,8.75,"2025-03-20","2032-03-20",103),
                        (304,250000,10.00,"2025-04-05","2029-04-05",104),
                        (305,1000000,7.95,"2025-05-12","2035-05-12",105);
                        
select * from loan;

insert into branches values(1,"Mumbai Branch","Andheri, Mumbai","0221111111");
insert into branches values(2,"Pune Branch","Shivaji Nagar, Pune","0202222222");
insert into branches values(3,"Nashik Branch","College Road, Nashik","0253222222"),
                            (4,"Nagpur Branch","Sitabuldi, Nagpur","0712333333");
insert into branches values(5,"Navi Mumbai Branch","Vashi, Navi Mumbai","0224444444");

select * from branches;

insert into accounts values(201,"Savings",25000,101);
insert into accounts values(202,"Current",40000,102),(203,"Savings",35000,103),
							(204,"Current",60000,104),(205,"Savings",45000,105);

select * from accounts;


insert into transactions values(301,"2025-05-10",5000,"Deposit",201);
insert into transactions values(302,"2025-05-11",2500,"Withdraw",202),(303,"2025-05-12",10000,"Deposit",203),
								(304,"2025-05-13",3000,"Withdraw",204),(305,"2025-05-14",7000,"Deposite",205);
                                
select * from transactions;

update customer set phone="8888888888" where customer_id=101;

update customer set email="rahul_sharma@gmail.com" where customer_id=101;

update accounts set balance=30000 where account_id=201;

select * from customer;

select * from accounts;

delete from transactions where transaction_id=302;

delete from accounts where account_id=202;

select * from transactions;

select * from accounts;

alter table loan drop column cus_id;

alter table accounts add column branch_id int;

select * from loan 
where Intrest_rate >9 AND loan_amt >50000;

select * from branches
where branch_address="Sitabuldi, Nagpur";

select * from accounts
where balance between 500 AND 50000;

select * from accounts 
where balance >25000 AND account_type="Savings";

select * from loan 
where Intrest_rate <8.50;

select * from customer
where dateofbirth < "1998-01-01";

select * from branches
where branch_id between 2 AND 4;

select branch_name AND branch_phone 
from branches

select * from customer 
 limit 2 offset 1;
 
 select * from customer 
 where l_name like "p%";
 
















