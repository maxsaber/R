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
            
