# Dataset Requirements for EV Market Expansion Intelligence

## Problem Statement
Identify high-potential regions for EV sales and charging infrastructure investment by analyzing market demand, demographics, infrastructure gaps, and policy support.

---

## Core Datasets to Collect

### 1. **EV Sales & Registration Data** (Critical)
**Source:** Government transport departments, SIAM (Society of Indian Automobile Manufacturers) if India-focused

| Field | Description | Granularity | Data Type |
|-------|-------------|-------------|-----------|
| Region/State | Geographic identifier | State/Province | VARCHAR(100) |
| Year/Month | Time period | Annual or Quarterly | INT / DATE |
| EV_Sales | New EV vehicles sold | Count | INT |
| EV_Registrations | Total cumulative EVs registered | Count | INT |
| Total_Vehicles | Total vehicle registrations (ICE + EV) | Count | INT |
| Vehicle_Model | (Optional) EV model name for competitive analysis | Text | VARCHAR(255) |

**Rationale:** Core metric for identifying growth trajectories and market penetration rates.

**Sample Data Structure:**
```
state_id, year, ev_sales, ev_registrations, total_vehicles, yoy_growth_pct
```

---

### 2. **Charging Infrastructure Data** (Critical)
**Source:** Government charging networks (NHAI portals), charging operator databases

| Field | Description | Granularity | Data Type |
|-------|-------------|-------------|-----------|
| Region/State | Geographic identifier | State/City | VARCHAR(100) |
| City | City identifier | City | VARCHAR(100) |
| Charger_Count | Number of public charging stations | Count | INT |
| Charger_Type | Fast-charging, slow-charging, DC fast | Category | VARCHAR(50) |
| Charger_Capacity_kW | Power output of chargers | Numeric | DECIMAL(10,2) |
| Operational_Status | Active, planned, under-construction | Category | VARCHAR(50) |
| Latitude/Longitude | Geographic coordinates (optional) | Coordinate | DECIMAL(10,6) |

**Rationale:** Identifies infrastructure gaps; low charger-to-EV ratios signal investment opportunities.

**Sample Data Structure:**
```
charger_id, state_id, city, charger_count, charger_type, capacity_kw, status, created_year
```

---

### 3. **Demographic Data** (High Priority)
**Source:** Census Bureau, World Bank, national statistics agencies

| Field | Description | Granularity | Data Type |
|-------|-------------|-------------|-----------|
| Region | Geographic identifier | State/City | VARCHAR(100) |
| Population | Total population | Numeric | BIGINT |
| Urban_Population_% | Percentage urban vs. rural | Percentage | DECIMAL(5,2) |
| Population_Density | People per sq km | Numeric | DECIMAL(10,2) |
| Median_Age | Age demographics | Numeric | INT |
| Literacy_Rate | Educational attainment | Percentage | DECIMAL(5,2) |
| Working_Age_Population_% | % of population 18-65 | Percentage | DECIMAL(5,2) |

**Rationale:** Urbanization and density correlate with EV adoption; helps profile receptive markets.

**Sample Data Structure:**
```
demographic_id, state_id, year, population, urban_pct, pop_density, median_age, literacy_rate
```

---

### 4. **Economic Data** (High Priority)
**Source:** National accounts offices, World Bank, industry reports

| Field | Description | Granularity | Data Type |
|-------|-------------|-------------|-----------|
| Region | Geographic identifier | State | VARCHAR(100) |
| GDP_Per_Capita | Average income level | USD or local currency | DECIMAL(12,2) |
| Median_Household_Income | Purchasing power | USD or local currency | DECIMAL(12,2) |
| Petrol_Price | Fuel cost (ICE alternative) | Price per liter | DECIMAL(8,2) |
| Electricity_Price | Cost to charge EVs | Price per kWh | DECIMAL(8,2) |
| Employment_Rate | Labor market strength | Percentage | DECIMAL(5,2) |
| Vehicle_Ownership_Rate | Cars per 1000 people | Numeric | DECIMAL(5,2) |

**Rationale:** Income levels and fuel prices drive EV affordability perception and total cost of ownership calculations.

**Sample Data Structure:**
```
economic_id, state_id, year, gdp_per_capita, median_income, petrol_price, electricity_price, employment_rate
```

---

### 5. **Government Policy & Incentive Data** (High Priority)
**Source:** Government websites, policy databases, news archives

| Field | Description | Granularity | Data Type |
|-------|-------------|-------------|-----------|
| Region | Geographic identifier | State/Country | VARCHAR(100) |
| Policy_Type | Subsidy, tax credit, registration waiver, etc. | Category | VARCHAR(100) |
| Incentive_Amount | Monetary value of incentive | USD or local currency | DECIMAL(12,2) |
| Policy_Duration | Start and end dates | Date range | DATE |
| EV_Target | Government adoption target (%) | Percentage | DECIMAL(5,2) |
| Priority_Status | High, medium, low policy focus | Category | VARCHAR(50) |
| Policy_Description | Detailed policy information | Text | TEXT |

**Rationale:** Policy support is a key driver of adoption; identifies regions with favorable regulatory environment.

