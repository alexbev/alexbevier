fname = input('Enter File Name:')
fhand = open(fname)
for line in fhand:
    clean = line.rstrip()
    print(clean.upper())