# 📊 Sales Performance Dashboard  
## End-to-End Data Analytics Project (SQL | Power BI | DAX)

---

## 🚀 Project Overview

**Project Name:** Sales Performance Dashboard  
**Client:** Synthetic Ecommerce  
**Industry:** E-commerce & Retail  
**Project Duration:** 1 Months  
**Tools Used:** Power BI, SQL (MySQL), Excel, DAX, GitHub  

Synthetic Ecommerce is a growing e-commerce retail organization operating across multiple regions and product categories. As the business scaled, leadership faced increasing difficulty in tracking sales performance due to fragmented data sources, manual reporting processes, and lack of advanced analytics.

The objective of this project was to design and implement a centralized, executive-level Power BI dashboard that delivers accurate, real-time, and actionable insights into revenue, growth trends, regional performance, product analysis, customer behavior, and operational efficiency.

---

## 🎯 Project Goals & Objectives

The key objectives of this project were to:

- Build a single source of truth for sales reporting  
- Automate manual reporting processes  
- Enable real-time performance monitoring  
- Track revenue growth and trends (YoY & MoM)  
- Identify top- and bottom-performing products and regions  
- Analyze customer behavior, returns, and payment preferences  
- Improve delivery and operational efficiency  
- Support data-driven decision-making for leadership  

---

## 🧠 Business Problems Addressed

### 1️⃣ Fragmented Sales Data  
- Sales, customer, product, and region data existed in separate systems  
- Inconsistent formats and missing values  
- No standardized reporting structure  

### 2️⃣ Manual & Time-Consuming Reporting  
- Weekly and monthly reports prepared manually in Excel  
- High dependency on analysts  
- Increased risk of errors and delayed insights  

### 3️⃣ Limited Visibility for Leadership  
Executives lacked instant visibility into:  
- Overall revenue and growth trends  
- Regional sales performance  
- Product-wise contribution  
- High return-rate products or regions  

### 4️⃣ Lack of Advanced Metrics  
- No Year-over-Year (YoY) or Month-over-Month (MoM) growth  
- Average Order Value (AOV) not tracked  
- No insight into repeat customers or return behavior  

### 5️⃣ Poor Performance of Existing Reports  
- Reports were slow due to inefficient joins  
- Flat table structures instead of analytical models  
- Heavy calculations inside visuals  

---

## 🛠 Tools & Technologies

| Tool | Usage |
|------|-------|
| SQL (MySQL) | Data cleaning, validation, star schema modeling |
| Power BI | Data modeling, visualization, reporting |
| DAX | KPI calculations and business logic |
| Excel | Raw data source |
| GitHub | Version control and documentation |

---

## 🗂 End-to-End Data Pipeline

```
Excel (Raw Sales Data)
        ↓
Raw SQL Tables
        ↓
Data Cleaning & Validation
        ↓
Star Schema Modeling
        ↓
Analytical SQL Views
        ↓
Power BI Data Model
        ↓
DAX KPIs & Measures
        ↓
Interactive Dashboards
        ↓
Business Insights & Recommendations
```

---

## 🧹 Data Cleaning & Validation (SQL)

### Key Data Quality Steps

#### 🔹 Record Validation  
- Removed records with NULL critical fields  
- Removed records with invalid quantity and product price  

#### 🔹 Data Standardization  
- Standardized product category, region, and payment method  
- Ensured discount values are between 0–100  
- Ensured customer ratings are between 1–5  

#### 🔹 Example Cleaning Logic
```sql
DELETE FROM raw_sales_cleaned
WHERE order_id IS NULL
   OR customer_id IS NULL
   OR order_date IS NULL
   OR product_category IS NULL;

DELETE FROM raw_sales_cleaned
WHERE quantity <= 0
   OR product_price <= 0;

UPDATE raw_sales_cleaned
SET discount_percent = 0
WHERE discount_percent < 0;

UPDATE raw_sales_cleaned
SET discount_percent = 100
WHERE discount_percent > 100;
```

👉 This layer ensures high-quality, analytics-ready data.

---

## 🧩 Data Modeling – Star Schema

### ⭐ Schema Design

#### Fact Table  
**fact_sales**

#### Dimension Tables  
- dim_date  
- dim_product  
- dim_customer  
- dim_region  
- dim_payment  

### ⭐ Benefits  
- Faster query performance  
- Simplified reporting  
- Scalable analytical design  
- Optimized Power BI relationships  

---

## 📊 Key KPIs (DAX)

| KPI | Value |
|-----|-------|
| Total Revenue | 73.41M |
| Revenue Growth (YoY) | 50.7% |
| Total Orders | 100K |
| Total Customers | 100K |
| Average Order Value | 734.15 |
| Return Rate | 6.06% |
| Average Delivery Days | 5 |
| Average Customer Rating | 3.5 |

