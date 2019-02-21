# SQL 1

select 
cl.st_abbrev, cl.district, cl.party, cl.fec_candidate_id, 
cf.*,
dd.*
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

# SQL 2

select 
cl.st_abbrev, cl.district, cl.party,  
cf.Total_Receipt,
cf.Total_Disbursement,
cf.Cash_On_Hand_COP,
cf.Debt_Owed_By_Committee,
cf.Individual_Itemized_Contribution,
cf.Individual_Unitemized_Contribution,
cf.Individual_Contribution,
cf.Other_Committee_Contribution,
cf.Party_Committee_Contribution,
cf.Cand_Contribution,
cf.Total_Contribution,
cf.Transfer_From_Other_Auth_Committee,
cf.Cand_Loan,
cf.Other_Loan,
cf.Total_Loan,
cf.Offsets_To_Operating_Expenditure,
cf.Offsets_To_Fundraising,
cf.Offsets_To_Leagal_Accounting,
cf.Other_Receipts,
cf.Operating_Expenditure,
cf.Exempt_Legal_Accounting_Disbursement,
cf.Fundraising_Disbursement,
cf.Transfer_To_Other_Auth_Committee,
cf.Cand_Loan_Repayment,
cf.Other_Loan_Repayment,
cf.Total_Loan_Repayment,
cf.Individual_Refund,
cf.Party_Committee_Refund,
cf.Other_Committee_Refund,
cf.Total_Contribution_Refund,
cf.Other_Disbursements,
cf.Net_Contribution,
cf.Net_Operating_Expenditure,
cf.Cash_On_Hand_BOP,
cf.Debt_Owe_To_Committee,
dd.*
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
