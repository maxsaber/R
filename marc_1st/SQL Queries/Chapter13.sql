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

