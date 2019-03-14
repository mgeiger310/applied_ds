import pandas as pd
import seaborn as sns
import os

def io_hw(out_path):
    
    df = pd.read_csv('Military_Spending.csv', encoding = "ISO-8859-1")
    head_df = df.head()
    head_df.to_csv(out_path)
    
    
    return df, head_df