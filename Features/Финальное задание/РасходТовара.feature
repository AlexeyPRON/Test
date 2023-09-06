﻿#language: ru
@Финал
@tree

Функционал: Тест документа РасходТовара

Как Тестировщик я хочу
Протестировать документ РасходТовара

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Тест документа РасходТовара
И я закрываю все окна клиентского приложения
И В командном интерфейсе я выбираю 'Продажи' 'Документы продаж'
Тогда открылось окно 'Документы продаж'
И я нажимаю на кнопку с именем 'ФормаСоздатьПоПараметруРасходТовара'
Тогда открылось окно 'Продажа товара (создание)'
И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Мясная лавка"'
Тогда поле с именем "ВидЦен" заполнено
И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
И элемент формы с именем "Валюта" присутствует на форме
И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
Тогда открылось окно 'Товары'
И я нажимаю на кнопку с именем 'ФормаСписок'
Когда открылось окно 'Товары'
И в таблице "Список" я перехожу к строке:
	| 'Артикул' | 'Код'       | 'Наименование' |
	| 'Kros001' | '000000024' | 'Кроссовки'    |
И в таблице "Список" я выбираю текущую строку
И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5,00'
И в таблице "Товары" я завершаю редактирование строки
И я нажимаю на кнопку с именем 'ФормаПровести'
Когда открылось окно 'Продажа * от *'
И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
Тогда табличный документ "SpreadsheetDocument" равен:
	| 'Расход товара' | ''                                                  | ''           | ''       |
	| ''              | ''                                                  | ''           | ''       |
	| 'Номер'         | '*'                                                 | ''           | ''       |
	| 'Дата'          | '*'                                                 | ''           | ''       |
	| 'Покупатель'    | 'Магазин "Мясная лавка"'                            | ''           | ''       |
	| 'Склад'         | 'Большой'                                           | ''           | ''       |
	| 'Сумма'         | '18 500 рублей (Восемнадцать тысяч пятьсот рублей)' | ''           | ''       |
	| 'Вес'           | ''                                                  | ''           | ''       |
	| ''              | ''                                                  | ''           | ''       |
	| 'Товар'         | 'Цена'                                              | 'Количество' | 'Сумма'  |
	| 'Кроссовки'     | '3 700'                                             | '5'          | '18 500' |

Когда В панели открытых я выбираю 'Продажа * от *'
Тогда открылось окно 'Продажа * от *'

И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
Тогда таблица "Список" стала равной по шаблону:
	| 'Период' | 'Регистратор'    | 'Номер строки' | 'Контрагент'             | 'Сумма'     | 'Валюта' |
	| '*'      | 'Продажа * от *' | '1'            | 'Магазин "Мясная лавка"' | '18 500,00' | 'Рубли'  |

И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
Тогда таблица "Список" стала равной по шаблону:
	| 'Период' | 'Регистратор'    | 'Номер строки' | 'Покупатель'             | 'Товар'     | 'Количество' | 'Сумма'     |
	| '*'      | 'Продажа * от *' | '1'            | 'Магазин "Мясная лавка"' | 'Кроссовки' | '5,00'       | '18 500,00' |


И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
Тогда таблица "Список" стала равной по шаблону:
	| 'Период' | 'Склад'   | 'Регистратор'    | 'Номер строки' | 'Товар'     | 'Количество' |
	| '*'      | 'Большой' | 'Продажа * от *' | '1'            | 'Кроссовки' | '5,00'       |



