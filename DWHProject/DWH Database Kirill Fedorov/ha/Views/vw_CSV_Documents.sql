
create   view ha.vw_CSV_Documents
as
select
	dc.ID_YearMonth as nPartYearMonth
	,try_cast(doc.DocID as int) as DocID
	,try_cast(doc.ClientID as int) as ClientID
	,doc.DocNumber
	,dd.ID as ID_DocDate
	,dc.ID as ID_DateCreated
from sa.CSV_Documents as doc
	inner join dim.D_Date as dd on convert(date, dd.Date) = try_convert(date, doc.DocDate)
	inner join dim.D_Date as dc on convert(date, dc.Date) = try_convert(date, doc.DateCreated)
