
create   view ha.vw_CSV_Contractors
as
select
	try_cast(c.ClientID as int) as ClientID
	,c.ClientCode
	,try_cast(c.ChainID as int) as ChainID
	,c.ClientName
	,d.ID as ID_DateCreated
from sa.CSV_Contractors as c
	inner join dim.D_Date as d on convert(date, d.Date) = try_convert(date, c.DateCreated)
