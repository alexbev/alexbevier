import urllib.request, urllib.parse, urllib.error
import json
import ssl

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

apikey = 'AIzaSyB7TRjdKP2817N7OIVZbUm6u1nAMzvHcbM'
serviceurl = 'https://maps.googleapis.com/maps/api/geocode/json?'

while True:
    address = input('Enter Location Here: ')
    if len(address) < 1:
        break
    
    parms = dict()
    parms['address'] = address
    parms['key'] = apikey
    print(parms)
    url = serviceurl + urllib.parse.urlencode(parms)
    
    print('Retrieving from: ', url)
    uh = urllib.request.urlopen(url, context = ctx)
    data = uh.read().decode()
    headers = dict(uh.getheaders())
    print(headers)
    
    try:
        js = json.loads(data)
    except:
        js = None
    if not js or js['status'] != 'OK' or 'status' not in js:
        print('===Failure to Retrieve Data===')
        print(json.dumps(js, indent = 4))
        continue
    # print(json.dumps(js, indent = 4))
    pi = js['results'][0]['place_id']
    print('place id = ', pi)