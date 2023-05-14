create   procedure ha.usp_CheckData
as
set nocount on
begin try
	-- Результаты представления проверок
	declare @vw_CheckDataResults table (
		ID_Batch int
		,Number int
		,ID_Record int
		,MessageType varchar(255)
		,ErrorMessage varchar(255)
	);

	-- Заполнение результатов представления проверок
	insert into @vw_CheckDataResults (ID_Batch, Number, ID_Record, MessageType, ErrorMessage)
	select ID_Batch, Number, ID_Record, MessageType, ErrorMessage
	from ha.vw_CheckData;

	-- Заполнение лога с ошибками и предупреждениями
	insert into dbo.CheckLog (ID_Batch, Number, ID_Record, MessageType, ErrorMessage, ErrorDate)
	select
		cd.ID_Batch as ID_Batch
		,cd.Number as Number
		,cd.ID_Record as ID_Record
		,cd.MessageType as MessageType
		,cd.ErrorMessage as ErrorMessage
		,getdate() as ErrorDate
	from @vw_CheckDataResults as cd

	-- Прерывание работы маршрута
	if exists (
		select 1
		from @vw_CheckDataResults
		where MessageType = 'Error'
	)
	begin
		raiserror('Некорректные данные', 3, 2);

		return;
	end
end try
begin catch
	;throw
end catch
