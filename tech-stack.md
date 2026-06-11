# Tech Stack for EV Market Expansion Intelligence Project

## Overview
This project uses a **data-first approach** with Excel, Power BI, and MySQL to analyze EV market expansion opportunities. No Python or advanced machine learning will be used.

## Technology Components

### Data Storage & Management
- **MySQL 8.0+**
  - Purpose: Central repository for all raw and processed data
  - Use Cases: Store regional EV sales, charging infrastructure, demographics, policy data
  - Import source data (CSVs, exports) into normalized tables
  - Create views for aggregated regional summaries
  - Support for relational data integrity and complex joins

### Data Preparation & Analysis
- **Microsoft Excel (2019+)**
  - Data cleaning and validation (removing duplicates, handling missing values)
  - Formula-based calculations (growth rates, ratios, normalized scores)
  - PivotTables for cross-tabulation and aggregation
  - Data import from MySQL (via ODBC or native connectors)
  - "Opportunity Index" scoring formula (weighted combination of factors)
  - Trend analysis using built-in FORECAST functions

### Visualization & Dashboard
- **Microsoft Power BI Desktop & Service**
  - Interactive dashboards for stakeholder exploration
  - Direct MySQL connections for real-time or scheduled data refresh
  - Map visuals (geographic opportunity mapping)
  - Scatter plots, bar charts, KPI cards, tables
  - Slicers and filters for "what-if" analysis
  - Mobile-friendly report layouts

## Data Flow Architecture

```
MySQL Database (raw data) 
    → Excel (transformation & scoring) 
    → Power BI (dashboards & insights)
```

## Key Tools & Features

| Layer | Tool | Functions |
|-------|------|-----------|
| **Database** | MySQL | Data storage, queries, aggregation, relational integrity |
| **Calculation** | Excel | Scoring models, KPI formulas, trend analysis |
| **Visualization** | Power BI | Interactive dashboards, geographic mapping, KPIs |

## MySQL Setup Requirements

### Installation
- MySQL Server 8.0 or later
- MySQL Workbench (for database administration and query design)
- MySQL ODBC Driver (for Excel connectivity)

### Key Capabilities
- Support for normalized schema design
- Efficient querying of large datasets
- Data integrity through primary and foreign keys
- Scheduled backups and data recovery
- User authentication and role-based access control

## Excel & Power BI Integration

### Excel to MySQL Connection
- Use ODBC Data Source Name (DSN) to connect to MySQL
- Import data via Power Query (Get Data → From Database → MySQL)
- Create linked tables for live data refresh
- Use SQL queries directly in Excel for specific reports

### Power BI to MySQL Connection
- Configure MySQL connector in Power BI Desktop
- Set up scheduled refresh (daily/weekly) via Power BI Service
- Create relationships between tables in Power BI Data Model
- Use DAX formulas for calculated metrics

## Constraints & Guidelines
- ✅ Use MySQL for data storage, complex queries, and aggregations
- ✅ Use Excel formulas for weighted scoring and business logic
- ✅ Use Power BI for interactivity and executive dashboards
- ✅ Leverage MySQL views for pre-aggregated regional summaries
- ❌ Avoid Python scripting and machine learning algorithms
- ❌ No advanced statistical modeling or predictive APIs

## Data Security Considerations
- Store credentials securely (not in plain text)
- Use MySQL user accounts with least-privilege access
- Implement row-level security where needed for sensitive data
- Regular backups of MySQL database
- Audit logs for data access and modifications
