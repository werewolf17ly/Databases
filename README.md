# Databases
Идея - база данных активистов \
Список таблиц:

Активисты Профкома(id, фио)\
Активисты МКИ(id, фио)\
Активисты 231(id, фио)\
Прочие активисты(id, фио)\
Отдел(id отдела, название, руководитель, описание)\
Информация об активисте(id, почта, группа, интересы, проживание)\
Кейс(id кейса, время подачи, срочность(дедлайн), контакт)\

Связь кейс-отдел(id кейса, id отдела)\
Связь активист-отдел(id активиста, id отдела)\
Связь активист-информация(id активиста, id информации)\
Связь активист-кейс(id активиста, id кейса)
