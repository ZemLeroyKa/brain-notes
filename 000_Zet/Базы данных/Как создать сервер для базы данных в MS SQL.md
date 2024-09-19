Инструкция один
https://metanit.com/sql/sqlserver/1.4.php
Здесь показано, как установить SqlLocalDB и как подключиться к созданной базе данных

Инструкция два
- https://learn.microsoft.com/ru-ru/sql/relational-databases/express-localdb-instance-apis/command-line-management-tool-sqllocaldb-exe?view=sql-server-ver16
- https://learn.microsoft.com/ru-ru/sql/tools/sqllocaldb-utility?view=sql-server-ver16
Здесь демонстрируется набор команд для создания сервера MS SQL

1. Установить SqlLocalDB
2. Открыть CMD (консоль Windows)
3. Проверить, что SqlLocalDB Установлен запуском команды SqlLocalDB
4. Проверить, какие сервера уже созданы командой `SqlLocalDB info`: Выводит список всех экземпляров SQL Server Express **LocalDB** , принадлежащих текущему пользователю.
5. Создать новый сервер командой `sqllocaldb create "Имя сервера"`
6. Дождаться сообщения, что сервер создан (у меня быстро было)
7. Запустить MS SQL Server Management Studio и найти в настройках ![[Pasted image 20240919193104.png]]