# Учебный Проект *dwh-olap-dev*. Решение для бизнес аналитики
## Цели
Ежедневно из источников db и внешних файлов от дистрибьюторов приходят транзакционные данные и обновления мастер данных. Необходимо разработать сбор и представление данных для бизнес аналитики. Используется фреймворк *DCore* (для перегрузки между слоями) и *Visual Studio* (для создания olap).
## Реализация
  - Загрузка данных дистрибьюторов во временный слой, предусмотрен бекап сырых данных;
  - Перегрузка данных из временного слоя в исторический слой, реализованы проверки данных, блокировка перегрузки, логирование ошибок;
  - Интеграция справочных данных из исторического слоя в master data management, реализован мэппинг на итоговые записи и ежедневное обновление итоговых;
  - Перегрузка справочных данных из mdm в dwh;
  - Формирование иерархии измерений продуктов и торговых точек;
  - Настройка ежедневного пересчета базовых и итоговых витрин фактов в dwh;
  - Создание olap куба и настройка ежедневного пересчета;
  - Выгрузка отчета Excel для бизнес аналитики;
  - Настройка ежедневного email оповещения по результатам.
## Описание объектов репозитория
  - *db/core/updates/* - создание и заполнение таблиц бд;
  - *db/core/scripts/view* - представления для перегрузок данных;
  - *db/core/scripts/view/ha.vw_CheckData.sql* - проверки сырых данных;
  - *db/core/scripts/procedure/ha.usp.CheckData* - блокировка перегрузки и логирование ошибок по результатам проверки сырых данных;
  - *DWHProject* - SQL Database Project, собранный в Visual Studio;
  - *Report.xlsx* - демонстрация отчета для аналитики.
