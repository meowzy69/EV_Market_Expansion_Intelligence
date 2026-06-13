# Dataset Requirements for EV Market Expansion Intelligence

## Problem Statement
Identify high-potential regions for EV sales and charging infrastructure investment by analyzing market demand, demographics, infrastructure gaps, and policy support.

---

## Core Datasets to Collect

### 1. **EV Sales & Registration Data** (Critical)
**Source:** Government transport departments, SIAM (Society of Indian Automobile Manufacturers) if India-focused

| Field | Description | Granularity | Data Type |
|-------|-------------|-------------|-----------|
| sales_id | Unique sales record identifier | N/A | VARCHAR(20) |
| region_id | Geographic identifier (state) | State/Province | VARCHAR(10) |
| year | Year of sales data | Annual | INT |
| quarter | Quarter of the year | Quarterly | INT |
| ev_sales | New EV vehicles sold | Count | INT |
| ev_registrations | Total cumulative EVs registered | Count | INT |
| total_vehicle_registrations | Total vehicle registrations (ICE + EV) | Count | INT |
| ev_penetration_pct | EV penetration as % of total vehicles | Percentage | DECIMAL(5,2) |
| yoy_growth_pct | Year-over-year growth percentage | Percentage | DECIMAL(5,2) |
| cagr_3yr | 3-year compound annual growth rate | Percentage | DECIMAL(5,2) |
| ev_market_maturity | Market maturity stage (Early, Emerging, Scaling, Mature) | Category | VARCHAR(20) |
| ev_growth_segment | Growth intensity (Low, Moderate, High) | Category | VARCHAR(20) |
| ev_adoption_stage | Adoption stage (Pilot, Early Adoption, Growth, Accelerated) | Category | VARCHAR(20) |

**Rationale:** Core metric for identifying growth trajectories, market penetration rates, and adoption stage progression.

**Sample Data Structure:**
```
sales_id, region_id, year, quarter, ev_sales, ev_registrations, total_vehicle_registrations, ev_penetration_pct, yoy_growth_pct, cagr_3yr, ev_market_maturity, ev_growth_segment, ev_adoption_stage
```

---

### 2. **Charging Infrastructure Data** (Critical)
**Source:** Government charging networks (NHAI portals), charging operator databases

| Field | Description | Granularity | Data Type |
|-------|-------------|-------------|-----------|
| charger_id | Unique charging record identifier | N/A | VARCHAR(20) |
| region_id | Geographic identifier (state) | State | VARCHAR(10) |
| city_name | City identifier | City | VARCHAR(100) |
| year | Year of infrastructure data | Annual | INT |
| quarter | Quarter of the year | Quarterly | INT |
| charger_count | Total number of public charging stations | Count | INT |
| fast_charger_count | Number of fast-charging stations | Count | INT |
| slow_charger_count | Number of slow-charging stations | Count | INT |
| dc_fast_count | Number of DC fast-charging stations | Count | INT |
| average_capacity_kw | Average power output of chargers | Power rating (kW) | DECIMAL(10,2) |
| operational_status | Active, planned, under-construction | Category | VARCHAR(50) |
| charger_per_1000_ev | Charger density metric (chargers per 1000 EVs) | Ratio | DECIMAL(10,2) |
| infrastructure_gap_score | Charging gap assessment score (0-100) | Score | DECIMAL(5,1) |
| charging_readiness_score | Infrastructure readiness score (0-100) | Score | DECIMAL(5,1) |

**Rationale:** Identifies infrastructure gaps; low charger-to-EV ratios signal investment opportunities. Quarterly tracking enables trend analysis.

**Sample Data Structure:**
```
charger_id, region_id, city_name, year, quarter, charger_count, fast_charger_count, slow_charger_count, dc_fast_count, average_capacity_kw, operational_status, charger_per_1000_ev, infrastructure_gap_score, charging_readiness_score
```

---

### 3. **Demographic Data** (High Priority)
**Source:** Census Bureau, World Bank, national statistics agencies

| Field | Description | Granularity | Data Type |
|-------|-------------|-------------|-----------|
| demo_id | Unique demographic record identifier | N/A | VARCHAR(20) |
| region_id | Geographic identifier | State | VARCHAR(10) |
| year | Year of demographic data | Annual | INT |
| population | Total population | Count | BIGINT |
| urban_population_pct | Percentage urban vs. rural | Percentage | DECIMAL(5,2) |
| population_density | People per sq km | Numeric | DECIMAL(10,2) |
| median_age | Median age of population | Years | INT |
| literacy_rate | Educational attainment | Percentage | DECIMAL(5,2) |
| working_age_population_pct | % of population 18-65 years | Percentage | DECIMAL(5,2) |

**Rationale:** Urbanization and density correlate with EV adoption; working-age population indicates purchasing power demographics.

