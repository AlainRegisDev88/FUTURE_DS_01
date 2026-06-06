# ===== SALES ANALYTICS DASHBOARD - R VISUALIZATION =====
# Loads all CSV files from pandas analysis and creates professional charts

# Install packages if not already installed
packages <- c("ggplot2", "dplyr", "tidyr", "scales", "forcats")
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg)
    library(pkg, character.only = TRUE)
  }
}

library(ggplot2)
library(dplyr)
library(tidyr)
library(scales)
library(forcats)

# Set theme
theme_custom <- function() {
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14, margin = margin(b=10)),
    plot.subtitle = element_text(size = 11, color = "gray40", margin = margin(b=15)),
    axis.title = element_text(size = 10, face = "bold"),
    axis.text = element_text(size = 9),
    panel.grid.major = element_line(color = "gray90"),
    panel.grid.minor = element_blank()
  )
}

# Create output directory
dir.create("./charts", showWarnings = FALSE)

# ===== 1. LOAD ALL CSVs FROM PANDAS OUTPUT =====

# Helper function to convert rownames to column
row_to_col <- function(df, col_name) {
  df$temp_row <- rownames(df)
  df <- df[, c("temp_row", setdiff(names(df), "temp_row"))]
  colnames(df)[1] <- col_name
  rownames(df) <- NULL
  return(df)
}

revenue_month <- read.csv('./results/revenue_month_df.csv', row.names = 1)
revenue_month <- row_to_col(revenue_month, "Date")
colnames(revenue_month) <- c("Date", "Revenue")
revenue_month$Date <- as.Date(revenue_month$Date)

months_by_customers <- read.csv('./results/months_by_customers.csv', row.names = 1)
months_by_customers <- row_to_col(months_by_customers, "Date")
colnames(months_by_customers) <- c("Date", "UniqueCustomers")

revenue_quarter <- read.csv('./results/revenue_quarter_df.csv', row.names = 1)
revenue_quarter <- row_to_col(revenue_quarter, "Quarter")
colnames(revenue_quarter) <- c("Quarter", "Revenue")

sales_per_month <- read.csv('./results/sales_per_month.csv', row.names = 1)
sales_per_month <- row_to_col(sales_per_month, "Month")
colnames(sales_per_month) <- c("Month", "SalesCount")

products_by_revenue <- read.csv('./results/products_by_revenue.csv', row.names = 1)
products_by_revenue <- row_to_col(products_by_revenue, "Product")
colnames(products_by_revenue) <- c("Product", "Revenue")

units_per_product <- read.csv('./results/units_per_product.csv', row.names = 1)
units_per_product <- row_to_col(units_per_product, "Product")
colnames(units_per_product) <- c("Product", "Quantity")

countries_by_revenue <- read.csv('./results/countries_by_revenue.csv', row.names = 1)
countries_by_revenue <- row_to_col(countries_by_revenue, "Country")
colnames(countries_by_revenue) <- c("Country", "Revenue")

average_order_value_per_country <- read.csv('./results/average_order_value_per_country.csv', row.names = 1, check.names = FALSE)
average_order_value_per_country <- row_to_col(average_order_value_per_country, "Country")

product_percentage <- read.csv('./results/product_percentage_in_total_revenue.csv', row.names = 1, check.names = FALSE)
product_percentage <- row_to_col(product_percentage, "Product")

kpis_summary <- read.csv('./results/kpis_summary.csv')

revenue_over_time <- read.csv('./results/revenue_over_time.csv')
revenue_over_time$InvoiceDate <- as.Date(revenue_over_time$InvoiceDate)

# ===== 2. CREATE VISUALIZATIONS =====

# Chart 1: REVENUE TRENDS OVER TIME (Monthly)
p1 <- ggplot(revenue_month, aes(x = Date, y = Revenue)) +
  geom_line(color = "#185FA5", linewidth = 1) +
  geom_point(color = "#185FA5", size = 2) +
  geom_area(fill = "#185FA5", alpha = 0.1) +
  labs(
    title = "Monthly Revenue Trends",
    subtitle = "Total revenue per month over time",
    x = "Month",
    y = "Revenue ($)"
  ) +
  scale_y_continuous(labels = dollar) +
  theme_custom()

ggsave("./charts/01_revenue_trends.png", p1, width = 12, height = 6, dpi = 300)
print("✓ Chart 1: Revenue Trends")

