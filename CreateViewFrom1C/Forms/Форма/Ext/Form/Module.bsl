﻿
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	л_Объект = РеквизитФормыВЗначение("Объект");
	ЭтаФорма.Заголовок = СтрШаблон("Создание view. Версия %1", л_Объект.ПолучитьВерсиюОбработки());
КонецПроцедуры

&НаСервере
Процедура ЗагрузитьСтруктуруСервер()
	
	Результат.Очистить();
	мОбъект = РеквизитФормыВЗначение("Объект");
	Скрипт = мОбъект.ЗагрузитьСтруктуру1С82();
	Результат.УстановитьТекст(СтрСоединить(Скрипт, Символы.ПС));
	Если мОбъект.СоздаватьВБД Тогда
		мОбъект.ВыполнитьСкрипт(Скрипт);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьСтруктуру(Команда)
	
	ЗагрузитьСтруктуруСервер()
		
КонецПроцедуры

&НаКлиенте
Процедура СохранитьВФайл(Команда)
	
	Если Результат.КоличествоСтрок() = 0 Тогда
		Возврат;
	КонецЕсли;
	
	Режим = РежимДиалогаВыбораФайла.Сохранение;
	ДиалогОткрытияФайла = Новый ДиалогВыбораФайла(Режим);
	Текст = "ru = ""Текстовый документ""";
	Фильтр = НСтр(Текст) + "(*.txt)|*.txt";
	ДиалогОткрытияФайла.Фильтр = Фильтр;
	ДиалогОткрытияФайла.МножественныйВыбор = Ложь;
	ДиалогОткрытияФайла.Заголовок = "Введите имя файла";
	Если ДиалогОткрытияФайла.Выбрать() Тогда
		ПутьКФайлу = ДиалогОткрытияФайла.ПолноеИмяФайла;
	Иначе
		Текст = "ru = ""Файл(ы) не выбран!""; en = ""File(s) not selected!""";
		Предупреждение(НСтр(Текст));
		Возврат;
	КонецЕсли;
	
	Результат.Записать(ПутьКФайлу);
	
КонецПроцедуры


