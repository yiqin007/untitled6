CREATE TABLE Student(
s_id VARCHAR(20),
s_name VARCHAR(20) NOT NULL DEFAULT'',
s_birth VARCHAR(20) NOT NULL DEFAULT '',
s_sex VARCHAR(10) NOT NULL DEFAULT'',
PRIMARY KEY(s_id)
);
– 课程表
CREATE TABLE Course(
c_id VARCHAR(20),
c_name VARCHAR(20) NOT NULL DEFAULT '',
t_id VARCHAR(20) NOT NULL,
PRIMARY KEY(c_id)
);
– 老师表
CREATE TABLE Teacher(
t_id VARCHAR(20),
t_name VARCHAR(20) NOT NULL DEFAULT '',
PRIMARY KEY(t_id)
);
– –成绩表
CREATE TABLE Score(
s_id VARCHAR(20),
c_id VARCHAR(20),
s_score INT(3),
PRIMARY KEY(s_id,c_id)
);



– 插入学生表测试数据
insert into Student values('01' , '赵雷' , '1990-01-01' , '男');
insert into Student values('02' , '钱电' , '1990-12-21' , '男');
insert into Student values('03' , '孙风' , '1990-05-20' , '男');
insert into Student values('0' , '李云' , '1990-08-06' , '男');
insert into Student values('05' , '周梅' , '1991-12-01' , '女');
insert into Student values('06' , '吴兰' , '1992-03-01' , '女');
insert into Student values('07' , '郑竹' , '989-07-01' , '女');
insert into Student values('08' , '王菊' ,'1990-01-20' , '女');
– 课程表测试数据
insert into Course values('01' , '语文' , '02');
insert into Course values('02' , '数学' , '01');
insert into Course values('03' , '英语' , '03');

– 老师表测试数据
insert into Teacher values('01' , '张三');
insert into Teacher values('02' , '李四');
insert into Teacher values('03' , '王五');

update student set s_id='04' where s_name='李云';

– 成绩表测试数据
insert into Score values('01' , '01' , '80');
insert into Score values('01' , '02' , '90');
insert into Score values('01' , '03' , '99');
insert into Score values('02' , '0' , '70');
insert into Score values('02' , '02' , '60');
insert into Score values('02' , '03' , '80');
insert into Score values('03' , '01' , '80');
insert into Score values('03' , '02' , '80');
insert into Score values('03' , '03' , '80');
insert into Score values('04' , '01' , '50');
insert into Score values('04' , '02' , '30');
insert into Score values('04' , '03' , '20');
insert into Score values('05' , '01' , '76');
insert into Score values('05' , '02' , '87');
insert into Score values('06' , '01' , '31');
insert into Score values('06' , '03' , '34');
insert into Score values('07' , '02' , '89');
insert into Score values('07' , '03' , '98');
update score set c_id='01' where s_score=70
//item1
select st.*,sc1.s_score as '语文',sc2.s_score as '数学' from student st
left JOIN score sc1  on sc1.s_id=st.s_id and sc1.c_id='01'
left join score sc2  on sc2.s_id=st.s_id and sc2.c_id='02'
where sc1.s_score>sc2.s_score
;
//item2
select st.s_id,st.s_name,sum(sc1.s_score)/count(sc1.c_id) AS average from  student st
left JOIN score sc1  on sc1.s_id=st.s_id 
group by st.s_id having average>=60;
//item3
select st.s_id,st.s_name,count(sc1.c_id) AS '选课总数' ,sum(sc1.s_score) as '总分'
from student st 
left join score sc1 on sc1.s_id=st.s_id
group by st.s_id
//item4
select st.*,sum(sc1.s_score) as '总分' from student st 
left join score sc1 on sc1.s_id=st.s_id
group by st.s_id  order by sum(sc1.s_score) desc;
//item5
select st.* from student st
where month(now())=month(date_format(st.s_birth,'%Y%m%d'))
//item6
select st.s_name from student st 
where st.s_id not in
(select sc.s_id from teacher te
left join course co on co.t_id=te.t_id
left join score sc on sc.c_id=co.c_id
where te.t_name='张三')



select  us.user_id buyer_id,us.join_date,
count(ord.buyer_id) AS 'orders_in_2019'  
from users us
left join Orders ord on  ord.buyer_id=us.user_id and  Year(ord.order_date)=  2019
GROUP BY us.user_id  order by us.user_id
