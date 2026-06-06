import pandas as pd
import matplotlib.pyplot as plt
import os


# revenue trends

df = pd.read_csv('./data/cleaned_df.csv', parse_dates=['InvoiceDate'])
df = df.sort_values('InvoiceDate')

#total revenue by month
revenue_month_df = df.set_index('InvoiceDate').resample('ME')['revenue'].sum()
revenue_month_df = revenue_month_df.to_frame()
# revenue_time_df.plot()
# plt.show()

# ranking months by purchases
months_by_customers = df.groupby(pd.Grouper(key='InvoiceDate', freq='ME'))['InvoiceNo'].nunique().sort_values(ascending=False)

#total revenue per quarter
revenue_quarter_df = df.set_index('InvoiceDate').resample('QE')['revenue'].sum()

#peak vs low sales period
sales_per_month = df.groupby(pd.Grouper(key='InvoiceDate', freq='ME'))['InvoiceNo'].count()
sales_per_month.index = sales_per_month.index.strftime('%m-%Y')
peak_sales = sales_per_month.sort_values(ascending=False)
low_sales = sales_per_month.sort_values()

#average order revenue (AOV)
total_revenue = df['revenue'].sum()
total_orders = df['InvoiceNo'].nunique()
average_order_value = round((total_revenue / total_orders), 5)

#cummurative revenue over time
revenue_over_time = df[['InvoiceDate', 'revenue']]
revenue_over_time = revenue_over_time.sort_values('InvoiceDate')
revenue_over_time['Cumulative_Revenue'] = revenue_over_time['revenue'].cumsum()


# Product details

#top revenue per product
product_details = df.groupby('Description').agg(
    {
        'Country': 'first',
        'revenue': 'sum',
        'Quantity': 'sum'
    }
).sort_values('revenue', ascending=False)

#ranking products by revenue
products_by_revenue = df.groupby('Description')['revenue'].sum().sort_values(ascending=False)
# products_by_revenue.head().plot.bar()
# plt.show()
# print(df.info())

#average price per product
total_products = df['Description'].nunique()
total_prices = df.groupby('Description')['UnitPrice'].first().sort_values(ascending=False).sum()
avg_prices_per_product = round((total_prices / total_products), 5)


# top product per month
top_product_per_month_idx = df.groupby(pd.Grouper(key='InvoiceDate', freq='ME'))['revenue'].idxmax()
top_product_per_month = df.loc[top_product_per_month_idx, ['Description', 'InvoiceDate', 'revenue']]
top_product_per_month['InvoiceDate'] = top_product_per_month['InvoiceDate'].dt.strftime('%Y-%B')

# total number of units per product
units_per_product = df.groupby('Description')['Quantity'].sum().sort_values(ascending=False)

# percentage contributed by every product towards total revenue
product_revenue = df.groupby('Description').agg(revenue_per_product=('revenue', 'sum'))
product_revenue = product_revenue.sort_values('revenue_per_product', ascending=False)
product_revenue['Revenue Percentage per Product'] = (product_revenue['revenue_per_product'] / total_revenue) * 100
pruduct_percetage_in_total_revenue = product_revenue.sort_values(by='Revenue Percentage per Product', ascending=False)

# total customers
no_duplicates_customer_df = df.drop_duplicates(subset=['CustomerID'], keep='first')
total_customers = no_duplicates_customer_df['CustomerID'].count()



# Demographics data analysis

# countries by revenue
countries_by_revenue = df.groupby('Country')['revenue'].sum().sort_values(ascending=False)
countries_by_revenue = countries_by_revenue.to_frame()
# countries_by_revenue.plot.bar()
# plt.show()

#number of customers per country
customers_per_country = df.groupby('Country')['CustomerID'].nunique().sort_values(ascending=False)

# number of orders per country
orders_per_country = df.groupby('Country')['InvoiceNo'].nunique().sort_values(ascending=False)
orders_per_country = orders_per_country.to_frame()

