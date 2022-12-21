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
