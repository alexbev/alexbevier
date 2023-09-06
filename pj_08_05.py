fname = input('Enter File Name')
fhand = open(fname)
count = 0
for line in fhand:
    if not line.startswith('From '):
        continue
    else:
        