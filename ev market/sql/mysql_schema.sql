CREATE DATABASE IF NOT EXISTS ev_market_intelligence;
USE ev_market_intelligence;

CREATE TABLE dim_regions (
    region_id VARCHAR(10) PRIMARY KEY,
    state_name VARCHAR(100) NOT NULL,
    city_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    region_type VARCHAR(20) NOT NULL,
    latitude DECIMAL(9,6) NOT NULL,
    longitude DECIMAL(9,6) NOT NULL,
    population_zone VARCHAR(20) NOT NULL,
    created_date DATE NOT NULL
);

CREATE TABLE fact_ev_sales (
    sales_id VARCHAR(12) PRIMARY KEY,
    region_id VARCHAR(10) NOT NULL,
    year SMALLINT NOT NULL,
    quarter TINYINT NOT NULL,
    ev_sales INT NOT NULL,
    ev_registrations INT NOT NULL,
    total_vehicle_registrations BIGINT NOT NULL,
    ev_penetration_pct DECIMAL(6,2) NOT NULL,
    yoy_growth_pct DECIMAL(8,2) NOT NULL,
    cagr_3yr DECIMAL(8,2) NOT NULL,
    ev_market_maturity VARCHAR(20) NOT NULL,
    ev_growth_segment VARCHAR(20) NOT NULL,
    ev_adoption_stage VARCHAR(20) NOT NULL,
    CONSTRAINT fk_ev_sales_region FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

CREATE INDEX idx_fact_ev_sales_region_year_q ON fact_ev_sales(region_id, year, quarter);

CREATE TABLE fact_charging_infrastructure (
    charger_id VARCHAR(12) PRIMARY KEY,
    region_id VARCHAR(10) NOT NULL,
    city_name VARCHAR(100) NOT NULL,
    year SMALLINT NOT NULL,
    quarter TINYINT NOT NULL,
    charger_count INT NOT NULL,
    fast_charger_count INT NOT NULL,
    slow_charger_count INT NOT NULL,
    dc_fast_count INT NOT NULL,
    average_capacity_kw DECIMAL(8,1) NOT NULL,
    operational_status VARCHAR(30) NOT NULL,
    charger_per_1000_ev DECIMAL(8,2) NOT NULL,
    infrastructure_gap_score DECIMAL(6,1) NOT NULL,
    charging_readiness_score DECIMAL(6,1) NOT NULL,
    CONSTRAINT fk_infra_region FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

CREATE INDEX idx_fact_infra_region_year_q ON fact_charging_infrastructure(region_id, year, quarter);

CREATE TABLE dim_demographics (
    demo_id VARCHAR(12) PRIMARY KEY,
    region_id VARCHAR(10) NOT NULL,
    year SMALLINT NOT NULL,
    population BIGINT NOT NULL,
    urban_population_pct DECIMAL(5,1) NOT NULL,
    population_density INT NOT NULL,
    median_age DECIMAL(4,1) NOT NULL,
    literacy_rate DECIMAL(5,1) NOT NULL,
    working_age_population_pct DECIMAL(5,1) NOT NULL,
    CONSTRAINT fk_demo_region FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

CREATE INDEX idx_demo_region_year ON dim_demographics(region_id, year);

CREATE TABLE fact_economic_data (
    econ_id VARCHAR(12) PRIMARY KEY,
    region_id VARCHAR(10) NOT NULL,
    year SMALLINT NOT NULL,
    gdp_per_capita INT NOT NULL,
    median_household_income INT NOT NULL,
    petrol_price DECIMAL(8,2) NOT NULL,
    electricity_price DECIMAL(8,2) NOT NULL,
    employment_rate DECIMAL(5,1) NOT NULL,
    vehicle_ownership_rate DECIMAL(5,2) NOT NULL,
    affordability_index DECIMAL(5,1) NOT NULL,
    energy_cost_advantage DECIMAL(8,2) NOT NULL,
    CONSTRAINT fk_econ_region FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

CREATE INDEX idx_econ_region_year ON fact_economic_data(region_id, year);

CREATE TABLE dim_policies (
    policy_id VARCHAR(12) PRIMARY KEY,
    region_id VARCHAR(10) NOT NULL,
    policy_type VARCHAR(50) NOT NULL,
    incentive_amount BIGINT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    ev_target_pct DECIMAL(5,1) NOT NULL,
    priority_status VARCHAR(20) NOT NULL,
    policy_description TEXT NOT NULL,
    policy_strength_score DECIMAL(5,1) NOT NULL,
    CONSTRAINT fk_policy_region FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

CREATE INDEX idx_policy_region ON dim_policies(region_id);

CREATE TABLE fact_competitor_presence (
    competitor_id VARCHAR(12) PRIMARY KEY,
    region_id VARCHAR(10) NOT NULL,
    brand_name VARCHAR(50) NOT NULL,
    showroom_count INT NOT NULL,
    market_share_pct DECIMAL(5,2) NOT NULL,
    popular_models VARCHAR(200) NOT NULL,
    service_centers INT NOT NULL,
    CONSTRAINT fk_comp_region FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

CREATE INDEX idx_comp_region_brand ON fact_competitor_presence(region_id, brand_name);

CREATE TABLE fact_environmental_data (
    env_id VARCHAR(12) PRIMARY KEY,
    region_id VARCHAR(10) NOT NULL,
    year SMALLINT NOT NULL,
    aqi_score DECIMAL(6,1) NOT NULL,
    co2_target_pct DECIMAL(5,1) NOT NULL,
    pollution_level VARCHAR(20) NOT NULL,
    carbon_intensity DECIMAL(5,2) NOT NULL,
    green_transition_priority DECIMAL(5,1) NOT NULL,
    CONSTRAINT fk_env_region FOREIGN KEY (region_id) REFERENCES dim_regions(region_id)
);

CREATE INDEX idx_env_region_year ON fact_environmental_data(region_id, year);