#average order value by region
average_orders_per_country = countries_by_revenue.join(orders_per_country, how='inner')
average_orders_per_country['Average Order Value'] =  average_orders_per_country['revenue'] / average_orders_per_country['InvoiceNo']
average_order_value_per_country = average_orders_per_country.sort_values(by='Average Order Value', ascending=False)


# KPIs

total_revenue = total_revenue
total_quantity_sold = df['Quantity'].sum()
customer_count = total_customers
average_order_value = average_order_value 
revenue_per_customer = total_revenue / customer_count
top_region_by_revenue = countries_by_revenue.index[0]
top_product_by_revenue = product_revenue.index[0]


# --- New Code Additions Below: Conversions & Export ---

# Ensure results folder exists
os.makedirs('./results', exist_ok=True)

# Convert remaining Series to DataFrames
months_by_customers_df = months_by_customers.to_frame()
revenue_quarter_df = revenue_quarter_df.to_frame()
sales_per_month_df = sales_per_month.to_frame()
peak_sales_df = peak_sales.to_frame()
low_sales_df = low_sales.to_frame()
products_by_revenue_df = products_by_revenue.to_frame()
units_per_product_df = units_per_product.to_frame()
customers_per_country_df = customers_per_country.to_frame()

# Create summary DataFrame for KPIs
kpis_summary_df = pd.DataFrame({
    'KPI_Metric': ['Total Revenue', 'Total Quantity Sold', 'Customer Count', 'Average Order Value', 'Revenue per Customer', 'Top Region by Revenue', 'Top Product by Revenue'],
    'Value': [total_revenue, total_quantity_sold, customer_count, average_order_value, revenue_per_customer, top_region_by_revenue, top_product_by_revenue]
})

# Create summary DataFrame for other single values not in KPIs
other_single_values_df = pd.DataFrame({
    'Metric': ['Total Orders', 'Total Products', 'Total Prices', 'Average Prices per Product', 'Total Customers'],
    'Value': [total_orders, total_products, total_prices, avg_prices_per_product, total_customers]
})

# Export DataFrames where index holds data (index=True)
revenue_month_df.to_csv('./results/revenue_month_df.csv', index=True)
months_by_customers_df.to_csv('./results/months_by_customers.csv', index=True)
revenue_quarter_df.to_csv('./results/revenue_quarter_df.csv', index=True)
sales_per_month_df.to_csv('./results/sales_per_month.csv', index=True)
peak_sales_df.to_csv('./results/peak_sales.csv', index=True)
low_sales_df.to_csv('./results/low_sales.csv', index=True)
product_details.to_csv('./results/product_details.csv', index=True)
products_by_revenue_df.to_csv('./results/products_by_revenue.csv', index=True)
units_per_product_df.to_csv('./results/units_per_product.csv', index=True)
product_revenue.to_csv('./results/product_revenue.csv', index=True)
pruduct_percetage_in_total_revenue.to_csv('./results/product_percentage_in_total_revenue.csv', index=True)
countries_by_revenue.to_csv('./results/countries_by_revenue.csv', index=True)
customers_per_country_df.to_csv('./results/customers_per_country.csv', index=True)
orders_per_country.to_csv('./results/orders_per_country.csv', index=True)
average_orders_per_country.to_csv('./results/average_orders_per_country.csv', index=True)
average_order_value_per_country.to_csv('./results/average_order_value_per_country.csv', index=True)

# Export DataFrames where index is just numbers or metadata (index=False)
df.to_csv('./results/df.csv', index=False)
revenue_over_time.to_csv('./results/revenue_over_time.csv', index=False)
top_product_per_month.to_csv('./results/top_product_per_month.csv', index=False)
no_duplicates_customer_df.to_csv('./results/no_duplicates_customer_df.csv', index=False)
kpis_summary_df.to_csv('./results/kpis_summary.csv', index=False)
other_single_values_df.to_csv('./results/other_single_values.csv', index=False)