# Chart 2: TOP 15 PRODUCTS BY REVENUE
top_products <- products_by_revenue %>%
  arrange(desc(Revenue)) %>%
  slice(1:15) %>%
  mutate(Product = fct_reorder(Product, Revenue))

p2 <- ggplot(top_products, aes(x = Product, y = Revenue, fill = Revenue)) +
  geom_col() +
  scale_fill_gradient(low = "#B0D4FF", high = "#0C447C") +
  coord_flip() +
  labs(
    title = "Top 15 Products by Revenue",
    subtitle = "Best performing products",
    x = "Product",
    y = "Revenue ($)"
  ) +
  scale_y_continuous(labels = dollar) +
  theme_custom() +
  theme(legend.position = "none")

ggsave("./charts/02_top_products.png", p2, width = 12, height = 8, dpi = 300)
print("✓ Chart 2: Top Products")

# Chart 3: MONTHLY SALES TRANSACTION COUNT
sales_per_month$Month <- factor(sales_per_month$Month)
p3 <- ggplot(sales_per_month, aes(x = Month, y = SalesCount, fill = SalesCount)) +
  geom_col(fill = "#2E7D32") +
  labs(
    title = "Sales Transactions per Month",
    subtitle = "Number of orders each month",
    x = "Month",
    y = "Number of Transactions"
  ) +
  theme_custom() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave("./charts/03_monthly_transactions.png", p3, width = 12, height = 6, dpi = 300)
print("✓ Chart 3: Monthly Transactions")

# Chart 4: TOP 15 COUNTRIES BY REVENUE
top_countries <- countries_by_revenue %>%
  arrange(desc(Revenue)) %>%
  slice(1:15) %>%
  mutate(Country = fct_reorder(Country, Revenue))

p4 <- ggplot(top_countries, aes(x = Country, y = Revenue, fill = Revenue)) +
  geom_col() +
  scale_fill_gradient(low = "#FFE0B2", high = "#E65100") +
  coord_flip() +
  labs(
    title = "Top 15 Countries by Revenue",
    subtitle = "Regional performance",
    x = "Country",
    y = "Revenue ($)"
  ) +
  scale_y_continuous(labels = dollar) +
  theme_custom() +
  theme(legend.position = "none")

ggsave("./charts/04_countries_revenue.png", p4, width = 12, height = 8, dpi = 300)
print("✓ Chart 4: Top Countries")

# Chart 5: AVERAGE ORDER VALUE BY COUNTRY (Top 10)
top_aov_countries <- average_order_value_per_country %>%
  arrange(desc(`Average Order Value`)) %>%
  slice(1:10) %>%
  mutate(Country = fct_reorder(Country, `Average Order Value`))

p5 <- ggplot(top_aov_countries, aes(x = Country, y = `Average Order Value`, fill = `Average Order Value`)) +
  geom_col() +
  scale_fill_gradient(low = "#C8E6C9", high = "#1B5E20") +
  coord_flip() +
  labs(
    title = "Top 10 Countries by Average Order Value",
    subtitle = "AOV = Total Revenue / Number of Orders",
    x = "Country",
    y = "Average Order Value ($)"
  ) +
  scale_y_continuous(labels = dollar) +
  theme_custom() +
  theme(legend.position = "none")

ggsave("./charts/05_aov_by_country.png", p5, width = 12, height = 6, dpi = 300)
print("✓ Chart 5: AOV by Country")

# Chart 6: CUMULATIVE REVENUE OVER TIME
p6 <- ggplot(revenue_over_time, aes(x = InvoiceDate, y = Cumulative_Revenue)) +
  geom_line(color = "#7B1FA2", linewidth = 1) +
  geom_area(fill = "#7B1FA2", alpha = 0.2) +
  labs(
    title = "Cumulative Revenue Over Time",
    subtitle = "Running total revenue from start",
    x = "Date",
    y = "Cumulative Revenue ($)"
  ) +
  scale_y_continuous(labels = dollar) +
  theme_custom()

ggsave("./charts/06_cumulative_revenue.png", p6, width = 12, height = 6, dpi = 300)
print("✓ Chart 6: Cumulative Revenue")

# Chart 7: REVENUE DISTRIBUTION - TOP 10 PRODUCTS (PIE/DONUT)
top_10_products <- products_by_revenue %>%
  arrange(desc(Revenue)) %>%
  slice(1:10) %>%
  mutate(Product = gsub(" {2,}", " ", Product))  # Clean up spacing

