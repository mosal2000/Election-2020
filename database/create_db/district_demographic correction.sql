SELECT id  FROM election_prediction_db.district_demographic
where SUBSTRING(state_dist, 1, 2) in ('AK', 'DE', 'MT', 'ND', 'SD', 'VT', 'WY')
;

SELECT state_dist, concat(SUBSTRING(state_dist, 1, 4), '0')  FROM election_prediction_db.district_demographic
where SUBSTRING(state_dist, 1, 2) in ('AK', 'DE', 'MT', 'ND', 'SD', 'VT', 'WY')
;

SELECT id  FROM election_prediction_db.district_demographic
where SUBSTRING(state_dist, 1, 2) in ('AK', 'DE', 'MT', 'ND', 'SD', 'VT', 'WY')
;

update election_prediction_db.district_demographic
set state_dist = concat(SUBSTRING(state_dist, 1, 4), '0')
where id in (8, 87, 233, 298, 352, 402, 435);
