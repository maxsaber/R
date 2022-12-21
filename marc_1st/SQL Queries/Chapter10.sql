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
