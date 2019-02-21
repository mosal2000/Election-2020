USE election_prediction_db;

# DROP TABLE congressional_district_cbp;

CREATE TABLE us_congressional_district (
	id INT primary key NOT NULL AUTO_INCREMENT,
	state_dist VARCHAR(10), 
    state char(2),
    district char(2)
);

# Need the database to save the results