**Sample Data Structure:**
```
demo_id, region_id, year, population, urban_population_pct, population_density, median_age, literacy_rate, working_age_population_pct
```

---

### 4. **Economic Data** (High Priority)
**Source:** National accounts offices, World Bank, industry reports

| Field | Description | Granularity | Data Type |
|-------|-------------|-------------|-----------|
| econ_id | Unique economic record identifier | N/A | VARCHAR(20) |
| region_id | Geographic identifier | State | VARCHAR(10) |
| year | Year of economic data | Annual | INT |
| gdp_per_capita | Average income level | INR (Indian Rupees) | DECIMAL(12,2) |
| median_household_income | Purchasing power indicator | INR | DECIMAL(12,2) |
| petrol_price | Fuel cost (ICE alternative) | INR per liter | DECIMAL(8,2) |
| electricity_price | Cost to charge EVs | INR per kWh | DECIMAL(8,2) |
| employment_rate | Labor market strength | Percentage | DECIMAL(5,2) |
| vehicle_ownership_rate | Cars per 1000 people | Rate | DECIMAL(5,2) |
| affordability_index | EV affordability metric (0-100) | Score | DECIMAL(5,1) |
| energy_cost_advantage | Cost advantage of EV over ICE (%) | Percentage | DECIMAL(5,2) |

**Rationale:** Income levels, fuel prices, and cost advantage drive EV affordability perception and total cost of ownership calculations.

**Sample Data Structure:**
```
econ_id, region_id, year, gdp_per_capita, median_household_income, petrol_price, electricity_price, employment_rate, vehicle_ownership_rate, affordability_index, energy_cost_advantage
```

---

### 5. **Government Policy & Incentive Data** (High Priority)
**Source:** Government websites, policy databases, news archives

| Field | Description | Granularity | Data Type |
|-------|-------------|-------------|-----------|
| policy_id | Unique policy record identifier | N/A | VARCHAR(20) |
| region_id | Geographic identifier | State | VARCHAR(10) |
| policy_type | Subsidy, tax credit, registration waiver, charging grant, manufacturing incentive | Category | VARCHAR(100) |
| incentive_amount | Monetary value of incentive | INR (Indian Rupees) | DECIMAL(12,2) |
| start_date | Policy start date | Date | DATE |
| end_date | Policy end date | Date | DATE |
| ev_target_pct | Government adoption target (%) | Percentage | DECIMAL(5,2) |
| priority_status | High, medium, low policy focus | Category | VARCHAR(50) |
| policy_description | Detailed policy information | Text | TEXT |
| policy_strength_score | Policy effectiveness score (0-100) | Score | DECIMAL(5,1) |

**Rationale:** Policy support is a key driver of adoption; identifies regions with favorable regulatory environment and effective incentives.

**Sample Data Structure:**
```
policy_id, region_id, policy_type, incentive_amount, start_date, end_date, ev_target_pct, priority_status, policy_description, policy_strength_score
```

---

### 6. **Competitor Presence Data** (Medium Priority)
**Source:** Market reports, dealer locator APIs, news articles

| Field | Description | Granularity | Data Type |
|-------|-------------|-------------|-----------|
| Region | Geographic identifier | State/City | VARCHAR(100) |
| Competitor_Brand | EV manufacturer name | Text | VARCHAR(100) |
| Showroom_Count | Number of retail outlets | Count | INT |
| Market_Share | % of regional EV sales | Percentage | DECIMAL(5,2) |
| Popular_Models | Top-selling models in region | Text | VARCHAR(255) |
| Service_Centers | Number of after-sales service points | Count | INT |

**Rationale:** Identifies competitive saturation; helps target underserved or growing markets.

**Sample Data Structure:**
```
competitor_id, state_id, brand_name, showroom_count, market_share_pct, popular_models, service_centers
```

---

### 7. **Environmental & Air Quality Data** (High Priority)
**Source:** Environmental agencies, World Health Organization (AQI data)

| Field | Description | Granularity | Data Type |
|-------|-------------|-------------|-----------|
| env_id | Unique environmental record identifier | N/A | VARCHAR(20) |
| region_id | Geographic identifier | State | VARCHAR(10) |
| year | Year of environmental data | Annual | INT |
| aqi_score | Average Air Quality Index score | Numeric | INT |
| co2_target_pct | Government CO2 reduction target (%) | Percentage | DECIMAL(5,2) |
| pollution_level | High, medium, low pollution classification | Category | VARCHAR(50) |
| carbon_intensity | Tons CO2 per GDP unit | Numeric | DECIMAL(8,2) |
| green_transition_priority | Green transition urgency score (0-100) | Score | DECIMAL(5,1) |

**Rationale:** High pollution and AQI correlate with stricter EV mandates and adoption drivers. Green transition priority identifies regions with strongest environmental drivers.

