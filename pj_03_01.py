hrs = input("Enter User Hours")
h = float(hrs)
rate = input("Enter User Rate")
rt = float(rate)
if h > 40:
    reg = h * rt
    otp = (h - 40.0) * (rt *0.5)
    xp = reg + otp
else:
    xp = h * rt
print (xp)