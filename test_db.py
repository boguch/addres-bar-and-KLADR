from dbfread import DBF

# Укажите путь к вашему DBF файлу
dbf_file_path = 'cladr/DOMA.DBF'

# Чтение DBF файла
table = DBF(dbf_file_path)

# Вывод имен полей
print(f"Имена полей: {table.field_names}")

# Вывод первых 100 записей
for index, record in enumerate(table):
    if index < 100:  # Проверяем, меньше ли индекс 100
        print(record)  # Каждая запись представлена как OrderedDict
    else:
        break  # Выходим из цикла, если уже выведено 100 записей