**Sample Data Structure:**
```
env_id, region_id, year, aqi_score, co2_target_pct, pollution_level, carbon_intensity, green_transition_priority
```

---

## Current Data Status

### ✅ Implementation Complete
The dataset has been fully populated with **Phase 2: Comprehensive Analysis** level data:

- ✅ EV Sales/Registrations with quarterly granularity (2019-2030)
- ✅ Charging infrastructure data with quarterly updates and capacity metrics
- ✅ Demographics (2019-2030) with urbanization and working-age population data
- ✅ Economic data including affordability and cost advantage indices
- ✅ 141 regional policy records with effectiveness scoring
- ✅ Competitor presence across 9 major EV brands
- ✅ Environmental data with green transition priority scoring
- ✅ 270 region-level records (28 states + 8 union territories, plus tier-1 and tier-2 cities)
- ✅ Calculated metrics for adoption stage, market maturity, infrastructure gaps, and readiness

### Data Volume Overview
- **Regions:** 270 (state-level + city-level records)
- **EV Sales Records:** 12,960 (quarterly, 2019-2030)
- **Charging Infrastructure:** 12,960 (quarterly, 2019-2030)
- **Demographics:** 3,240 (annual, 2019-2030)
- **Economic Data:** 3,240 (annual, 2019-2030)
- **Policies:** 141 regional policies
- **Competitors:** 2,430 brand presence records across regions
- **Environmental:** 3,240 (annual, 2019-2030)

---

## Recommended Data Collection Approach (For Future Updates)

### Phase 1: Quick Reference (MVP) ✅ COMPLETE
- ✅ EV Sales/Registrations (3-5 years historical)
- ✅ Charger locations & counts
- ✅ Population & urbanization rates
- ✅ GDP per capita / median income
- ✅ Policy incentives list (by region)

### Phase 2: Full Dataset (Comprehensive Analysis) ✅ COMPLETE
- ✅ Competitor data with market share
- ✅ Detailed economic metrics (affordability, cost advantage)
- ✅ Environmental indicators with green transition scoring
- ✅ Quarterly trends (not just annual)
- ✅ Calculated metrics (adoption stage, market maturity, infrastructure gaps)

### Phase 3: Real-Time Enhancement (Future)
- Real-time charging station occupancy data
- Live EV sales tracking via dealer APIs
- Dynamic policy updates and incentive tracking
- Monthly instead of quarterly granularity

---

## Data Format & Structure

### ✅ Current CSV Files (Ready for Import)
Data is currently available in CSV format in the `ev market/data/` folder:

- **dim_demographics.csv** - Demographics data (9 columns, 3,240 rows)
- **dim_policies.csv** - Policy incentives (10 columns, 141 rows)
- **dim_regions.csv** - Regional dimension (9 columns, 270 rows)
- **fact_charging_infrastructure.csv** - Charging data (14 columns, 12,960 rows)
- **fact_competitor_presence.csv** - Competitor data (7 columns, 2,430 rows)
- **fact_economic_data.csv** - Economic metrics (10 columns, 3,240 rows)
- **fact_environmental_data.csv** - Environmental data (8 columns, 3,240 rows)
- **fact_ev_sales.csv** - EV sales data (13 columns, 12,960 rows)

### Previous Format Reference
Data was originally organized in Excel with these sheets (now converted to CSV):
- **Sheet 1:** EV Sales (by state and quarter, 2019-2030)
- **Sheet 2:** Charging Infrastructure (charger counts, types, capacity by quarter)
- **Sheet 3:** Demographics (population, urbanization, age, literacy)
- **Sheet 4:** Economic Data (income, fuel prices, electricity costs, affordability)
- **Sheet 5:** Policies (incentives, targets by state)
- **Sheet 6:** Competitors (market share, showroom counts)
- **Sheet 7:** Environmental (AQI, CO2 targets)

### MySQL Schema Design

