score = input('Enter User Score: ')
scr = float(score)
if scr > 1:
    print('error')
elif scr >= 0.9:
    print('A')
elif scr >= 0.8:
    print('B')
elif scr >= 0.7:
    print('C')
elif scr >= 0.6:
    print('D')
elif scr >= 0:
    print('F')
else:
    print('error')