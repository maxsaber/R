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
