
create   view mdt.vw_DB_Contractors
as
select
	c.ClientID as UID_DS
	,c.ClientCode as Code
	,c.ClientName as [Name]
	,c.ID_DateCreated
	,'DB' as DataSource
from ha.DB_Contractors as c