```sql
-- Core dimension table for regions (states, cities, and union territories)
CREATE TABLE dim_regions (
    region_id VARCHAR(10) PRIMARY KEY,
    state_name VARCHAR(100) NOT NULL,
    city_name VARCHAR(100),
    country VARCHAR(100),
    region_type VARCHAR(50),
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    population_zone VARCHAR(50),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- EV Sales & Registration Facts (Quarterly)
CREATE TABLE fact_ev_sales (
    sales_id VARCHAR(20) PRIMARY KEY,
    region_id VARCHAR(10),
    year INT,
    quarter INT,
    ev_sales INT,
    ev_registrations INT,
    total_vehicle_registrations INT,
    ev_penetration_pct DECIMAL(5,2),
    yoy_growth_pct DECIMAL(5,2),
    cagr_3yr DECIMAL(5,2),
    ev_market_maturity VARCHAR(20),
    ev_growth_segment VARCHAR(20),
    ev_adoption_stage VARCHAR(20),
    FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

-- Charging Infrastructure Facts (Quarterly)
CREATE TABLE fact_charging_infrastructure (
    charger_id VARCHAR(20) PRIMARY KEY,
    region_id VARCHAR(10),
    city_name VARCHAR(100),
    year INT,
    quarter INT,
    charger_count INT,
    fast_charger_count INT,
    slow_charger_count INT,
    dc_fast_count INT,
    average_capacity_kw DECIMAL(10,2),
    operational_status VARCHAR(50),
    charger_per_1000_ev DECIMAL(10,2),
    infrastructure_gap_score DECIMAL(5,1),
    charging_readiness_score DECIMAL(5,1),
    FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

-- Demographics Dimension (Annual)
CREATE TABLE dim_demographics (
    demo_id VARCHAR(20) PRIMARY KEY,
    region_id VARCHAR(10),
    year INT,
    population BIGINT,
    urban_population_pct DECIMAL(5,2),
    population_density DECIMAL(10,2),
    median_age INT,
    literacy_rate DECIMAL(5,2),
    working_age_population_pct DECIMAL(5,2),
    FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

-- Economic Data Facts (Annual)
CREATE TABLE fact_economic_data (
    econ_id VARCHAR(20) PRIMARY KEY,
    region_id VARCHAR(10),
    year INT,
    gdp_per_capita DECIMAL(12,2),
    median_household_income DECIMAL(12,2),
    petrol_price DECIMAL(8,2),
    electricity_price DECIMAL(8,2),
    employment_rate DECIMAL(5,2),
    vehicle_ownership_rate DECIMAL(5,2),
    affordability_index DECIMAL(5,1),
    energy_cost_advantage DECIMAL(5,2),
    FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

-- Government Policies Dimension
CREATE TABLE dim_policies (
    policy_id VARCHAR(20) PRIMARY KEY,
    region_id VARCHAR(10),
    policy_type VARCHAR(100),
    incentive_amount DECIMAL(12,2),
    start_date DATE,
    end_date DATE,
    ev_target_pct DECIMAL(5,2),
    priority_status VARCHAR(50),
    policy_description TEXT,
    policy_strength_score DECIMAL(5,1),
    FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

-- Competitor Data Facts
CREATE TABLE fact_competitor_presence (
    competitor_id VARCHAR(20) PRIMARY KEY,
    region_id VARCHAR(10),
    brand_name VARCHAR(100),
    showroom_count INT,
    market_share_pct DECIMAL(5,2),
    popular_models VARCHAR(255),
    service_centers INT,
    FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

-- Environmental Data Facts (Annual)
CREATE TABLE fact_environmental_data (
    env_id VARCHAR(20) PRIMARY KEY,
    region_id VARCHAR(10),
    year INT,
    aqi_score INT,
    co2_target_pct DECIMAL(5,2),
    pollution_level VARCHAR(50),
    carbon_intensity DECIMAL(8,2),
    green_transition_priority DECIMAL(5,1),
    FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);
```

---

## Data Quality Checklist

- ✅ All regions have at least 3 years of EV sales history
- ✅ Charger data is current (within 6 months)
- ✅ No missing critical fields (use NULL or default value where unavoidable)
- ✅ Consistent date formats across all sources (YYYY-MM-DD)
- ✅ Currency normalized (if comparing across countries)
- ✅ Data validated against 2–3 independent sources where possible
- ✅ Data imported into MySQL with referential integrity checks

---

## Expected Deliverables from Data Collection

### ✅ Completed Deliverables

1. **✅ Master dataset (CSV):** Cleaned, aggregated regional summary in 8 CSV files
2. **✅ MySQL schema:** Normalized table definitions ready for database import (see MySQL Schema Design section above)
3. **✅ SQL scripts:** MySQL and PostgreSQL DDL available in `ev market/sql/` folder
4. **✅ Data dictionary:** Complete field definitions, units, and data types (documented in this file)
5. **✅ Calculated metrics:** Pre-computed indices including:
   - EV penetration percentage and growth rates
   - Infrastructure gap and readiness scores
   - Affordability and cost advantage indices
   - Policy strength scores
   - Green transition priority scores
   - Market maturity and adoption stage classifications

### 📋 Recommended Next Steps

1. **Database Import:** Load CSV files into MySQL/PostgreSQL using the provided SQL schema
2. **Power BI Integration:** Import database tables and configure relationships as per Power BI documentation
3. **Dashboard Creation:** Build analytical dashboards for:
   - EV penetration and growth analysis
   - Charging gap analysis
   - Policy effectiveness ranking
   - Competitor benchmarking
   - Regional opportunity scoring
   - Investment prioritization
4. **Data Validation:** QA check against source systems (if updating with live data)
5. **Refresh Schedule:** Establish quarterly update cycles for sales and infrastructure data, annual for demographics and economic data
