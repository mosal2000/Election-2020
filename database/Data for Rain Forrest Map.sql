select 
cl.st_abbrev, cl.district, cl.party, fi.fips, fi.STATEFP, cl.district, cde.district CD115FP, CONCAT(fi.STATEFP, cde.district) GEOID, 
dd.Public_transportation_excluding_taxicab,
dd.Less_than_50_000,
dd.American,
dd.Mining__quarrying__and_oil_and_gas_extraction2
FROM election_prediction_db.us_congress_member cl
left join house_candidate hc on hc.fec_candidate_id = cl.fec_candidate_id  
left join candidate_finance cf on hc.fec_candidate_id = cf.fec_candidate_id  
left join us_congressional_district cde on (
	cde.state = cl.st_abbrev
    and CAST(cde.district AS DECIMAL(7,0)) = cl.district
    )
left join fips fi on fi.postal_code = cl.st_abbrev
left join district_demographic dd on dd.state_dist = cde.state_dist
where cl.congress_num = 116 
order by cl.st_abbrev, cl.district;