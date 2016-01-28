# StackOverflowDemoApp
This is simple iOS application. It demonstrate stackoverflowsdk.framework features


Приложение уже содержит в себе фреймворк. Поэтому его не нужно предварительно копировать.

При разработке были произведены следующие допущения:  
1. Список ответов содержит просто body каждого ответа в виде AttributedString  
2. Кнопки с тегами могут не влазить по ширине ячейки (можно реализовать обрезание текста либо перенос на новую строку)  
3. Панель "быстрого отображения" появляется модально и блокирует основной список. При этом нет затемнения основного списка  
4. Количество тегов ограничено 5-ю (в данный момент на stackoverflow нельзя поставить больше 5 тегов)  
5. Адаптация под различные расширения достигнута засчет autolayout, но при этом нет более рационального использования разрешения iPad'ов  
6. Информация о вопросе отображается не именно по клику на теме и количестве ответов, а в целом по ячейке в таблице. Так выглядит более логично  
