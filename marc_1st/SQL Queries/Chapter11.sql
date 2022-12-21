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
