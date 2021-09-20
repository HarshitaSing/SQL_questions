with cte as
  (select count(user_id) as mau, month(date) as mth_num from logins
  group by month(date))
select mau as user_count,
mth_num as prev_month,
(100 * (mau - lag(mau,1) over (order by mth_num)) / (lag(mau,1) over (order by mth_num))) as percent_increase
from cte

