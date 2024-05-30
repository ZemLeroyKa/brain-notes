---
tags: 
creation-date: 2024-05-30T19:26:22
---
# Запуск Java-файлов на компьютере

## Компиляция и запуск в нужной кодировке
Компиляция в исходный байт-код:
```bash
javac -encoding UTF-8 Hello.java
```

Запуск `class` файла в указанной кодировке
```bash
java -Dfile.encoding=UTF-8 Hello
```

В cmd консоли на Windows нужно запустить следующую команду если вместо читаемого текста получаете абракадабру типа такой "?;%№%":?;? ?;:;:?* 7к778":
```shell
chcp 65001
```
## Компиляция нескольких файлов

```bash
javac -d <имя_папки_куда_скомпилировать> <кодировка> <расположение java файлов с указанием маски для компиляции>
```
Пример
```bash
javac -d bin -encoding UTF-8 ./src/*.java
```
![[javac several files|800]]

```bash
java -cp bin Main
```

## JAR
Java ARchive
### Файл Манифеста JAVA программы
`MANIFEST.MF`
В архиве будет расположен здесь:
`META-INF/MANIFEST.MF`

Какая информация хранится в манифесте:
- Версия спецификации для манифестов (всегда 1.0)
- Created-By: кем создана спецификация
- Main-Class (Application's Entry Point)
> [!info] https://docs.oracle.com/javase/tutorial/deployment/jar/manifestindex.html подробнее здесь.

Примеры файла
```
Manifest-Version: 1.0
Ant-Version: Apache Ant 1.8.1
Created-By: 1.6.0_26-b03 (Sun Microsystems Inc.)
Main-Class: ru.urvanov.javaexamples.springjavamailsenderimpl.App
Name: java/util/
Specification-Title: Java Utility Classes
Specification-Version: 1.2
Specification-Vendor: Example Tech, Inc.
Implementation-Title: java.util 
Implementation-Version: build57
Implementation-Vendor: Example Tech, Inc.
```
### Как работать с JAR
Сначала нужно все файлы скомпилировать в байт-код командой javac.

После этого упаковать файлы в архив можно следующей командой:
```bash
jar cfe <имя jar-файла> <имя_стартового_класса> <список_файлов>
```

```bash
jar cfe library.jar Main -C bin .
```

Флаги для jar команды (OPTION):
- `c` (create) указывает на то, что создаётся новый файл
	- `-c` or `--create` Creates the archive.
- `f` (filename) предупреждает, что после него будет написано имя создаваемого jar-файла
- `e` (entrypoint) указывает на название класса, с которого нужно начать выполнение программы
Это флаги как выше `jar cfe`

- `-C _DIR_ files` Флаг для изменения папки (берём файлы для компиляции в архив из `_DIR_`) и включения указанных далее файлов. Добавляется в конце командной строки
  `jar [_OPTION_ ...] [ [--release _VERSION_] [-C _dir_] _files_]`
	Пример: `… -C bin .` - из папки bin в архив добавятся все файлы

> [!link] Подробнее в документации Oracle
> https://docs.oracle.com/en/java/javase/17/docs/specs/man/jar.html

C:\Program Files\Java\jdk-19\bin

для меня локально нужно указывать путь к jar файлу напрямую (или прописать в PATH переменную среды)
```bash
/c/Program\ Files/Java/jdk-19/bin/jar cfe library.jar Main -C bin .
# точка в конце строки указывает на то, что в JAR должны 
# попасть все файлы из папки bin
```

Для запуска Java программы теперь достаточно иметь только архив JAR и в консоль написать следующую команду:
```bash
java -jar library.jar 
```

