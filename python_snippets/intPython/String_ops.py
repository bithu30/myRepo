import  os

names = ['Declan','Bijith','Mohammed','Slaw']
print (','.join(names))
#hello= map(lambda x: 'Hello '+x,names)
#print(names)

who='Bithu'
how_many=12

print("{} brought {} apples today".format(who,how_many))

loc="c\\myRepo"
fname = "test.py"


print(os.path.join(loc,fname))

age=40
name="Bijith"
print('{} is {} years of age'.format(name,age))
print('{0} is {1} years of age'.format(name,age))