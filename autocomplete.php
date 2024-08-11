<?php
// Подключение к базе данных PostgreSQL
$conn = pg_connect("host=localhost dbname=mydatabase user=postgres password=123654");

// Проверка успешности подключения к базе данных
if (!$conn) {
    die("Ошибка подключения: " . pg_last_error());
}

// Функция для получения результатов автозаполнения на основе переданных параметров
function getAutocompleteResults($conn, $query, $type, $districtCode = null, $cityCode = null, $houseCode = null) {
    $resultsArray = []; // Массив для хранения результатов
    $params = []; // Массив для параметров запроса

    // Формируем SQL-запрос в зависимости от типа
    switch ($type) {
        case 'district':
            $querySQL = "SELECT name, code FROM district WHERE name ILIKE $1 LIMIT 10"; // Запрос для районов
            $params[] = "%{$query}%"; // Параметр для запроса
            break;

        case 'city':
            if ($districtCode) {
                $querySQL = "SELECT name, code FROM city WHERE name ILIKE $1 AND code LIKE $2 LIMIT 10"; // Запрос для городов
                $params = ["%{$query}%", substr($districtCode, 0, 2) . '%']; // Параметры для запроса
            } else {
                return []; // Если код района не передан, возвращаем пустой массив
            }
            break;

        case 'street':
            if ($cityCode) {
                $querySQL = "SELECT name AS street_name, code FROM street WHERE name ILIKE $1 AND code LIKE $2 LIMIT 10"; // Запрос для улиц
                $params = ["%{$query}%", substr($cityCode, 0, 11) . '%']; // Параметры для запроса
            } else {
                return []; // Если код города не передан, возвращаем пустой массив
            }
            break;

        case 'house':
            if ($cityCode && $houseCode) {
                $querySQL = "SELECT name AS house_name, code FROM doma WHERE code LIKE $1 LIMIT 2"; // Запрос для домов
                $params = [substr($houseCode, 0, 15) . '%']; // Параметр для запроса
            } else {
                return []; // Если не переданы необходимые параметры, возвращаем пустой массив
            }
            break;

        default:
            throw new Exception("Неверный тип запроса: {$type}"); // Обработка неверного типа запроса
    }

    // Подготовка и выполнение SQL-запроса
    $stmt = pg_prepare($conn, "find_{$type}", $querySQL);
    if (!$stmt) {
        throw new Exception("Ошибка подготовки запроса: " . pg_last_error($conn));
    }

    $result = pg_execute($conn, "find_{$type}", $params);
    if ($result === false) {
        throw new Exception("Ошибка выполнения запроса: " . pg_last_error($conn));
    }

    // Обработка полученных результатов
    while ($row = pg_fetch_assoc($result)) {
        switch ($type) {
            case 'house':
                // Разбиваем строки на массивы и ищем совпадения для домов
                $houses = explode(',', $row['house_name']); // Разбиваем строку на массив
                foreach ($houses as $house) {
                    // Поиск без учета регистра
                    if (stripos($house, $query) !== false) {
                        $resultsArray[] = [
                            'name' => trim($house), // Добавляем только найденные дома и убираем лишние пробелы
                            'code' => $row['code'],  // Код дома, если нужен
                        ];
                    }
                }
                break;

            default:
                // Для других типов просто добавляем результат
                $resultsArray[] = $row; 
                break;
        }
    }

    return $resultsArray; // Возвращаем массив с результатами
}

// Получение входных данных из GET-запроса
$query = $_GET['q'] ?? ''; // Запрос для автозаполнения
$type = $_GET['type'] ?? ''; // Тип запроса (район, город, улица или дом)
$districtCode = $_GET['districtCode'] ?? null; // Код района
$cityCode = $_GET['cityCode'] ?? null; // Код города
$houseCode = $_GET['houseCode'] ?? null; // Код дома

try {
    // Проверка на пустоту входных данных
    if (empty($query) || empty($type)) {
        throw new Exception("Запрос и тип не должны быть пустыми."); // Обработка исключения
    }

    // Получение результатов автозаполнения
    $results = getAutocompleteResults($conn, $query, $type, $districtCode, $cityCode, $houseCode);
    echo json_encode(['results' => $results]); // Возвращаем результаты в формате JSON
} catch (Exception $e) {
    // Обработка ошибок
    http_response_code(500); // Установка кода ответа на 500 (внутренняя ошибка сервера)
    echo json_encode(['error' => $e->getMessage()]); // Возвращаем сообщение об ошибке в формате JSON
} finally {
    // Закрытие соединения с базой данных
    pg_close($conn);
}
?>