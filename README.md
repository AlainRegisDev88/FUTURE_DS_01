# Business Sales Performance Analytics

## Project Overview
An executive web-based dashboard and analysis interface built to evaluate macroeconomic revenue trends, geographic performance, and product distributions for global retail transactions. This analysis outlines core business drivers and highlights optimization areas to scale profitability and operational efficiency.

* Total Revenue: $8,278,519
* Total Quantity Sold: 4,892,851 units
* Unique Customer Count: 4,372
* Average Order Value (AOV): $373.07
* Revenue per Customer: $1,893.53

---

## Key Findings

### 1. Macro Revenue Acceleration & Seasonal Surges
* Observation: Revenue remained relatively stable between $400K and $650K from January to August 2011, before exploding in Q4 2011 to peak near $1.1M in November.
* Quarterly Growth: Revenue increased exponentially quarter-over-quarter, moving from under $1.5M in Q1 2011 to approximately $2.45M by Q4 2011.
* Hypothesis: Performance is highly driven by year-end holiday shopping seasons. The sharp drop in January 2012 reflects a standard post-holiday cooldown combined with incomplete monthly reporting.
* Visual Proof: Defined in 01_revenue_trends.png, 03_monthly_transactions.png, and 08_quarterly_revenue.png.

### 2. Massive Regional Concentration vs. High-Value Pockets
* Market Leader: The United Kingdom dominates absolute financial metrics, single-handedly generating the vast majority of total global revenue (exceeding $6.5M).
* High-Yield Hubs: While the Netherlands, EIRE, Germany, and France represent the top secondary revenue markets, the Netherlands and Australia completely dominate the Average Order Value (AOV) charts, with the Netherlands leading at well over $2,500 per order.
* Hypothesis: The UK represents your domestic retail market volume, whereas international locations like the Netherlands and Australia reflect high-value B2B/wholesale accounts buying bulk shipments.
* Visual Proof: Defined in 04_countries_revenue.png and 05_aov_by_country.png.

### 3. Product Powerhouses: Value vs. Volume Drivers
* Top Revenue Generator: REGENCY CAKESTAND 3 TIER is the undisputed anchor product, commanding the largest single share of the top 10 products' revenue distribution pie.
* Top Volume Leader: WORLD WAR 2 GLIDERS ASSTD DESIGNS is the clear leader in physical units sold, moving well over 50,000 items, despite its lower unit cost preventing it from leading in total revenue.
* Hypothesis: The inventory features high-margin specialty items (like the Cakestand) that bring in steady dollars, balanced against low-margin novelty goods (like the Gliders) that move massive wholesale volume.
* Visual Proof: Defined in 02_top_products.png, 07_top_products_distribution.png, and 09_top_units_sold.png.

---

## Actionable Recommendations

### 1. Capitalize on Q4 Seasonality
Double down on marketing spend and build inventory buffers starting in August. Ensure top inventory items are fully stocked by mid-September to meet the massive wave of holiday purchase transactions seen in October and November.

### 2. Implement a Tiered Regional Strategy
* Volume Strategy (UK): Focus on micro-targeting strategies, customer retention programs, and localized retail promotions to maintain market dominance.
* Value Strategy (Netherlands & Australia): Create VIP wholesale loyalty tiers, bundle bulk product offers, and streamline global supply chain logistics to maximize these incredibly lucrative high-AOV commercial markets.

### 3. Align Product Distribution Efforts
Ensure your supply chain matches product characteristics. Keep high storage volumes ready for rapid-turnover items like WORLD WAR 2 GLIDERS ASSTD DESIGNS to avoid backorders, while prioritizing premier shelf space and premium marketing features for heavy revenue drivers like the REGENCY CAKESTAND 3 TIER.

---

## Business Impact

| Strategic Focus Area | Current Metric | Target Objective | Projected Business Lift |
| :--- | :--- | :--- | :--- |
| **Q4 Holiday Readiness** | ~$2.45M Q4 Peak | Pre-stock & Promote early | +15% YoY Seasonal Revenue Growth |
| **Wholesale Account Cultivation** | High AOV (Global) | Expand Netherlands/Aus models | +10% higher international transaction volume |
| **Cross-Selling Core Items** | Standard Checkout | Bundle Cakestands with secondary tiers | +5% increase in total Average Order Value (AOV) |

---

## How to Run the Application

1. Clone this repository:
   ```bash
   git clone [https://github.com/AlainRegisDev88/FUTURE_DS_01.git](https://github.com/AlainRegisDev88/FUTURE_DS_01.git)
   ```
2. Navigate to the project directory and install the necessary dependencies:

```bash
npm install
```

3. Start the local development server to view the interactive application dashboard:

```bash
npm start
```

**Or:** [Click here](https://future-ds-01.netlify.app/kpis) to visit the dashboard.

**Author**

**Regis Alain Udahemuka**

Computer Science (BSc), Ashesi University

Data Science & Analytics Internship | Future Interns