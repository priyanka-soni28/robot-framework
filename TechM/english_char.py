import re

reg = re.compile(r'^[a-zA-Z]')

file2 = open('abc.txt', 'w', encoding="utf-8")

with open('jap.txt', 'r', encoding="utf-8") as file1:
    list1 = file1.read()
    for i in list1:
        if reg.match(i):
            file2.writelines(i)

file4 = open('cde.txt', 'w', encoding="utf-8")

with open('chin.txt', 'r', encoding="utf-8") as file3:
    list2 = file3.read()
    for j in list2:
        if reg.match(j):
            file4.writelines(j)
