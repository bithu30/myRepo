#basic list comphrehension
x = [i  for i in range(5)]
print(x)

#basic generator

x =  (i  for i in range(5))
print(x)

#Comparing perf of both list comp and generator
# here list comp will take more time to execute.

x = [i  for i in range(50000000)]
print("done")
x = (i  for i in range(50000000))
print(x)