---
tags: bash
creation-date: 2024-05-23T21:21:55
---
# Поиск по файлам в Linux
## grep
Найти line в файле
```bash
grep line file.txt
```

Регистронезависимый поиск
```bash
grep -i line file.txt
```

Подсчёт строк с текстом в строке. Полезно для исследования логов.
```bash
grep -c line file.txt
```

Поиск в папке 
```bash
grep -R line directory
```

## find

Поиск файлов с именем указанным в кавычках (все изображения png)
```bash
find . -name "*.png"
```

Поиск папок в названии которых первый символ `A`
```bash
find . -type d -name "A*"
```

Найти все файлы с указанным именем, удалить их и в консоль отобразить, что удалили.
```bash
find . -name "*.log" -delete -print
```

