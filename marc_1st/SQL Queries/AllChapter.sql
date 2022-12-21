
# Chapter 4
SELECT 
    hospital_name, address, city, state
FROM
    hospital_general_information
;

SELECT 
    hospital_name, address, city, state
FROM
    hospital_general_information
WHERE
    state = 'CA'
;

SELECT DISTINCT
    hospital_name, hospital_ownership
FROM
    hospital_general_information
WHERE
    hospital_ownership LIKE '%government%'
;

SELECT 
    hospital_general_information.hospital_name,
    hospital_general_information.address,
    hospital_general_information.city,
    hospital_general_information.state,
    readmission_reduction.number_of_readmissions
FROM
    hospital_general_information
        JOIN
    readmission_reduction ON hospital_general_information.provider_id = readmission_reduction.provider_id
;

SELECT 
    hospital_general_information.hospital_name,
    hospital_general_information.address,
    hospital_general_information.city,
    hospital_general_information.state,
    readmission_reduction.number_of_readmissions
FROM
    hospital_general_information
        JOIN
    readmission_reduction ON hospital_general_information.provider_id = readmission_reduction.provider_id
WHERE
    hospital_general_information.state = 'CA'
;

SELECT 
    hospital_general_information.hospital_name,
    hospital_general_information.address,
    hospital_general_information.city,
    hospital_general_information.state,
    readmission_reduction.number_of_readmissions,
    hcahps.hcahps_question,
    hcahps.hcahps_answer_percent
FROM
    hospital_general_information
        JOIN
    readmission_reduction ON hospital_general_information.provider_id = readmission_reduction.provider_id
        JOIN
    hcahps ON hospital_general_information.provider_id = hcahps.provider_id
WHERE
    hospital_general_information.state = 'CA'
;

SELECT 
    state, hospital_name
FROM
    hospital_general_information
;

SELECT 
    state, COUNT(hospital_name)
FROM
    hospital_general_information
GROUP BY state
;

SELECT 
    state, COUNT(hospital_name)
FROM
    hospital_general_information
GROUP BY state
HAVING COUNT(hospital_name) > 20
;


# Chapter 6
SELECT 
    ipps_2011.*,
    hospital_general_information.hospital_name,
    hospital_general_information.state
FROM
    ipps_2011
        JOIN
    hospital_general_information ON ipps_2011.provider_id = hospital_general_information.provider_id;

SELECT 
    ipps_2012.*,
    hospital_general_information.hospital_name,
    hospital_general_information.state
FROM
    ipps_2012
        JOIN
    hospital_general_information ON ipps_2012.provider_id = hospital_general_information.provider_id;


# Chapter 7
SELECT DISTINCT
    national_downloadable_file.group_practice_PAC_id,
    national_downloadable_file.number_of_group_practice_members,
    ep_provider_paid_ehr.provider_npi,
    zip_to_cbsa.cbsa
FROM
    national_downloadable_file
        JOIN
    provider_intersect ON 
	national_downloadable_file.national_downloadable_file_id = 
	provider_intersect.national_downloadable_file_id
        LEFT JOIN
    ep_provider_paid_ehr ON 
	provider_intersect.ep_provider_paid_ehr_id = 
	ep_provider_paid_ehr.ep_provider_paid_ehr_id
		JOIN
    zipcode_table ON 
	national_downloadable_file.zipcode = 
	zipcode_table.zipcode
        LEFT JOIN
    zip_to_cbsa ON 
	zipcode_table.zipcode = zip_to_cbsa.zipcode
	WHERE national_downloadable_file.group_practice_PAC_id<>'NA';


# Chapter 8
SELECT 
    state_geocodes.state,
    state_geocodes.county_name,
    daily_hazardous_air_pollutants.parameter_name,
    AVG(daily_hazardous_air_pollutants.arithmetic_mean),
    measures_of_birth_and_death.lbw,
    measures_of_birth_and_death.vlbw,
    measures_of_birth_and_death.premature
FROM
    state_geocodes
        JOIN
    daily_hazardous_air_pollutants ON daily_hazardous_air_pollutants.state_geocodes_id = state_geocodes.state_geocodes_id
        JOIN
    measures_of_birth_and_death ON measures_of_birth_and_death.state_geocodes_id = state_geocodes.state_geocodes_id
WHERE
    daily_hazardous_air_pollutants.parameter_name LIKE '%Lead%'
        AND daily_hazardous_air_pollutants.arithmetic_mean > 0
GROUP BY state_geocodes.county_code;                 


# Chapter 9
SELECT 
    hospital_general_information.provider_id,
    readmissions_complications_deaths.measure_name,
    readmissions_complications_deaths.compared_to_national,
    hospital_general_information.emergency_services
FROM
    hospital_general_information
        JOIN
    readmissions_complications_deaths ON hospital_general_information.provider_id = readmissions_complications_deaths.provider_id
WHERE
    measure_id = 'READM_30_HF'
        AND (readmissions_complications_deaths.compared_to_national = 'Better than U.S. National Rate'
        OR readmissions_complications_deaths.compared_to_national = 'Worse than U.S. National Rate');


