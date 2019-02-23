#us_congress_member
CALL populate_fec_id ();


# Tony Cárdenas
select id from us_congress_member where congress_num = 116 and name = 'Tony Cárdenas' and st_abbrev = 'CA' and district = 29;

update us_congress_member
set fec_candidate_id = 'H2CA28113'
where id = 50;

# Joseph P. Kennedy III
select id from us_congress_member where congress_num = 116 and name = 'Joseph P. Kennedy III' and st_abbrev = 'MA' and district = 4;

update us_congress_member
set fec_candidate_id = 'H2MA04073'
where id = 193;

# Lacy Clay
select id from us_congress_member where congress_num = 116 and name = 'Lacy Clay' and st_abbrev = 'MO' and district = 1;

update us_congress_member
set fec_candidate_id = 'H0MO01066'
where id = 225;

# Tim Ryan
select id from us_congress_member where congress_num = 116 and name = 'Tim Ryan' and st_abbrev = 'OH' and district = 13;

update us_congress_member
set fec_candidate_id = 'H2OH17109'
where id = 311;

# Susan Wild
select id from us_congress_member where congress_num = 116 and name = 'Susan Wild' and st_abbrev = 'PA' and district = 7;

update us_congress_member
set fec_candidate_id = 'H8PA15229'
where id = 331;

select * from us_congress_member where congress_num = 116 and fec_candidate_id is null;

update us_congress_member 
set name = 'TBD', party = 'TBD'
where id = 293;

SELECT * FROM election_prediction_db.us_congress_member
where congress_num = 116;

SELECT * FROM election_prediction_db.us_congress_member
where congress_num = 116 and fec_candidate_id is null;
