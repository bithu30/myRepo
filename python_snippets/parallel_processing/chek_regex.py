import re

sub_name = 'REEILsEMKKV'
sub_name=sub_name.strip()
pattern = r'[a-z]'



matches = re.findall(pattern,sub_name)[0]

print(matches)

print(filter(str.islower,sub_name))