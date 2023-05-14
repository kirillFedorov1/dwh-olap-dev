
create   view mdt.vw_CSV_Chain
as
select
	c.ChainID as UID_DS
	,c.ChainName as [Name]
	,c.Code
	,'CSV' as DataSource
from ha.CSV_Chain as c
