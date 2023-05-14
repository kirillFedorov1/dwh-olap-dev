create or alter view ha.vw_CheckData
as

/*
-- Проверки на ссылочную целостность
select
	d.ID_Batch
	,d.DocID as ID_Record
	,1 as Number
	,'Error' as MessageType
	,'Нарушена ссылочная целостность между sa.DB_Documents и sa.DB_Contractors' as ErrorMessage
from sa.DB_Documents as d
	left join sa.DB_Contractors as c on c.ClientID = d.ClientID
where c.ClientID is null

union all

select
	f.ID_Batch
	,f.FactID as ID_Record
	,2 as Number
	,'Error' as MessageType
	,'Нарушена ссылочная целостность между sa.DB_Fact и sa.DB_Catalog, sa.DB_Documents' as ErrorMessage
from sa.DB_Fact as f
	left join sa.DB_Catalog as c on c.CatalogID = f.CatalogID
	left join sa.DB_Documents as d on d.DocID = f.DocID
where c.CatalogID is null
	or d.DocID is null

union all

select
	c.ID_Batch
	,c.ClientID as ID_Record
	,3 as Number
	,'Error' as MessageType
	,'Нарушена ссылочная целостность между sa.CSV_Contractors и sa.CSV_Chain' as ErrorMessage
from sa.CSV_Contractors as c
	left join sa.CSV_Chain as ch on ch.ChainID = c.ChainID
where ch.ChainID is null

union all

select
	c.ID_Batch
	,c.CatalogID as ID_Record
	,4 as Number
	,'Error' as MessageType
	,'Нарушена ссылочная целостность между sa.CSV_Catalog и sa.CSV_Brand' as ErrorMessage
from sa.CSV_Catalog as c
	left join sa.CSV_Brand as b on b.BrandID = c.BrandID
where b.BrandID is null

union all

select
	d.ID_Batch
	,d.DocID as ID_Record
	,5 as Number
	,'Error' as MessageType
	,'Нарушена ссылочная целостность между sa.CSV_Documents и sa.CSV_Contractors' as ErrorMessage
from sa.CSV_Documents as d
	left join sa.CSV_Contractors as c on c.ClientID = d.ClientID
where c.ClientID is null

union all

select
	f.ID_Batch
	,f.FactID as ID_Record
	,6 as Number
	,'Error' as MessageType
	,'Нарушена ссылочная целостность между sa.CSV_Facts и sa.CSV_Catalog, sa.CSV_Documents' as ErrorMessage
from sa.CSV_Facts as f
	left join sa.CSV_Catalog as c on c.CatalogID = f.CatalogID
	left join sa.CSV_Documents as d on d.DocID = f.DocID
where c.CatalogID is null
	or d.DocID is null
*/

-- Проверки на преобразование данных
--union all

select
	c.ID_Batch
	,c.ClientID as ID_Record
	,7 as Number
	,'Warning' as MessageType
	,'Некорректный тип данных в sa.DB_Contractors' as ErrorMessage
from sa.DB_Contractors as c
where isnumeric(c.ClientID) = 0
	or isdate(c.DateCreated) = 0

union all

select
	c.ID_Batch
	,c.CatalogID as ID_Record
	,8 as Number
	,'Warning' as MessageType
	,'Некорректный тип данных в sa.DB_Catalog' as ErrorMessage
from sa.DB_Catalog as c
where isnumeric(c.CatalogID) = 0
	or isnumeric(c.SkuID) = 0
	or isdate(c.DateCreated) = 0

union all

select
	d.ID_Batch
	,d.DocID as ID_Record
	,9 as Number
	,'Warning' as MessageType
	,'Некорректный тип данных в sa.DB_Documents' as ErrorMessage
from sa.DB_Documents as d
where isnumeric(d.DocID) = 0
	or isnumeric(d.ClientID) = 0
	or isdate(d.DocDate) = 0
	or isdate(d.DateCreated) = 0

union all

select
	f.ID_Batch
	,f.FactID as ID_Record
	,10 as Number
	,'Warning' as MessageType
	,'Некорректный тип данных в sa.DB_Fact' as ErrorMessage
from sa.DB_Fact as f
where isnumeric(f.FactID) = 0
	or isnumeric(f.CatalogID) = 0
	or isnumeric(f.DocID) = 0
	or isnumeric(f.Quantity) = 0
	or isnumeric(f.AmountBP) = 0
	or isnumeric(f.AmountCP) = 0
	or isdate(f.DateCreated) = 0

union all

select
	c.ID_Batch
	,c.ClientID as ID_Record
	,11 as Number
	,'Warning' as MessageType
	,'Некорректный тип данных в sa.CSV_Contractors' as ErrorMessage
from sa.CSV_Contractors as c
where isnumeric(c.ClientID) = 0
	or isnumeric(c.ChainID) = 0
	or isdate(c.DateCreated) = 0

union all

select
	c.ID_Batch
	,c.CatalogID as ID_Record
	,12 as Number
	,'Warning' as MessageType
	,'Некорректный тип данных в sa.CSV_Catalog' as ErrorMessage
