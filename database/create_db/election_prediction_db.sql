
DROP DATABASE IF EXISTS election_prediction_db;
CREATE DATABASE election_prediction_db;
USE election_prediction_db;

CREATE TABLE house_candidate (
	fec_candidate_id VARCHAR(20) primary key, 
	name varchar(100),
	party varchar(30), 
	status char(1),
	address_one varchar(100),
	address_two varchar(100),
    city varchar(50),
	state char(2),
	zip char(5),
	fec_committee_id varchar(10),
	cycle int,
	cand_status char(1),
	office_state char(2),
	district int,
	clean_name varchar(100), 
	url varchar(100),
	crp_id varchar(20),
	google_entity_id varchar(20)
);

CREATE TABLE candidate_finance (
	fec_candidate_id VARCHAR(20) primary key,
	cand_office char(1),
	total_receipt float,
	total_disbursement float,
	cash_on_hand_cop float,
	debt_owed_by_committee float,
	individual_itemized_contribution float,
	individual_unitemized_contribution float,
	individual_contribution float,
	other_committee_contribution float,
	party_committee_contribution float,
	cand_contribution float,
	total_contribution float,
	transfer_from_other_auth_committee float,
	cand_loan float,
	other_loan float,
	total_loan float,
	offsets_to_operating_expenditure float,
	offsets_to_fundraising float,
	offsets_to_leagal_accounting float,
	other_receipts float,
	operating_expenditure float,
	exempt_legal_accounting_disbursement float,
	fundraising_disbursement float,
	transfer_to_other_auth_committee float,
	cand_loan_repayment float,
	other_loan_repayment float,
	total_loan_repayment float,
	individual_refund float,
	party_committee_refund float,
	other_committee_refund float,
	total_contribution_refund float,
	other_disbursements float,
	net_contribution float,
	net_operating_expenditure float,
	cash_on_hand_bop float,
	debt_owe_to_committee float
);

CREATE TABLE us_congress (
	id	INT primary key NOT NULL,
    congress_name varchar(70),
    election_year INT,
    start_date date,
    end_date date
);

#DROP TABLE us_congress_list;

CREATE TABLE us_congress_member (
	id INT primary key NOT NULL AUTO_INCREMENT,
	congress_num INT,
	election_year INT,
    state varchar(50),
    st_abbrev char(2),
    district char(2),
	name varchar(100), 
	party varchar(30),
	fec_candidate_id VARCHAR(20)
);

#DROP TABLE fips;

CREATE TABLE fips (
	id INT primary key NOT NULL AUTO_INCREMENT,
    state varchar(50),
    fips INT,
    STATEFP char(2),
    postal_code char(2)
);

#DROP TABLE district_demographic;

