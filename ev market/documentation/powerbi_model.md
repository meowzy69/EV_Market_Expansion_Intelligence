# Power BI Data Model

## Core tables
- `dim_regions`
- `fact_ev_sales`
- `fact_charging_infrastructure`
- `dim_demographics`
- `fact_economic_data`
- `dim_policies`
- `fact_competitor_presence`
- `fact_environmental_data`

## Recommended relationships
- One-to-many from `dim_regions[region_id]` to every fact table
- One-to-many from `dim_regions[region_id]` to `dim_policies[region_id]`
- Optional Date table linked to `fact_ev_sales` and `fact_charging_infrastructure` through a derived date column if you add one in Power BI

## Suggested KPI measures
- EV Penetration Rate
- Charger-to-EV Ratio
- YoY EV Growth
- Market Attractiveness Score
- Policy Strength Index
- Infrastructure Readiness Score
- Economic Readiness Score
- Competition Intensity Score
- Regional Opportunity Index
- Investment Priority Score

## Example DAX
```DAX
EV Penetration Rate =
DIVIDE(
    SUM(fact_ev_sales[ev_registrations]),
    SUM(fact_ev_sales[total_vehicle_registrations])
) * 100

Charger-to-EV Ratio =
DIVIDE(
    SUM(fact_charging_infrastructure[charger_count]),
    DIVIDE(SUM(fact_ev_sales[ev_registrations]), 1000)
)

Policy Strength Index =
AVERAGE(dim_policies[policy_strength_score])

Infrastructure Readiness Score =
AVERAGE(fact_charging_infrastructure[charging_readiness_score])

Economic Readiness Score =
AVERAGE(fact_economic_data[affordability_index])
```

## Visuals to build
- State/UT map by EV penetration
- Quarterly growth trend line
- Charger gap heatmap
- Policy vs adoption scatter plot
- Brand share bar chart by region
- Opportunity matrix using policy and infrastructure readiness
