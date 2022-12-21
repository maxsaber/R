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
