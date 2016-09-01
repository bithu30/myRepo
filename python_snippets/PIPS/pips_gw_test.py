import requests
from requests.auth import HTTPBasicAuth

with open ('/home/bithu/Desktop/PIPS/sea_level_rise.xml','r') as cont:
    cont_xml = cont.read()


#cont_xml=''
#headers = {'Content-Type': 'application/xml'}
response = requests.post('http://localhost:8080/geonetwork/srv/eng/csw-publication', data=cont_xml, headers=headers,auth=HTTPBasicAuth('admin','admin'))
print(response.text)

