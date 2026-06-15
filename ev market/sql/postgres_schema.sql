CREATE SCHEMA IF NOT EXISTS ev_market_intelligence;
SET search_path TO ev_market_intelligence;

CREATE TABLE dim_regions (
    region_id VARCHAR(10) PRIMARY KEY,
    state_name VARCHAR(100) NOT NULL,
    city_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    region_type VARCHAR(20) NOT NULL,
    latitude NUMERIC(9,6) NOT NULL,
    longitude NUMERIC(9,6) NOT NULL,
    population_zone VARCHAR(20) NOT NULL,
    created_date DATE NOT NULL
);

CREATE TABLE fact_ev_sales (
    sales_id VARCHAR(12) PRIMARY KEY,
    region_id VARCHAR(10) NOT NULL REFERENCES dim_regions(region_id),
    year SMALLINT NOT NULL,
    quarter SMALLINT NOT NULL,
    ev_sales INTEGER NOT NULL,
    ev_registrations INTEGER NOT NULL,
    total_vehicle_registrations BIGINT NOT NULL,
    ev_penetration_pct NUMERIC(6,2) NOT NULL,
    yoy_growth_pct NUMERIC(8,2) NOT NULL,
    cagr_3yr NUMERIC(8,2) NOT NULL,
    ev_market_maturity VARCHAR(20) NOT NULL,
    ev_growth_segment VARCHAR(20) NOT NULL,
    ev_adoption_stage VARCHAR(20) NOT NULL
);

CREATE INDEX idx_fact_ev_sales_region_year_q ON fact_ev_sales(region_id, year, quarter);

CREATE TABLE fact_charging_infrastructure (
    charger_id VARCHAR(12) PRIMARY KEY,
    region_id VARCHAR(10) NOT NULL REFERENCES dim_regions(region_id),
    city_name VARCHAR(100) NOT NULL,
    year SMALLINT NOT NULL,
    quarter SMALLINT NOT NULL,
    charger_count INTEGER NOT NULL,
    fast_charger_count INTEGER NOT NULL,
    slow_charger_count INTEGER NOT NULL,
    dc_fast_count INTEGER NOT NULL,
    average_capacity_kw NUMERIC(8,1) NOT NULL,
    operational_status VARCHAR(30) NOT NULL,
    charger_per_1000_ev NUMERIC(8,2) NOT NULL,
    infrastructure_gap_score NUMERIC(6,1) NOT NULL,
    charging_readiness_score NUMERIC(6,1) NOT NULL
);

CREATE INDEX idx_fact_infra_region_year_q ON fact_charging_infrastructure(region_id, year, quarter);

CREATE TABLE dim_demographics (
    demo_id VARCHAR(12) PRIMARY KEY,
    region_id VARCHAR(10) NOT NULL REFERENCES dim_regions(region_id),
    year SMALLINT NOT NULL,
    population BIGINT NOT NULL,
    urban_population_pct NUMERIC(5,1) NOT NULL,
    population_density INTEGER NOT NULL,
    median_age NUMERIC(4,1) NOT NULL,
    literacy_rate NUMERIC(5,1) NOT NULL,
    working_age_population_pct NUMERIC(5,1) NOT NULL
);

CREATE INDEX idx_demo_region_year ON dim_demographics(region_id, year);

CREATE TABLE fact_economic_data (
    econ_id VARCHAR(12) PRIMARY KEY,
    region_id VARCHAR(10) NOT NULL REFERENCES dim_regions(region_id),
    year SMALLINT NOT NULL,
    gdp_per_capita INTEGER NOT NULL,
    median_household_income INTEGER NOT NULL,
    petrol_price NUMERIC(8,2) NOT NULL,
    electricity_price NUMERIC(8,2) NOT NULL,
    employment_rate NUMERIC(5,1) NOT NULL,
    vehicle_ownership_rate NUMERIC(5,2) NOT NULL,
    affordability_index NUMERIC(5,1) NOT NULL,
    energy_cost_advantage NUMERIC(8,2) NOT NULL
);

CREATE INDEX idx_econ_region_year ON fact_economic_data(region_id, year);

CREATE TABLE dim_policies (
    policy_id VARCHAR(12) PRIMARY KEY,
    region_id VARCHAR(10) NOT NULL REFERENCES dim_regions(region_id),
    policy_type VARCHAR(50) NOT NULL,
    incentive_amount BIGINT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    ev_target_pct NUMERIC(5,1) NOT NULL,
    priority_status VARCHAR(20) NOT NULL,
    policy_description TEXT NOT NULL,
    policy_strength_score NUMERIC(5,1) NOT NULL
);

CREATE INDEX idx_policy_region ON dim_policies(region_id);

CREATE TABLE fact_competitor_presence (
    competitor_id VARCHAR(12) PRIMARY KEY,
    region_id VARCHAR(10) NOT NULL REFERENCES dim_regions(region_id),
    brand_name VARCHAR(50) NOT NULL,
    showroom_count INTEGER NOT NULL,
    market_share_pct NUMERIC(5,2) NOT NULL,
    popular_models VARCHAR(200) NOT NULL,
    service_centers INTEGER NOT NULL
);

CREATE INDEX idx_comp_region_brand ON fact_competitor_presence(region_id, brand_name);

CREATE TABLE fact_environmental_data (
    env_id VARCHAR(12) PRIMARY KEY,
    region_id VARCHAR(10) NOT NULL REFERENCES dim_regions(region_id),
    year SMALLINT NOT NULL,
    aqi_score NUMERIC(6,1) NOT NULL,
    co2_target_pct NUMERIC(5,1) NOT NULL,
    pollution_level VARCHAR(20) NOT NULL,
    carbon_intensity NUMERIC(5,2) NOT NULL,
    green_transition_priority NUMERIC(5,1) NOT NULL
);

CREATE INDEX idx_env_region_year ON fact_environmental_data(region_id, year);