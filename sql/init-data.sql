-- table: t_member
-- table: t_member
-- table: t_member

create table if not exists t_member
( id int,
  name varchar(50),
  address varchar(200),
  primary key (id)
);

truncate public.t_member ;
insert into public.t_member
(id, name, address)
values
(1, '张三', '广州'),
(2, '李四', '厦门'),
(3, '王五', '天津');

-- table: t_order
-- table: t_order
-- table: t_order
drop table if exists public.t_order;
create table if not exists public.t_order
( id int,
  member_id int,
  real_amount Decimal(10,4),
  status varchar(10),
  gmt_created timestamp,
  primary key (id)
);
truncate public.t_order ;
insert into public.t_order
(id, member_id, real_amount, status, gmt_created)
values
(10, 1, '10.00',    'paid',     '2022-01-01 10:00:00'),
(20, 1, '100.00',   'not-pay',  '2022-01-01 11:00:00'),
(30, 1, '99.00',    'paid',     '2022-01-01 12:00:00');

-- table: t_payment
-- table: t_payment
-- table: t_payment
drop table if exists public.t_payment;
create table if not exists public.t_payment
( id int,
  order_id int,
  payment_method varchar(20),
  amount Decimal(10,4),
  gmt_created timestamp,
  primary key (id)
);
truncate public.t_payment ;
insert into public.t_payment
(id, order_id, payment_method, amount, gmt_created)
values
(100, 10, '支付宝',      '3',      '2022-01-01 10:05:00'),
(101, 10, '支付宝',      '7',      '2022-01-01 10:05:00'),
(200, 30, 'wechat-js',    '99',     '2022-01-01 12:05:00');