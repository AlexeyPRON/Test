#language: ru

@tree

Функционал: Создание номенклатур

я хочу создать 10 Номенклатур  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Создание номенклатур
И В командном интерфейсе я выбираю 'Справочники' 'Номенклатура'
Тогда открылось окно 'Номенклатура'

И Я запоминаю значение выражения '1' в переменную "Шаг"
И я делаю 10 раз
	И Я запоминаю значение выражения '$Шаг$+1' в переменную "Шаг"
	И Я запоминаю значение выражения '"Товар без характеристик" + $Шаг$' в переменную "ТоварБезХарактеристик"
	И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture'                          | 'Vendor'                                                           | 'ItemID' | 'PackageUnit' | 'Description_en'            | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794d' | '58792'  | ''            | '$ТоварБезХарактеристик$'   | ''                 | ''               | ''               |          |          |          |          |         |

	И я перезаполняю для объекта табличную часть "AddAttributes":
		| 'Ref'                                                               | 'Property'                                                                                           | 'Value'                                                                                 |
		| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'e1cib/data/ChartOfCharacteristicTypes.AddAttributeAndProperty?ref=b762b13668d0905011eb766bf96b275d' | 'e1cib/data/Catalog.AddAttributeAndPropertyValues?ref=b762b13668d0905011eb766bf96b2761' |

	
И я нажимаю на кнопку с именем 'FormRefresh'
	