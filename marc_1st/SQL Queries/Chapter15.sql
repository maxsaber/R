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
