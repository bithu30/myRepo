num=[1,2,3]

it = num.__iter__()
newit = num.__iter__()
for i in it:
    print(i)
#This one will not return any values as
#the iterator obj has exhaustd all its values
for j in it:
    print(j)
#this will work
for j in newit:
    print(j)