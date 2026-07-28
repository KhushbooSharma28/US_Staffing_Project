create database us_staffing;
use us_staffing;
select * from staffing_data;
ALTER TABLE staffing_data
MODIFY COLUMN submission_date DATE;
#How many candidates submitted on c2c?
select count(candidate_id) from staffing_data where job_type = 'C2C' 
GROUP BY job_type;

#Give me the names of the candidates who rejected after interviewed 
Select candidate_name, interview_date from staffing_data where interview_date != "No Interview";

#How many placements Rahul Mehta had in 2025?
select BDM_name , count(*) as total_placements from staffing_data where BDM_name = 'Rahul Mehta' AND candidate_status = 'joined';

#what is the total revenue ?
select sum(bill_rate) as total_revenue from staffing_data WHERE candidate_status = 'joined' ;
#revenue is the amount which client pays without dedcution. 

#what is the gross margin ?
select sum(margin) as gross_margin from staffing_data WHERE candidate_status = 'joined';

#Which BDM generated the highest revenue?
select BDM_name , sum(bill_rate) as total_revenue  from staffing_data 
where candidate_status = 'joined' group by BDM_name order by total_revenue DESC limit 1;

#How many placements Khushboo Sharma had in 2025?
select BDM_name , count(*) as total_placements from staffing_data where BDM_name = 'Khushboo Sharma' AND candidate_status = 'joined';

#Gross margin from each BDM?
select BDM_name , sum(margin) as total_GM from staffing_data where candidate_status = 'joined' 
group by BDM_name order by total_GM desc ;
#Gross margin from each recruiter?
select recruiter , sum(margin) as total_GM from staffing_data where candidate_status = 'joined' 
group by recruiter order by total_GM desc ;

#Gross margin from each prime_vendor?
select prime_vendor, sum(margin) as total_gm from staffing_data where candidate_status = 'joined'
group by prime_vendor;

#which client is giving best business ?
select end_client , sum(bill_rate) as total_profit from staffing_data where candidate_status = 'joined'
group by end_client order by total_profit desc limit 1;

#Which client hired the most candidates?
select end_client , count(*) as total_candidates from staffing_data where candidate_status = 'joined'
group by end_client order by total_candidates desc limit 1 ;

#name the candidates who are on w2?
select candidate_name , job_type from staffing_data where job_type = 'W2';

# how many candidates are on 1099 ?
select count(*) as num_of_candidates from staffing_data where job_type = '1099' group by job_type;

#Name unique recruiters are there?
select DISTINCT recruiter as num_of_recruiters from staffing_data;

#Which BDM handled the most clients?
select BDM_name , count(DISTINCT end_client) as total_clients from staffing_data group by BDM_name order by total_clients desc;

#Which job category generates the highest revenue?
select job_category , sum(bill_rate) as revenue from staffing_data group by job_category order by revenue desc limit 1;

