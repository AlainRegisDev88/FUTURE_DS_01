import pandas as pd

file = pd.read_csv("./data/online_retail.csv")

print(file.shape[0])

cleaned_df = file.drop_duplicates().dropna()
cleaned_df['InvoiceDate'] = pd.to_datetime(cleaned_df['InvoiceDate'])

cleaned_df['revenue'] = round((cleaned_df['UnitPrice'] * cleaned_df['Quantity']), 5)

cleaned_df.to_csv('./data/cleaned_df.csv')

#revenue trends analysis