### 🔹 Example DAX Measures

```dax
Total Revenue =
SUM ( fact_sales[revenue] )

Average Order Value =
DIVIDE ( [Total Revenue], [Total Orders] )

Return Rate % =
DIVIDE ( [Returned Orders], [Total Orders] )
```

👉 KPIs are designed for executive-level clarity and business relevance.

---

## 📑 Dashboard Pages

### 1️⃣ Executive Overview  
- Total Revenue, Orders, Customers  
- Revenue Growth & Trends  
- High-level business snapshot  

![Executive Overview](https://github.com/user-attachments/assets/90bd25a7-4143-463e-88ed-815160a9af6a)


---

### 2️⃣ Product Performance  
- Revenue & quantity by product category  
- Top-performing products  
- Category-wise comparison across regions  

![Product Performance](https://github.com/user-attachments/assets/bef7690c-10aa-4ef8-a3bf-fbaa5e9dd3eb)


---

### 3️⃣ Region & Delivery Analysis  
- Revenue by region (maps & charts)  
- Average delivery days  
- Returned vs completed orders  

![Region   Delivery](https://github.com/user-attachments/assets/bff26769-329e-4eac-a78b-22ab06cb1241)


---

### 4️⃣ Customer & Payment Insights  
- Average revenue per customer  
- Most-used payment methods  
- Return rates by payment method  
- Customer rating distribution  

![Customer   Payment](https://github.com/user-attachments/assets/3a0f162b-454b-411e-a425-d89637820837)


---

### 5️⃣ Insights & Recommendations  
- Key findings  
- Business recommendations  
- Actionable strategies  

![Insights   Recommendation](https://github.com/user-attachments/assets/fd2bcf56-2ed4-4ca4-9d36-536abe11e33b)


---

## 🎨 Dashboard Design Principles

- Clean, executive-friendly layout  
- Consistent color theme  
- Clear KPI cards at the top  
- Interactive slicers and cross-filtering  
- Minimal clutter with maximum insight  

---

## 📈 Business Impact & Insights

### 💰 Revenue & Growth  
- Identified 73.41M revenue with 50.7% growth  
- Electronics, Automotive, and Sports are top contributors  

### 👥 Customer Behavior  
- Repeat customer analysis improves retention strategy  
- Low-rated orders show higher return probability  

### 🌍 Regional Performance  
- North America and Asia are top-performing regions  
- Delivery delays correlate with higher returns  

### 🚚 Operational Efficiency  
- Average delivery time ~5 days  
- Improvement opportunities in high-return regions  

### 💳 Payment Optimization  
- Credit Card is the most-used payment method  
- Credit Card & PayPal generate the highest revenue  

---

## 🚀 Final Outcome

✔ Centralized performance tracking  
✔ Reduced manual reporting effort  
✔ Faster, data-driven decisions  
✔ Clear visibility into revenue drivers and risks  

This project demonstrates real-world data analytics skills across SQL, Power BI, DAX, and business storytelling.

---

## 📁 Repository Structure

```
Sales-Performance-Dashboard/
│
├── README.md
│
├── data/
│   └── sales_raw_data.xlsx
│
├── sql/
│   ├── 1_raw_data/
│   │   └── create_raw_table.sql
│   ├── 2_cleaning_validation/
│   │   ├── data_cleaning.sql
│   │   └── data_validation.sql
│   ├── 3_star_schema/
│   │   ├── create_dim_tables.sql
│   │   ├── create_fact_table.sql
│   │   └── insert_into_star.sql
│   └── 4_views/
│       └── sales_summary_view.sql
│
├── powerbi/
│   ├── export/
│   ├── material/
│   └── Sales_Performance_Dashboard.pbix
│
├── dax/
│   └── measures.md
│
├── insights/
│   ├── key_findings.md
│   ├── sales_drivers.md
│   └── recommendations.md
│
├── documentation/
│   ├── project_overview.md
│   ├── data_pipeline.md
│   ├── dashboard_design.md
│   └── business_impact.md
│
├── images/
│   ├── executive_dashboard.png
│   ├── regional_dashboard.png
│   └── product_dashboard.png
│
└── reports/
    └── sales_performance_summary.pdf
```


---
---

## 🙏 Acknowledgement  

Special thanks to the **Synthetic Ecommerce Retail Sales Sharing Dataset (Open Data)** for providing an excellent real-world dataset.  
This project was created as part of a **Data Analytics learning journey** using **Power BI**.  

---

## 📎 Author  

**👤 Name:** Prafull Wahatule  
**📧 Email:** [prafullwahatule@gmail.com](mailto:prafullwahatule@gmail.com)  
**💻 GitHub:** [prafullwahatule](https://github.com/prafullwahatule)  

---

⭐ *If you found this project helpful, don’t forget to star the repository!* ⭐
