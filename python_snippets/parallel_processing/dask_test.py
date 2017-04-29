import dask.dataframe as dd
df=dd.read_csv('C:\\Users\\Bijith\\ownCloud\\tomoe-data\\data-wp-tomoe-kinases\\interim\\SOA_Data\\Kinomexplorer\\networkin_human_predictions.tsv',
               sep='\t',header=0)

print(df.head())