CREATE TABLE district_demographic (
	id INT primary key NOT NULL AUTO_INCREMENT,
    Total_population INT, Male INT, Female INT, Under_5_years INT, 5_to_9_years INT, 
	10_to_14_years INT, 15_to_19_years INT, 20_to_24_years INT, 25_to_34_years INT, 
	35_to_44_years INT, 45_to_54_years INT, 55_to_59_years INT, 60_to_64_years INT, 
	65_to_74_years INT, 75_to_84_years INT, 85_years_and_over INT, Median_age_years FLOAT, 
	18_years_and_over1 INT, 65_years_and_over1 INT, One_race INT, White INT, 
	Black_or_African_American INT, American_Indian_and_Alaska_Native INT, Asian INT, 
	Native_Hawaiian_and_Other_Pacific_Islander INT, Some_other_race INT, 
	Two_or_more_races INT, Hispanic_or_Latino_of_any_race INT, Mexican INT, 
	Puerto_Rican INT, Cuban INT, Other_Hispanic_or_Latino INT, 
	Not_Hispanic_or_Latino INT, Native INT, Born_in_United_States INT, 
	State_of_residence INT, Different_state1 INT, 
	Born_in_PR__US_Is_areas_or_abroad_to_US_parents INT, 
	Foreign_born INT, American INT, Arab INT, Czech INT, Danish INT, Dutch INT, English INT, 
	French_except_Basque INT, French_Canadian INT, German INT, Greek INT, Hungarian INT, 
	Irish INT, Italian INT, Lithuanian INT, Norwegian INT, Polish INT, Portuguese INT, 
	Russian INT, ScotchIrish INT, Scottish INT, Slovak INT, Subsaharan_African INT, 
	Swedish INT, Swiss INT, Ukrainian INT, Welsh INT, 
	West_Indian_excluding_Hispanic_origin_groups INT, 
	Civilian_population_18_years_and_over INT, Civilian_veterans INT, 
	Total_civilian_noninstitutionalized_population INT, With_a_disability1 INT, 
	Under_18_years1 INT, With_a_disability2 INT, 18_to_64_years INT, With_a_disability3 INT, 
	65_years_and_over2 INT, With_a_disability4 INT, Population_1_year_and_over INT, 
	Same_house INT, Different_house_in_the_US INT, Same_county INT, 
	Different_county INT, Same_state INT, Different_state2 INT, Abroad INT, 
	Population_16_years_and_over INT, In_labor_force INT, Civilian_labor_force INT, 
	Employed INT, Unemployed INT, Armed_Forces INT, Not_in_labor_force INT, 
	Unemployment_Rate FLOAT, Workers_16_years_and_over INT, 
	Car__truck__or_van__drove_alone INT, Car__truck__or_van__carpooled INT, 
	Public_transportation_excluding_taxicab INT, Walked INT, Other_means INT, 
	Worked_at_home INT, Mean_travel_time_to_work_minutes FLOAT, 
	Management__business__science__and_arts_occupations INT, 
	Service_occupations INT, Sales_and_office_occupations INT, 
	Natural_resources__construction__and_maintenance_occupations INT, 
	Production__transportation__and_material_moving_occupations INT, 
	Agriculture__forestry__fishing_and_hunting__and_mining INT, Construction1 INT, 
	Manufacturing1 INT, Wholesale_trade1 INT, Retail_trade1 INT, 
	Transportation_and_warehousing__and_utilities1 INT, Information1 INT, 
	Finance_and_insurance__and_real_estate_and_rental_and_leasing INT, 
	Prof__scientific__and_mngmnt__and_admin_and_waste_mngmnt_ser INT, 
	Educational_services__and_health_care_and_social_assistance INT, 
	Arts_Entmt_and_recreation_and_accommodation_and_food_services INT, 
	Other_services__except_public_administration INT, Public_administration INT, 
	Private_wage_and_salary_workers INT, Government_workers INT, 
	Selfemployed_in_own_not_incorporated_business_workers INT, 
	Unpaid_family_workers INT, Total_housing_units INT, Occupied_housing_units INT, 
	Vacant_housing_units INT, Homeowner_vacancy_rate FLOAT, Rental_vacancy_rate FLOAT, 
	Owneroccupied INT, Renteroccupied INT, 
	Average_household_size_of_owneroccupied_unit FLOAT, 
	Average_household_size_of_renteroccupied_unit FLOAT, Moved_in_2015_or_later INT, 
	Moved_in_2010_to_2014 INT, Moved_in_2000_to_2009 INT, Moved_in_1990_to_1999 INT, 
	Moved_in_1980_to_1989 INT, Moved_in_1979_and_earlier INT, Less_than_50_000 INT, 
	50_000_to_99_999 INT, 100_000_to_149_999a INT, 150_000_to_199_999 INT, 
	200_000_to_299_999 INT, 300_000_to_499_999 INT, 500_000_to_999_999 INT, 
	1_000_000_or_more INT, Median_dollars1 INT, Housing_units_with_a_mortgage INT, 
	Housing_units_without_a_mortgage INT, Less_than_500a INT, 500_to_999a INT, 
	1_000_to_1_499a INT, 1_500_to_1_999a INT, 2_000_to_2_499a INT, 2_500_to_2_999a INT, 
	3_000_or_more1 INT, Median_dollars2 INT, Less_than_250 INT, 250_to_399 INT, 
	400_to_599 INT, 600_to_799 INT, 800_to_999 INT, 1_000_or_more INT, Median_dollars3 INT, 
	Occupied_units_paying_rent INT, Less_than_500b INT, 500_to_999b INT, 
	1_000_to_1_499b INT, 1_500_to_1_999b INT, 2_000_to_2_499b INT, 2_500_to_2_999b INT, 
	3_000_or_more2 INT, Median_dollars4 INT, No_rent_paid INT, Less_than_10_000 INT, 
	10_000_to_14_999 INT, 15_000_to_24_999 INT, 25_000_to_34_999 INT, 
	35_000_to_49_999 INT, 50_000_to_74_999 INT, 75_000_to_99_999 INT, 
	100_000_to_149_999b INT, 150_000_to_199_000 INT, 200_000_or_more INT, 
	Median_household_income_dollars INT, Mean_household_income_dollars INT, 
	With_health_insurance_coverage INT, With_private_health_insurance INT, 
	With_public_coverage INT, No_health_insurance_coverage1 INT, 
	Civilian_noninstitutionalized_population_under_19_years INT, 
	No_health_insurance_coverage2 INT, All_families FLOAT, 
	With_related_children_of_the_householder_under_18_years1 INT, 
	With_related_children_of_the_householder_under_5_years_only1 INT, 
	Married_couple_families INT, 
	With_related_children_of_the_householder_under_18_years2 INT, 
	With_related_children_of_the_householder_under_5_years_only2 INT, 
	Families_with_female_householder__no_husband_present INT, 
	With_related_children_of_the_householder_under_18_years3 INT, 
	With_related_children_of_the_householder_under_5_years_only3 INT, 
	All_people INT, Under_18_years2 INT, 
	Related_children_of_the_householder_under_18_years INT, 
	Related_children_of_the_householder_under_5_years INT, 
	Related_children_of_the_householder_5_to_17_years INT, 18_years_and_over2 INT, 
	65_years_and_over3 INT, People_in_families INT, 
	Unrelated_individuals_15_years_and_over INT, 
	Population_3_years_and_over_enrolled_in_school INT, 
	Nursery_school__preschool INT, Kindergarten INT, Elementary_school_grades_18 INT, 
	High_school_grades_912 INT, College_or_graduate_school INT, 
	Population_25_years_and_over INT, Less_than_9th_grade INT, 
	9th_to_12th_grade__no_diploma INT, 
	High_school_graduate_includes_equivalency INT, Some_college__no_degree INT, 
	Associate_s_degree INT, Bachelor_s_degree INT, 
	Graduate_or_professional_degree INT, 
	Percent_high_school_graduate_or_higher FLOAT, 
	Percent_bachelor_s_degree_or_higher FLOAT, Title varchar(50), Total_for_all_sectors1 INT, 
	Agriculture__forestry__fishing_and_hunting1 INT, 
	Mining__quarrying__and_oil_and_gas_extraction1 INT, Utilities1 INT, 
	Construction2 INT, Manufacturing2 INT, Wholesale_trade2 INT, Retail_trade2 INT, 
	Transportation_and_warehousing1 INT, Information2 INT, Finance_and_insurance1 INT, 
	Real_estate_and_rental_and_leasing1 INT, 
	Professional__scientific__and_technical_services1 INT, 
	Management_of_companies_and_enterprises1 INT, 
	Admin_and_support_and_waste_mngmt_and_remediation_services1 INT, 
	Educational_services1 INT, Health_care_and_social_assistance1 INT, 
	Arts__entertainment__and_recreation1 INT, Accommodation_and_food_services1 INT, 
	Other_services_except_public_administration1 INT, Industries_not_classified1 INT, 
	Total_for_all_sectors2 INT, Agriculture__forestry__fishing_and_hunting2 INT, 
	Mining__quarrying__and_oil_and_gas_extraction2 INT, Utilities2 INT, 
	Construction3 INT, Manufacturing3 INT, Wholesale_trade3 INT, Retail_trade3 INT, 
	Transportation_and_warehousing2 INT, Information3 INT, Finance_and_insurance2 INT, 
	Real_estate_and_rental_and_leasing2 INT, 
	Professional__scientific__and_technical_services2 INT, 
	Management_of_companies_and_enterprises2 INT, 
	Admin_and_support_and_waste_mngmt_and_remediation_services2 INT, 
	Educational_services2 INT, Health_care_and_social_assistance2 INT, 
	Arts__entertainment__and_recreation2 INT, Accommodation_and_food_services2 INT, 
	Other_services_except_public_administration2 INT, Industries_not_classified2 INT, 
	Total_for_all_sectors3 INT, Agriculture__forestry__fishing_and_hunting3 INT, 
	Mining__quarrying__and_oil_and_gas_extraction3 INT, Utilities3 INT, 
	Construction4 INT, Manufacturing4 INT, Wholesale_trade4 INT, Retail_trade4 INT, 
	Transportation_and_warehousing3 INT, Information4 INT, Finance_and_insurance3 INT, 
	Real_estate_and_rental_and_leasing3 INT, 
	Professional__scientific__and_technical_services3 INT, 
	Management_of_companies_and_enterprises3 INT, 
	Admin_and_support_and_waste_mngmt_and_remediation_services3 INT, 
	Educational_services3 INT, Health_care_and_social_assistance3 INT, 
	Arts__entertainment__and_recreation3 INT, Accommodation_and_food_services3 INT, 
	Other_services_except_public_administration3 INT, Industries_not_classified3 INT, 
    Industries_not_classified4 INT,
	state_dist varchar(10)
);

