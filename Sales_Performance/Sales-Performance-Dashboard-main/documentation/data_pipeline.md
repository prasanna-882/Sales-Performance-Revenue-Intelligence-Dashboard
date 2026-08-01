
This document explains the **end-to-end data pipeline** used in the Sales Performance Dashboard project, from raw data ingestion to final Power BI reporting.

---

## 1️⃣ Data Source

**Source Type:** Excel file

* File: `sales_raw_data.xlsx`
* Contains raw transactional sales data
* Includes order details, customer info, product category, region, payment method, delivery days, discounts, returns, and ratings

The raw data may contain **inconsistent formats, null values, and duplicates**, which require cleaning before analysis.

---

## 2️⃣ Raw Data Layer

**Folder:** `sql/1_raw_data/`

### Purpose

* Store raw data structure without transformation
* Maintain original data for audit and traceability

### Key Script

* `create_raw_table.sql`

This script creates the raw sales table used to load data directly from the Excel source.

---

## 3️⃣ Data Cleaning & Validation Layer

**Folder:** `sql/2_cleaning_validation/`

### Cleaning Steps

* Converted text-based numeric columns to proper numeric data types
* Standardized date formats
* Removed or handled null and invalid values
* Converted return flags to boolean format

### Validation Checks

* Null value checks
* Data type validation
* Logical checks (negative quantity, invalid revenue)

### Scripts Used

* `data_cleaning.sql`
* `data_validation.sql`

This layer ensures **high data quality** before modeling.

---

## 4️⃣ Data Modeling – Star Schema

**Folder:** `sql/3_star_schema/`

### Schema Design

* **Fact Table:** `fact_sales`
* **Dimension Tables:**

  * `dim_date`
  * `dim_product`
  * `dim_customer`
  * `dim_region`
  * `dim_payment`

### Benefits

* Faster query performance
* Simplified reporting
* Scalable design for analytics

### Scripts Used

* `create_dim_tables.sql`
* `create_fact_table.sql`
* `insert_into_star.sql`

---

## 5️⃣ Analytical Views

**Folder:** `sql/4_views/`

### Purpose

* Provide summarized, analysis-ready datasets
* Simplify Power BI data consumption

### Script Used

* `sales_summary_view.sql`

Views help reduce complex joins inside Power BI.

---

## 6️⃣ Power BI Integration

**Folder:** `powerbi/`

* Connected Power BI to SQL database
* Imported fact and dimension tables
* Defined relationships using star schema
* Created DAX measures for KPIs

File:

* `Sales_Performance_Dashboard.pbix`

---

## 7️⃣ KPI & DAX Layer

**Folder:** `dax/`

* Implemented business KPIs using DAX
* Measures include revenue, growth, returns, delivery performance, and customer behavior

File:

* `measures.md`

---

## 8️⃣ Reporting & Insights

**Folders:**

* `insights/`
* `reports/`

### Outputs

* Business insights and recommendations
* Final PDF report for stakeholders

---

## ✅ End-to-End Flow Summary

```
Excel (Raw Data)
   ↓
Raw SQL Tables
   ↓
Data Cleaning & Validation
   ↓
Star Schema Modeling
   ↓
SQL Views
   ↓
Power BI + DAX
   ↓
Insights & Reports
```

---

## 🎯 Key Takeaway

A well-structured data pipeline ensures **accuracy, performance, and scalability**, enabling reliable dashboards and confident business decisions.

---

