---
tags: 
creation-date: 2024-06-04T19:19:21
---
# Практика работы с ветками Git

Цель: Сделать две ветки main и dev
Научиться переключаться
Научиться делать merge веток

1. Создание веток
При инициализации мы автоматически создаём ветку main (в старых версиях master)

Новая ветка возможно только при наличии изменений.

В данном случае подразумеваются коммиты

https://git-scm.com/book/ru/v2/Ветвление-в-Git-О-ветвлении-в-двух-словах
При добавлении в индекс и создании коммита каждый файл сохраняется в репозиторий (Git называет такой файл _блоб_ — большой бинарный объект), а контрольная сумма попадёт в индекс (индекс - база данных, реестр, журнал).

кодом это выглядит так:
```shell
git add README test.rb LICENSE
git commit -m 'Initial commit'
```
В примере выше добавляем три файла в индекс:
- README 
- test.rb 
- LICENSE
Затем сохраняем каждый файл в репозиторий с фразой-пометкой `Initial commit`


Git создаёт объект коммита с метаданными и _указателем_ на основное дерево проекта для возможности воссоздать этот снимок в случае необходимости.
![[Пять файлов одного коммита.png]]
_Рисунок 9. Коммит и его дерево_

Если вы сделаете изменения и создадите ещё один коммит, то он будет содержать указатель на предыдущий коммит.

На рисунке ниже указаны только три коммита и ссылки на снэпшота
![[Три коммита.png]]

Ветка в Git — это простой _перемещаемый указатель_ на один из таких коммитов. 

По умолчанию, имя основной ветки в Git — `main`. Как только вы начнёте создавать коммиты, ветка `main` будет всегда указывать на последний коммит. 

Каждый раз при создании коммита указатель ветки `main` будет передвигаться на следующий коммит автоматически.




![[Pasted image 20240604193410.png]]

## Как выйти из Vim
нажать Esc
Ввести `:wq`
## Создание новой ветки

При создании ветки создаётся новый указатель. 

```shell
git branch dev
```

Куда смотрит указатель при создании ветки:
![[Куда смотрит указатель при создании ветки.png|200]]

Красиво посмотреть командой (кратко одной строкой на коммит)
```shell
git log --oneline --decorate
```

пример:
```shell
57c2390 (HEAD -> main, dev) Добавил file_03.md для демонстрации перемещения указателя
2a10321 Добавить второй файл в git. Это новый коммит, новое дерево, новый blob
da9b08e Добавил в индекс файл file_01.md Делаю коммит и первое дерево в ветке main
```

## Переключение веток
Для переключения на существующую ветку выполните команду `git checkout`

```shell
git checkout dev
```


# git remote add origin git@github.com-top:ZemLeroyKa/git_showcase.git
