# table1 --> stocks (trans_id, stk_id,stk_symbol, stk_values, trans_type) 
# e.g. ('FOX',2624, 6653,'BUY' )
# e.g. ('FOX',1111,2000,'SELL')
# o/p --> (stk_symbol profit/loss)

select stk_symbol, sum(tot_val) as [profit/loss]
from 
  (select stk_symbol,trans_type,
  case
  when trans_type='buy' then -sum(stk_value)
  when trans_type ='sell' then sum(stk_value)
  end as tot_val
  from stocks
  group by stk_symbol,trans_type) t 
group by stk_symbol
