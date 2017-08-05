from pandas_datareader import data

def get_stock_info( stock,start,end,source="yahoo"):
    df = data.DataReader(stock,source,start,end)
    df['Stock'] = stock
    agg = df.groupby('Stock').agg({
        'Open' : ['min','max','mean','median'],
        'Adj Close' : ['min','max','mean','median'],
        'Close' : ['min','max','mean','median'],
        'High' : ['min','max','mean','median'],
        'Low' : ['min','max','mean','median'],
    })
    agg.columns = [''.join]
    

