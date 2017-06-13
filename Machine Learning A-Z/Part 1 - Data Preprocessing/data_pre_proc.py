import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#importing data
df = pd.read_csv('Data.csv')
X = df.iloc[:,:-1].values
y = df.iloc[:,3].values
print(X)

#Taking Care of missing data, done using Imputer class
#from sklearn.preprocessing
from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values='NaN',strategy="mean",axis=0)
imputer = imputer.fit(X[:,1:3]) #3 because the upper-bound is always excluded in python
X[:,1:3] = imputer.transform(X[:,1:3])
print(X)

#Taking care of categorical data

from sklearn.preprocessing import  LabelEncoder
labelEncoder_X = LabelEncoder()
X[:,0] = labelEncoder_X.fit_transform(X[:,0])
print(X)