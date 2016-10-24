import requests
from requests.auth import HTTPBasicAuth
with open ('get_RecordsById.xml','r') as cont:
    cont_xml = cont.read()
id='352de161-6bb7-452f-846d-ac605f032804';
cont_xml=cont_xml.replace('rec_id',id)
#print (cont_xml)
headers = {'Content-Type': 'application/xml'}
res=requests.post('http://pips.ucc.ie/geonetwork/srv/eng/csw',data=cont_xml, headers=headers,auth=HTTPBasicAuth('admin','admin'))
print (res.text)