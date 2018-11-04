select extract(month from "CreationDate") as "Month",
       extract(year from "CreationDate") as "Year",
       Count(*) as "Number"
from public."FactContact"
group by 1,2
order by "Year", "Month" asc
