import psycopg2
from dbfread import DBF

# Конфигурация базы данных
conn = psycopg2.connect("dbname='mydatabase' user='postgres' password='123654' options='-c client_encoding=UTF8'")
dbf_file = 'cladr/DOMA.DBF'

# Индекс второго и третьего столбца 
column_to_import_1 = 0  # Первый столбец
column_to_import_2 = 3  # Второй столбец


with conn:
    with conn.cursor() as cursor:
        # Чтение DBF файла
        table = DBF(dbf_file)

        # Подготовка SQL-запроса для вставки данных
        insert_query = "INSERT INTO doma (name,code) VALUES (%s, %s)"  # Замените на реальное имя второго столбца в вашей таблице

        # Вставка всех записей
        for record in table:
            try:
                # Извлечение второго и третьего столбца
                column_names = list(record.keys())
                data_to_insert = (
                    record[column_names[column_to_import_1]],  # Значение первого столбца
                    record[column_names[column_to_import_2]]  # Значение второго столбца  
                    
                )
                
                print(f"Вставляемые данные: {data_to_insert}")
                
                cursor.execute(insert_query, data_to_insert)
            except Exception as e:
                print(f"Ошибка при вставке данных: {e}, запись: {record}")
                conn.rollback()  # Отмена текущей транзакции в случае ошибки
        
        # Сохранение изменений
        conn.commit()

print("Все записи успешно перенесены.")