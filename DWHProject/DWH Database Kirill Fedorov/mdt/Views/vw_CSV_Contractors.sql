
create   view mdt.vw_CSV_Contractors
as
select
	c.ClientID as UID_DS
	,c.ClientCode as Code
	,c.ChainID as UID_DS_Chain
	,c.ClientName as [Name]
	,c.ID_DateCreated
	,'CSV' as DataSource
from ha.CSV_Contractors as c
