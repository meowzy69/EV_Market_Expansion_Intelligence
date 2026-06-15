# EV Market Intelligence

Synthetic but consulting-style EV market expansion dataset for India, built for Excel, Power BI, and MySQL/PostgreSQL.

## Folder structure

- `data/` - CSV tables
- `sql/` - MySQL and PostgreSQL DDL
- `documentation/` - data dictionary workbook, QA report, ER diagram, and Power BI notes

## What is included

- 270 region rows
- 12,960 quarterly EV sales rows
- 12,960 quarterly charging infrastructure rows
- 3,240 demographic rows
- 3,240 economic rows
- 141 policy rows
- 2,430 competitor presence rows
- 3,240 environmental rows

## Notes

- Built as synthetic data with realistic business logic and cross-table referential integrity.
- Designed for Power BI modeling and SQL warehouse loading.
- Kaggle-inspired references used for column design and market structure:
  - Electric Vehicle Charging Stations in India
  - EV Charging Stations in India Simplified (2025)
  - Indian Electric Vehicle Dataset
  - Electric Vehicle Charging Station Usage Dataset
  - Global EV Charging Stations Dataset

## Load order

1. `dim_regions`
2. `dim_policies`
3. `fact_ev_sales`
4. `fact_charging_infrastructure`
5. `dim_demographics`
6. `fact_economic_data`
7. `fact_competitor_presence`
8. `fact_environmental_data`

## Suggested Power BI relationships

- `dim_regions[region_id]` -> all fact tables and `dim_policies`
- Use `year` and `quarter` as time filters for sales and infrastructure
- Use a dedicated Date table for time intelligence measures

## Key use cases

- EV penetration and growth analysis
- Charging gap analysis
- Policy effectiveness ranking
- Competitor benchmarking
- Regional opportunity scoring
- Investment prioritization
