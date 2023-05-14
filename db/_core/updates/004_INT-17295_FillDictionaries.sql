insert into mapping.DataSource (Code, Description)
select
	d.Code
	,d.Description
from (
	values ('CSV', 'CSV DataSource')
		,('DB', 'DB DataSource')
) as d (Code, Description)
	left join mapping.DataSource as ds on ds.Code = d.Code
where ds.ID is null
