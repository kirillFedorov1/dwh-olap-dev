if not exists (select 1 from sys.schemas where name = 'olap')
begin
	exec('create schema olap');
end