**Sample Data Structure:**
```
policy_id, state_id, policy_type, incentive_amount, start_date, end_date, ev_target_pct, priority_status
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

### 7. **Environmental & Air Quality Data** (Optional)
**Source:** Environmental agencies, World Health Organization (AQI data)

| Field | Description | Granularity | Data Type |
|-------|-------------|-------------|-----------|
| Region | Geographic identifier | State/City | VARCHAR(100) |
| Air_Quality_Index | Average AQI score | Numeric | INT |
| CO2_Emissions_Target | Government reduction goals (%) | Numeric | DECIMAL(5,2) |
| Pollution_Level | High, medium, low | Category | VARCHAR(50) |
| Carbon_Intensity | Tons CO2 per GDP unit | Numeric | DECIMAL(8,2) |

**Rationale:** High pollution correlates with stricter EV mandates and adoption drivers.

**Sample Data Structure:**
```
env_id, state_id, year, aqi_score, co2_target, pollution_level, carbon_intensity
```

---

## Recommended Data Collection Approach

### Phase 1: Quick Reference (For MVP)
- EV Sales/Registrations (3-5 years historical)
- Charger locations & counts
- Population & urbanization rates
- GDP per capita / median income
- Policy incentives list (by region)

### Phase 2: Full Dataset (Comprehensive Analysis)
- Add competitor data
- Add detailed economic metrics
- Add environmental indicators
- Add monthly/quarterly trends (not just annual)

---

## Data Format & Structure

### Excel Structure (Pre-MySQL Import)
- **Sheet 1:** EV Sales (by state, year-over-year)
- **Sheet 2:** Charging Infrastructure (charger counts, types)
- **Sheet 3:** Demographics (population, urbanization, income)
- **Sheet 4:** Economic Data (income, fuel prices, electricity costs)
- **Sheet 5:** Policies (incentives, targets by state)
- **Sheet 6:** Competitors (market share, showroom counts)
- **Sheet 7:** Environmental (AQI, CO2 targets)

### MySQL Schema Design

```sql
-- Core dimension table for regions
CREATE TABLE dim_regions (
    region_id INT PRIMARY KEY AUTO_INCREMENT,
    state_name VARCHAR(100) NOT NULL,
    country VARCHAR(100),
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- EV Sales & Registration Facts
CREATE TABLE fact_ev_sales (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    region_id INT,
    year INT,
    ev_sales INT,
    ev_registrations INT,
    total_vehicles INT,
    yoy_growth_pct DECIMAL(5,2),
    FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

-- Charging Infrastructure Facts
CREATE TABLE fact_charging_infrastructure (
    charger_id INT PRIMARY KEY AUTO_INCREMENT,
    region_id INT,
    city VARCHAR(100),
    charger_count INT,
    charger_type VARCHAR(50),
    capacity_kw DECIMAL(10,2),
    operational_status VARCHAR(50),
    created_year INT,
    FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

-- Demographics Dimension
CREATE TABLE dim_demographics (
    demo_id INT PRIMARY KEY AUTO_INCREMENT,
    region_id INT,
    year INT,
    population BIGINT,
    urban_population_pct DECIMAL(5,2),
    population_density DECIMAL(10,2),
    median_age INT,
    literacy_rate DECIMAL(5,2),
    FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

-- Economic Data Facts
CREATE TABLE fact_economic_data (
    econ_id INT PRIMARY KEY AUTO_INCREMENT,
    region_id INT,
    year INT,
    gdp_per_capita DECIMAL(12,2),
    median_household_income DECIMAL(12,2),
    petrol_price DECIMAL(8,2),
    electricity_price DECIMAL(8,2),
    employment_rate DECIMAL(5,2),
    FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

-- Government Policies
CREATE TABLE dim_policies (
    policy_id INT PRIMARY KEY AUTO_INCREMENT,
    region_id INT,
    policy_type VARCHAR(100),
    incentive_amount DECIMAL(12,2),
    start_date DATE,
    end_date DATE,
    ev_target_pct DECIMAL(5,2),
    priority_status VARCHAR(50),
    policy_description TEXT,
    FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

-- Competitor Data
CREATE TABLE fact_competitor_presence (
    competitor_id INT PRIMARY KEY AUTO_INCREMENT,
    region_id INT,
    brand_name VARCHAR(100),
    showroom_count INT,
    market_share_pct DECIMAL(5,2),
    popular_models VARCHAR(255),
    service_centers INT,
    FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

-- Environmental Data
CREATE TABLE fact_environmental_data (
    env_id INT PRIMARY KEY AUTO_INCREMENT,
    region_id INT,
    year INT,
    aqi_score INT,
    co2_target DECIMAL(5,2),
    pollution_level VARCHAR(50),
    carbon_intensity DECIMAL(8,2),
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

1. **Master dataset (Excel):** Cleaned, aggregated regional summary
2. **MySQL database:** Normalized tables ready for Power BI import
3. **Data dictionary:** Field definitions, units, and data types
4. **Quality report:** Notes on completeness, gaps, and assumptions
5. **Power BI Data Model:** Configured relationships between MySQL tables
