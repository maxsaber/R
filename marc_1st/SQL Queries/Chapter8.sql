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
