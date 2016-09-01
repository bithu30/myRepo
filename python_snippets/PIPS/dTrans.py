import json
from pprint import pprint

cont_xml=''
with open ('gsi_image_500m_template.xml','r') as cont:
    cont_xml = cont.read()
#print dir(cont_xml)

json_data=open('sample_json.json').read()

data = json.loads(json_data)

#print data['field_Keyword_Thessar_Citi_date_valueType_attr_codeListValue']
#exit
for (field,value) in data.items():
    cont_xml=cont_xml.replace(field,value)

print cont_xml