p7 <- ggplot(top_10_products, aes(x = "", y = Revenue, fill = Product)) +
  geom_col(width = 1) +
  coord_polar(theta = "y") +
  labs(
    title = "Top 10 Products - Revenue Distribution",
    subtitle = "% of revenue from top 10 products"
  ) +
  theme_minimal() +
  theme(
    axis.title = element_blank(),
    axis.text = element_blank(),
    panel.grid = element_blank(),
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    plot.subtitle = element_text(size = 11, hjust = 0.5, color = "gray40")
  ) +
  scale_fill_brewer(palette = "Set3")

ggsave("./charts/07_top_products_distribution.png", p7, width = 10, height = 8, dpi = 300)
print("✓ Chart 7: Product Distribution")

# Chart 8: QUARTERLY REVENUE COMPARISON
p8 <- ggplot(revenue_quarter, aes(x = Quarter, y = Revenue, fill = Quarter)) +
  geom_col() +
  labs(
    title = "Quarterly Revenue Comparison",
    subtitle = "Revenue performance by quarter",
    x = "Quarter",
    y = "Revenue ($)"
  ) +
  scale_y_continuous(labels = dollar) +
  scale_fill_brewer(palette = "Blues") +
  theme_custom() +
  theme(legend.position = "none", axis.text.x = element_text(angle = 45, hjust = 1))

ggsave("./charts/08_quarterly_revenue.png", p8, width = 10, height = 6, dpi = 300)
print("✓ Chart 8: Quarterly Revenue")

# Chart 9: TOP 15 PRODUCTS BY QUANTITY SOLD
top_units <- units_per_product %>%
  arrange(desc(Quantity)) %>%
  slice(1:15) %>%
  mutate(Product = fct_reorder(Product, Quantity))

p9 <- ggplot(top_units, aes(x = Product, y = Quantity, fill = Quantity)) +
  geom_col() +
  scale_fill_gradient(low = "#BBDEFB", high = "#01579B") +
  coord_flip() +
  labs(
    title = "Top 15 Products by Quantity Sold",
    subtitle = "Volume of units sold",
    x = "Product",
    y = "Quantity (Units)"
  ) +
  theme_custom() +
  theme(legend.position = "none")

ggsave("./charts/09_top_units_sold.png", p9, width = 12, height = 8, dpi = 300)
print("✓ Chart 9: Top Units Sold")

# Chart 10: KPI SUMMARY (as text visualization)
format_kpi_value <- function(metric, value) {
  numeric_value <- suppressWarnings(as.numeric(value))
  if (!is.na(numeric_value)) {
    if (grepl("Revenue|Value", metric, ignore.case = TRUE)) {
      return(dollar(numeric_value))
    }
    if (grepl("Quantity|Count|Orders|Customers", metric, ignore.case = TRUE)) {
      return(format(numeric_value, big.mark = ",", scientific = FALSE))
    }
    return(as.character(numeric_value))
  }
  return(as.character(value))
}

kpi_text <- paste(
  sapply(seq_len(nrow(kpis_summary)), function(i) {
    metric <- kpis_summary$KPI_Metric[i]
    value <- kpis_summary$Value[i]
    paste0(metric, ": ", format_kpi_value(metric, value))
  }),
  collapse = "\n"
)

p10 <- ggplot() +
  annotate("text", x = 0.5, y = 0.89, label = "KEY PERFORMANCE INDICATORS", 
           size = 6, fontface = "bold", hjust = 0.5) +
  annotate("text", x = 0.5, y = 0.45, label = kpi_text,
           size = 4.5, hjust = 0.5, vjust = 0.5, family = "monospace",
           color = "#0C447C") +
  xlim(0, 1) + ylim(0, 1) +
  theme_void()

ggsave("./charts/10_kpi_summary.png", p10, width = 8, height = 6, dpi = 300)
print("✓ Chart 10: KPI Summary")

# ===== SUMMARY =====
print("\n✅ All charts created successfully!")
print("📊 Output location: ./charts/")
print("\nChart list:")
print("  01_revenue_trends.png")
print("  02_top_products.png")
print("  03_monthly_transactions.png")
print("  04_countries_revenue.png")
print("  05_aov_by_country.png")
print("  06_cumulative_revenue.png")
print("  07_top_products_distribution.png")
print("  08_quarterly_revenue.png")
print("  09_top_units_sold.png")
print("  10_kpi_summary.png")