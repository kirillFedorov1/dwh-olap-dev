
create   view ha.vw_DB_Contractors
as
select
	try_cast(c.ClientID as int) as ClientID
	,c.ClientCode
	,c.ClientName
	,d.ID as ID_DateCreated
from sa.DB_Contractors as c
	inner join dim.D_Date as d on convert(date, d.Date) = try_convert(date, c.DateCreated)