from sa.CSV_Catalog as c
where isnumeric(c.CatalogID) = 0
	or isnumeric(c.SkuID) = 0
	or isdate(c.DateCreated) = 0

union all

select
	b.ID_Batch
	,b.BrandID as ID_Record
	,13 as Number
	,'Warning' as MessageType
	,'Некорректный тип данных в sa.CSV_Brand' as ErrorMessage
from sa.CSV_Brand as b
where isnumeric(b.BrandID) = 0

union all

select
	c.ID_Batch
	,c.ChainID as ID_Record
	,14 as Number
	,'Warning' as MessageType
	,'Некорректный тип данных в sa.CSV_Chain' as ErrorMessage
from sa.CSV_Chain as c
where isnumeric(c.ChainID) = 0

union all

select
	d.ID_Batch
	,d.DocID as ID_Record
	,15 as Number
	,'Warning' as MessageType
	,'Некорректный тип данных в sa.CSV_Documents' as ErrorMessage
from sa.CSV_Documents as d
where isnumeric(d.DocID) = 0
	or isnumeric(d.ClientID) = 0
	or isdate(d.DocDate) = 0
	or isdate(d.DateCreated) = 0

union all

select
	f.ID_Batch
	,f.FactID as ID_Record
	,16 as Number
	,'Warning' as MessageType
	,'Некорректный тип данных в sa.CSV_Facts' as ErrorMessage
from sa.CSV_Facts as f
where isnumeric(f.FactID) = 0
	or isnumeric(f.CatalogID) = 0
	or isnumeric(f.DocID) = 0
	or isnumeric(f.Quantity) = 0
	or isnumeric(f.AmountBP) = 0
	or isnumeric(f.AmountCP) = 0
	or isdate(DateCreated) = 0

-- Проверки на дубликаты
union all

select
	c.ID_Batch
	,c.ClientID as ID_Record
	,17 as Number
	,'Error' as MessageType
	,'Дубликаты в sa.DB_Contractors' as ErrorMessage
from sa.DB_Contractors as c
group by c.ID_Batch,c.ClientID
having count(*) > 1

union all

select
	c.ID_Batch
	,c.CatalogID as ID_Record
	,18 as Number
	,'Error' as MessageType
	,'Дубликаты в sa.DB_Catalog' as ErrorMessage
from sa.DB_Catalog as c
group by c.ID_Batch,c.CatalogID
having count(*) > 1

union all

select
	d.ID_Batch
	,d.DocID as ID_Record
	,19 as Number
	,'Error' as MessageType
	,'Дубликаты в sa.DB_Documents' as ErrorMessage
from sa.DB_Documents as d
group by d.ID_Batch,d.DocID
having count(*) > 1

union all

select
	f.ID_Batch
	,f.FactID as ID_Record
	,20 as Number
	,'Error' as MessageType
	,'Дубликаты в sa.DB_Fact' as ErrorMessage
from sa.DB_Fact as f
group by f.ID_Batch,f.FactID
having count(*) > 1

union all

select
	c.ID_Batch
	,c.ClientID as ID_Record
	,21 as Number
	,'Error' as MessageType
	,'Дубликаты в sa.CSV_Contractors' as ErrorMessage
from sa.CSV_Contractors as c
group by c.ID_Batch,c.ClientID
having count(*) > 1

union all

select
	c.ID_Batch
	,c.CatalogID as ID_Record
	,22 as Number
	,'Error' as MessageType
	,'Дубликаты в sa.CSV_Catalog' as ErrorMessage
from sa.CSV_Catalog as c
group by c.ID_Batch,c.CatalogID
having count(*) > 1

union all

select
	b.ID_Batch
	,b.BrandID as ID_Record
	,23 as Number
	,'Error' as MessageType
	,'Дубликаты в sa.CSV_Brand' as ErrorMessage
from sa.CSV_Brand as b
group by b.ID_Batch,b.BrandID
having count(*) > 1

union all

select
	c.ID_Batch
	,c.ChainID as ID_Record
	,24 as Number
	,'Error' as MessageType
	,'Дубликаты в sa.CSV_Chain' as ErrorMessage
from sa.CSV_Chain as c
group by c.ID_Batch,c.ChainID
having count(*) > 1

union all

select
	d.ID_Batch
	,d.DocID as ID_Record
	,25 as Number
	,'Error' as MessageType
	,'Дубликаты в sa.CSV_Documents' as ErrorMessage
from sa.CSV_Documents as d
group by d.ID_Batch,d.DocID
having count(*) > 1

union all

select
	f.ID_Batch
	,f.FactID as ID_Record
	,26 as Number
	,'Error' as MessageType
	,'Дубликаты в sa.CSV_Facts' as ErrorMessage
from sa.CSV_Facts as f
group by f.ID_Batch,f.FactID
having count(*) > 1