# Chapter 10
SELECT 
    hospital_general_information.provider_id,
    medicare_hospital_spending_per_patient.measure_id,
    medicare_hospital_spending_per_patient.score,
    hospital_value_based_purchasing.unweighed_patient_experience_of_care_domain_score
FROM
    hospital_general_information
        JOIN
    medicare_hospital_spending_per_patient ON hospital_general_information.provider_id = 
	medicare_hospital_spending_per_patient.provider_id
        JOIN
    hospital_value_based_purchasing ON hospital_general_information.provider_id = 
	hospital_value_based_purchasing.provider_id;




# Chapter 11
SELECT 
    hospital_general_information.hospital_name,
    hospital_general_information.state,
    readmission_reduction.measure_name,
    number_of_discharges,
    number_of_readmissions,
    excess_readmission_ratio,
    regions.region_name
FROM
    hospital_general_information
        JOIN
    readmission_reduction ON hospital_general_information.provider_id = readmission_reduction.provider_id
        JOIN
    regions ON hospital_general_information.state_code = regions.state_code
WHERE
    readmission_reduction.number_of_discharges > 0
        AND readmission_reduction.number_of_readmissions > 0;


# Chapter 12
SELECT DISTINCT
    provnum,
    overall_rating,
    survey_rating,
    staffing_rating,
    RN_staffing_rating,
    quality_rating,
    ssf,
    restot,
    ownership
FROM
    nursing_home_provider_info;



# Chapter 13
SELECT 
    nursing_home_provider_info.provnum,
    nursing_home_quality_measures.msr_cd,
    nursing_home_quality_measures.msr_descr,
    nursing_home_quality_measures.measure_score_3qtr_avg AS avg_value,
    nursing_home_provider_info.ownership,
    nursing_home_provider_info.inhosp,
    nursing_home_provider_info.adj_total,
    nursing_home_provider_info.adj_rn
FROM
    nursing_home_quality_measures
        JOIN
    nursing_home_provider_info ON nursing_home_quality_measures.nursing_home_provider_info_id = nursing_home_provider_info.nursing_home_provider_info_id
WHERE
    nursing_home_quality_measures.msr_cd = 403
        AND nursing_home_quality_measures.measure_score_3qtr_avg > 0
        AND nursing_home_provider_info.adj_total > 0;


# Chapter 14
SELECT 
    hospital_general_information.provider_id,
    timely_and_effective_care.measure_name,
    timely_and_effective_care.score,
    hcahps.hcahps_question,
    hcahps.hcahps_answer_percent,
    hcahps.hcahps_measure_id
FROM
    timely_and_effective_care
JOIN
hospital_general_information ON timely_and_effective_care.provider_id = hospital_general_information.provider_id
JOIN
    hcahps ON hospital_general_information.provider_id = hcahps.provider_id
WHERE
    hcahps.hcahps_measure_id LIKE '%H_RECMND_%'
        AND timely_and_effective_care.measure_id = 'ED_2b'
		AND timely_and_effective_care.score>0
		AND hcahps.hcahps_answer_percent>0;


# Chapter 15
SELECT 
    hospital_general_information.provider_id,
    hospital_general_information.hospital_ownership,
    hospital_general_information.emergency_services,
    hospital_value_based_purchasing.unweighted_normalized_clinical_process_of_care_domain_score AS 'cpcd',
    hospital_value_based_purchasing.unweighed_patient_experience_of_care_domain_score AS 'pecd',
    medicare_hospital_spending_per_patient.score AS 'hsbp',
    readmissions_complications_deaths.score AS 'readmission',
    hospital_associated_infection.compared_to_national AS 'c_diff_compared'
FROM
    hospital_general_information
        JOIN
    hospital_associated_infection ON hospital_general_information.provider_id = hospital_associated_infection.provider_id
        JOIN
    hospital_value_based_purchasing ON hospital_general_information.provider_id = hospital_value_based_purchasing.provider_id
        JOIN
    medicare_hospital_spending_per_patient ON hospital_general_information.provider_id = medicare_hospital_spending_per_patient.provider_id
        JOIN
    readmissions_complications_deaths ON hospital_general_information.provider_id = readmissions_complications_deaths.provider_id
WHERE
    hospital_associated_infection.measure_name = 'C.diff Observed Cases'
        AND hospital_associated_infection.compared_to_national <> ''
        AND medicare_hospital_spending_per_patient.measure_id = 'MSPB_1'
        AND readmissions_complications_deaths.measure_id = 'READM_30_HOSP_WIDE'
        AND (hospital_associated_infection.compared_to_national = 'Better than the U.S. National Benchmark'
        OR hospital_associated_infection.compared_to_national = 'Worse than the U.S. National Benchmark');


# Chapter 16
SELECT 
    population_size,
    poverty_rate,
    mammogram_rate,
    uninsured_rate,
    prim_care_phys_rate,
    community_health_center_ind    
FROM
    measures_of_birth_and_death;



