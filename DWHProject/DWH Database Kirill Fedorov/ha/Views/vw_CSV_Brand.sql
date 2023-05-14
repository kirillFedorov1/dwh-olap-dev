
create   view ha.vw_CSV_Brand
as
select
	try_cast(BrandID as int) as BrandID
	,BrandName
	,Code
from sa.CSV_Brand
