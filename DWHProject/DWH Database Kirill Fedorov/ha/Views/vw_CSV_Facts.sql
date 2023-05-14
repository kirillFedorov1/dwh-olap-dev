create   view ha.vw_CSV_Facts
as
select
	d.ID_YearMonth as nPartYearMonth
	,try_cast(f.FactID as int) as FactID
	,try_cast(f.CatalogID as int) as CatalogID
	,try_cast(f.DocID as int) as DocID
	,try_cast(f.Quantity as int) as Quantity
	,try_cast(f.AmountBP as decimal(18, 4)) as AmountBP
	,try_cast(f.AmountCP as decimal(18, 4)) as AmountCP
	,d.ID as ID_DateCreated
from sa.CSV_Facts as f
	inner join dim.D_Date as d on convert(date, d.Date) = try_convert(date, f.DateCreated)
