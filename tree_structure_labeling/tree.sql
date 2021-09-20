select node,
case
when parent is null then 'root'
when node not in (select parent from tree where parent is not null) then 'leaf'
when node in (select parent from tree) and parent is not null then 'inner'
end as label
from tree
