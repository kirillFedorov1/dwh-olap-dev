
create   view dim.vw_D_Date
as
select distinct
	d.ID_YearMonth as nPartYearMonth
	,d.MonthName
	,d.ID_Month
	,d.ID_Quarter
	,d.ID_Year
from dim.D_Date as d
