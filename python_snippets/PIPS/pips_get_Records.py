import requests
from requests.auth import HTTPBasicAuth
with open ('get_records.xml','r') as cont:
    cont_xml = cont.read()

headers = {'Content-Type': 'application/xml'}
#response = requests.post('http://localhost:8080/geonetwork/srv/eng/csw-publication', data=cont_xml, headers=headers,auth=HTTPBasicAuth('admin','admin'))
#print(response.text)
res=requests.post('http://pips.ucc.ie/geonetwork/srv/eng/csw',data=cont_xml, headers=headers,auth=HTTPBasicAuth('admin','admin'))
print (res.text)

