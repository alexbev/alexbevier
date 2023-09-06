fname = input('Enter File Name: ')
fhand = open(fname)
hours = dict()
for line in fhand:
    if not line.startswith('From '):
        continue
    else:
        word = line.split()
        time = word[5].split(':')
        hour = time[0]
    hours[hour] = hours.get(hour, 0) + 1
lst = list()
for k, v in hours.items():
    tup = (k, v)
    lst.append(tup)
lst = sorted(lst)
for k, v in lst:
    print(k, v)