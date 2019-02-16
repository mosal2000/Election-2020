
DELIMITER $$

CREATE PROCEDURE populate_fec_id ()

BEGIN

DECLARE v_finished INTEGER DEFAULT 0;
DECLARE v_congress_list_id INTEGER;
DECLARE v_fec_id VARCHAR(20);
        
DECLARE congress_list_cur CURSOR FOR 
	select cl.id, hc.fec_candidate_id
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

DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;

OPEN congress_list_cur;


	populate_id: LOOP

	FETCH congress_list_cur INTO v_congress_list_id, v_fec_id;

	IF v_finished = 1 THEN 
	LEAVE populate_id;
	END IF;

	-- update fec_candidate_id
	update us_congress_member
    set fec_candidate_id = v_fec_id
    where id = v_congress_list_id;

	END LOOP populate_id;
 
CLOSE congress_list_cur;

END$$
 
DELIMITER ;