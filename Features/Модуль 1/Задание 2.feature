﻿#language: ru

@tree

Функционал: <Задание2>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: <Сценарий проверки поля Количество>
И я закрываю все окна клиентского приложения
И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
Тогда открылось окно 'Заказы товаров'
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Заказ * от *'
И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
Тогда открылось окно 'Товары'
И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'Наименование' |
	| '000000029' | 'Хлеб'         |
И в таблице "Список" я выбираю текущую строку
Тогда открылось окно 'Заказ * от * *'
И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5'
*Проверка табличной части
  Тогда таблица "Товары" содержит строки:
	| 'Товар'   | 'Количество' |
	| 'Масло'   | '10'         |
	| 'Ряженка' | '50'         |
	| 'Хлеб'    | '*'          |

  И в таблице "Товары" я завершаю редактирование строки
  И я нажимаю на кнопку с именем 'ФормаЗаписать'
