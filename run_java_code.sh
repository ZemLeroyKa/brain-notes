#!/bin/bash

# Компилирую код
javac bad.java 

# Запускаю код
now=$(date)
echo $now

echo $now 1>> output.txt
java bad.java "Text" &>> output.txt

