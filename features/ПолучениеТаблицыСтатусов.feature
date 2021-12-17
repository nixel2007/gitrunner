# language: ru

Функциональность: Получение таблицы состояний файлов

Как разработчик
Я хочу иметь возможность получать статусы файлов в/вне индекса в виде таблицы
Чтобы использовать их состояние для последующей обработки

Контекст:
    Допустим Я создаю новый объект ГитРепозиторий
    И Я создаю временный каталог и сохраняю его в контекст
    И Я инициализирую репозиторий во временном каталоге

Сценарий: Я добавляю новый файл и проверяю его статусы
    Допустим Я создаю временный файл "temp.tmp" во временном каталоге и сохраняю его в контекст
    
    И Я получаю вывод Статуса через команду
    Тогда Вывод команды содержит "?? temp.tmp"
    
    И Я получаю Массив неослеживаемых файлов
    Тогда Массив файлов содержит "temp.tmp"
    
    Также Я добавляю временный файл в индекс
    И Я получаю вывод Статуса через команду
    Тогда Вывод команды содержит "A  temp.tmp"
    И Я получаю Массив файлов к добавлению
    Тогда Массив файлов содержит "temp.tmp"
    
    Также Я фиксирую изменения с сообщением "Добавлен тестовый файл"
    И Я модифицирую временный файл
    И Я получаю вывод Статуса через команду
    Тогда Вывод команды содержит " M temp.tmp"
    И Я получаю Массив файлов вне индекса
    Тогда Массив файлов содержит "temp.tmp"
    
    Также Я фиксирую изменения с сообщением "Изменен тестовый файл"
    И Я удаляю временный файл
    И Я получаю вывод Статуса через команду
    Тогда Вывод команды содержит " D temp.tmp"
    И Я добавляю временный файл в индекс
    И Я получаю вывод Статуса через команду
    Тогда Вывод команды содержит "D  temp.tmp"
    И Я получаю Массив файлов к удалению
    Тогда Массив файлов содержит "temp.tmp"

Сценарий: Добавление файла с пробелами в имени и получении его статусов
    Допустим Я создаю временный файл "temp 2.tmp" во временном каталоге и сохраняю его в контекст
    
    И Я получаю вывод Статуса через команду
    Тогда Вывод команды содержит '?? "temp 2.tmp"'
    
    И Я получаю Массив неослеживаемых файлов
    Тогда Массив файлов содержит "temp 2.tmp"
    
    Также Я добавляю временный файл в индекс
    И Я фиксирую изменения с сообщением "Изменен тестовый файл"
    И Я изменяю гитом имя временного файла на "temp 3.tmp"
    И Я добавляю временный файл в индекс
    И Я получаю вывод Статуса через команду
    Тогда Вывод команды содержит 'R  "temp 2.tmp" -> "temp 3.tmp"' 
    И Я получаю Массив файлов к удалению
    Тогда Массив файлов содержит "temp 2.tmp"
    И Я получаю Массив файлов к добавлению
    Тогда Массив файлов содержит "temp 3.tmp"
