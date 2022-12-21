
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
