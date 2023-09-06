fname = input('Enter File Name:')
fhand = open(fname)
lst = list()
for line in fhand:
    line = line.rstrip()
    l = line.split
    if l in list():
        continue
    else:
        list.append(l)
final = sort(list)
print(final)