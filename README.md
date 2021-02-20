# Pewlet-Hackard-Analysis

## Analysis Overview

Our initital analysis analysis of Pewlett-Packard was astonoshing, we found that a vast number of their employees were soon due to retire. Using an Entity Relationship Diagram (ERD) allowed us to map similar columns within our 6 data tables. With the help of SQL, we were able to make different connections with our HR tables and create new tables within our database, this revealed a complet view of Pewlett-Hackards employees slated to retire. Using our initial analysis, we were able to isolate the individuals who were approaching retirement soon. 

The new table generated has enabled us to be better prepared for the "Silver Tsunami", by setting a plan in motion to provide a mentorship program where the employees slated to retire can train those ready to take a leap in their careers.

In this challenge, I am tasked with digging deeper into this idea of a mentorship program. My analysis will help build a roadmap into this new mentorship program, by taking a deeper look at the title and eligibility of those slated to retire. The combination of the two will help us determine to get the most out of our "Silver" employees. 

## Results

### Retirement Title

- Large sum of Duplicated values in retirement_titles (See Below)

![](Resources/Retirement_titles.png)

- Better Analysis with unique titles; however still shows employees who may not be around.


- Most of our retirng employees are either Senior Engineers or Senior Staff.

![](Resources/retiring_titles.png)

### Employees Eligible for Program

- Our True Targets revealed. We see Exactly who we need to Reach out to; 1550 Employees.

![](Resources/mentorship_eligibilty.png)

## Summary

We will have approxamately 1550 qualified individuals to participate as mentors for our mentorship program. We can see that with the 'mentorship_eligibility.png' file right above.

It does not appear that Pewlett-Hackard has enough qualified individuals for a mentorship program, as the vacancies revealed to us in our retirement titles summary far outways the meer 1550 individuals that we have at our disposal. I would recommend more of a group seminar format for the employees slated to retire, so that those who are ready to fill the posistions can still absorb knowledge from those retiring while allowing our senior leaders to go into a part time role to ease them into retirement. 
