fname = input('Enter File Name:')
fhand = open(fname)
count = dict()
bigcount = None
biguser = None
for line in fhand:
    if line.startswith('From '):
        line = line.rstrip()
        words = line.split()
        for words[1] in words:
            count[words[1]] = count.get(words[1], 0) + 1
for key in count:
    if bigcount is None or count[key] > bigcount:
        bigcount = count[key]
        biguser = key
print(biguser, bigcount)