fname = input('Enter File Name:')
fhand = open(fname)
count = 0
for line in fhand:
    line = line.rstrip
    if not line.startswith("X-DSPAM-Confidence:"):
        continue
    elif 'X-DSPAM-Confidence:' in line:
        inp = [20: ]
    try:
        float(inp)
    except:
        print('error: cant do that')
    count = count + 1
tot = len(inp)
total = tot / count
print('Average spam confidence:', count)