
create   view ha.vw_CSV_Chain
as
select
	try_cast(ChainID as int) as ChainID
	,ChainName
	,Code
from sa.CSV_Chain
