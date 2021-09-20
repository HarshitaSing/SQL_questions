# table --> user_id, date 
# (1, "2018-07-06")
# (2, "2018-06-10")

# o/p --> (6 null), (7, 100)

with cte as
  (select count(user_id) as mau, month(date) as mth_num from logins
  group by month(date))
select a.mau as prev_user,
a.mth_num as prev_month,
b.mau as curr_user,
b.mth_num as curr_month,
(100 * (b.mau - a.mau) /a.mau) as percent_change
from cte a
join cte b
on a.mth_num = b.mth_num - 1


