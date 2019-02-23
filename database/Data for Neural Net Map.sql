select 
cl.st_abbrev, cl.district, cl.party, fi.fips, fi.STATEFP, cl.district, cde.district CD115FP, CONCAT(fi.STATEFP, cde.district) GEOID, 
nn_raw.Predicted_Party Raw_Predicted_Party, nn_raw.Probability_of_DEM Raw_Probability_of_DEM, 
nn_raw.Probability_of_REP Raw_Probability_of_REP, nn_raw.Actual_Winning_Party Raw_Actual_Winning_Party,
nn_restrict.Predicted_Party_r Restr_Predicted_Party_r, nn_restrict.Probability_of_DEM_r Restr_Probability_of_DEM_r, 
nn_restrict.Probability_of_REP_r Restr_Probability_of_REP_r, nn_restrict.Actual_Winning_Party Restr_Probability_of_REP_r
FROM election_prediction_db.us_congress_member cl
left join us_congressional_district cde on (
	cde.state = cl.st_abbrev
    and CAST(cde.district AS DECIMAL(7,0)) = cl.district
    )
left join fips fi on fi.postal_code = cl.st_abbrev
left join neural_net_raw_output nn_raw on nn_raw.state_dist = cde.state_dist
left join neural_net_restricted_output nn_restrict on nn_restrict.state_dist = cde.state_dist
where cl.congress_num = 116 
order by cl.st_abbrev, cl.district;