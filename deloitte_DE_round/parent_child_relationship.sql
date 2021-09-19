# table1 --> People (id,name,gender)
# table2 --> Relations (c_id,p_id)
# o/p --> (child,father,mother) e.g. Tom Sam Hanna

select child,
max(case when gender ='M' then parents end) as father,
max(case when gender = 'F' then parents end) as mother
from
  (select r.c_id, r.p_id, p.name as child, p1.name as parents, p1.gender as gender
   from people p join relations r 
   on p.id = r.c_id join people p1
   on p1.id = r.p_id) temp
group by child
