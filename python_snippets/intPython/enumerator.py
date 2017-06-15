ex=["left","right","up","down"]
for i,j in enumerate(ex):
    print(i,j)

new_dict = dict(enumerate(ex))
print(new_dict)

[print(i,j) for i,j in enumerate(new_dict)]