/*
-- Проверки на закрытый период (последние 2 месяца)
union all

select
	d.ID_Batch
	,d.DocID as ID_Record
	,27 as Number
	,'Error' as MessageType
	,'Закрытый период в sa.DB_Documents' as ErrorMessage
from sa.DB_Documents as d
where cast(d.DocDate as date) <= dateadd(m, -2, getdate())

union all

select
	f.ID_Batch
	,f.FactID as ID_Record
	,28 as Number
	,'Error' as MessageType
	,'Закрытый период в sa.DB_Fact' as ErrorMessage
from sa.DB_Fact as f
	inner join sa.DB_Documents as d on d.DocID = f.DocID
where cast(d.DocDate as date) <= dateadd(m, -2, getdate())

union all

select
	d.ID_Batch
	,d.DocID as ID_Record
	,29 as Number
	,'Error' as MessageType
	,'Закрытый период в sa.CSV_Documents' as ErrorMessage
from sa.CSV_Documents as d
where cast(d.DocDate as date) <= dateadd(m, -2, getdate())

union all

select
	f.ID_Batch
	,f.FactID as ID_Record
	,30 as Number
	,'Error' as MessageType
	,'Закрытый период в sa.CSV_Facts' as ErrorMessage
from sa.CSV_Facts as f
	inner join sa.CSV_Documents as d on d.DocID = f.DocID
where cast(d.DocDate as date) <= dateadd(m, -2, getdate())
*/

-- Проверка на пустые поля
union all

select
	c.ID_Batch
	,c.ClientID as ID_Record
	,30 as Number
	,'Warning' as MessageType
	,'Пустое поле в sa.DB_Contractors' as ErrorMessage
from sa.DB_Contractors as c
where ClientID is null
	or ClientCode is null
	or ClientName is null
	or DateCreated is null

union all

select
	c.ID_Batch
	,c.CatalogID as ID_Record
	,30 as Number
	,'Warning' as MessageType
	,'Пустое поле в sa.DB_Catalog' as ErrorMessage
from sa.DB_Catalog as c
where c.CatalogID is null
	or c.SkuCode is null
	or c.SkuName is null
	or c.SkuID is null
	or c.DateCreated is null

union all

select
	d.ID_Batch
	,d.DocID as ID_Record
	,30 as Number
	,'Warning' as MessageType
	,'Пустое поле в sa.DB_Documents' as ErrorMessage
from sa.DB_Documents as d
where d.DocID is null
	or d.ClientID is null
	or d.DocNumber is null
	or d.DocDate is null
	or d.DateCreated is null

union all

select
	f.ID_Batch
	,f.FactID as ID_Record
	,30 as Number
	,'Warning' as MessageType
	,'Пустое поле в sa.DB_Fact' as ErrorMessage
from sa.DB_Fact as f
where f.FactID is null
	or f.CatalogID is null
	or f.DocID is null
	or f.Quantity is null
	or f.AmountBP is null
	or f.AmountCP is null
	or f.DateCreated is null

union all

select
	c.ID_Batch
	,c.ClientID as ID_Record
	,30 as Number
	,'Warning' as MessageType
	,'Пустое поле в sa.CSV_Contractors' as ErrorMessage
from sa.CSV_Contractors as c
where ClientID is null
	or ClientCode is null
	or ChainID is null
	or ClientName is null
	or DateCreated is null

union all

select
	c.ID_Batch
	,c.CatalogID as ID_Record
	,30 as Number
	,'Warning' as MessageType
	,'Пустое поле в sa.CSV_Catalog' as ErrorMessage
from sa.CSV_Catalog as c
where c.CatalogID is null
	or c.SkuCode is null
	or c.SkuName is null
	or c.SkuID is null
	or c.DateCreated is null
	or c.BrandID is null

union all

select
	b.ID_Batch
	,b.BrandID as ID_Record
	,30 as Number
	,'Warning' as MessageType
	,'Пустое поле в sa.CSV_Brand' as ErrorMessage
from sa.CSV_Brand as b
where b.BrandID is null
	or b.BrandName is null
	or b.Code is null

union all

select
	c.ID_Batch
	,c.ChainID as ID_Record
	,30 as Number
	,'Warning' as MessageType
	,'Пустое поле в sa.CSV_Chain' as ErrorMessage
from sa.CSV_Chain as c
where c.ChainID is null
	or c.ChainName is null
	or c.Code is null

union all

select
	d.ID_Batch
	,d.DocID as ID_Record
	,30 as Number
	,'Warning' as MessageType
	,'Пустое поле в sa.CSV_Documents' as ErrorMessage
from sa.CSV_Documents as d
where d.DocID is null
	or d.ClientID is null
	or d.DocNumber is null
	or d.DocDate is null
	or d.DateCreated is null

union all

select
	f.ID_Batch
	,f.FactID as ID_Record
	,30 as Number
	,'Warning' as MessageType
	,'Пустое поле в sa.CSV_Facts' as ErrorMessage
from sa.CSV_Facts as f
where f.FactID is null
	or f.CatalogID is null
	or f.DocID is null
	or f.Quantity is null
	or f.AmountBP is null
	or f.AmountCP is null
	or f.DateCreated is null
