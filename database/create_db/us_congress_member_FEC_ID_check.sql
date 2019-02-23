SELECT * FROM election_prediction_db.us_congress_member
where congress_num = 116;

SELECT * FROM election_prediction_db.us_congress_member
where congress_num = 116 and fec_candidate_id is null;

select cl.id, cl.name, cl.state, cl.st_abbrev, cl.district, hc.fec_candidate_id
FROM election_prediction_db.us_congress_member cl
left join house_candidate hc on (hc.clean_name = cl.name and hc.office_state = cl.st_abbrev and hc.district = cl.district)
where cl.congress_num = 116 and hc.fec_candidate_id is null
order by cl.st_abbrev, cl.district;

select cl.id, cl.name, cl.state, cl.st_abbrev, cl.district, hc.fec_candidate_id
FROM election_prediction_db.us_congress_member cl
left join house_candidate hc on (
	(SUBSTRING_INDEX(hc.clean_name, ' ', -1) = SUBSTRING_INDEX(cl.name, ' ', -1)
      or SUBSTRING_INDEX(hc.clean_name, ' ', 1) = SUBSTRING_INDEX(cl.name, ' ', 1)
      or SUBSTRING_INDEX(hc.clean_name, ' ', 2) = SUBSTRING_INDEX(cl.name, ' ', 2)
    )
    and hc.office_state = cl.st_abbrev 
    and hc.district = cl.district
    )
where cl.congress_num = 116 and hc.fec_candidate_id is null
order by cl.st_abbrev, cl.district;

select cl.id, cl.name, cl.state, cl.st_abbrev, cl.district, hc.fec_candidate_id
FROM election_prediction_db.us_congress_member cl
left join house_candidate hc on (
	(SUBSTRING_INDEX(hc.clean_name, ' ', -1) = SUBSTRING_INDEX(cl.name, ' ', -1)
      or SUBSTRING_INDEX(hc.clean_name, ' ', 1) = SUBSTRING_INDEX(cl.name, ' ', 1)
      or SUBSTRING_INDEX(hc.clean_name, ' ', 2) = SUBSTRING_INDEX(cl.name, ' ', 2)
    )
    and hc.office_state = cl.st_abbrev 
    and hc.district = cl.district
    )
where cl.congress_num = 116 
order by cl.st_abbrev, cl.district;

