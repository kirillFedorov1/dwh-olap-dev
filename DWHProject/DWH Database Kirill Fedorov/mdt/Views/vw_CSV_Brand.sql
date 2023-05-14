
create   view mdt.vw_CSV_Brand
as
select
	b.BrandID as UID_DS
	,b.BrandName as [Name]
	,b.Code
	,'CSV' as DataSource
from ha.CSV_Brand as b
