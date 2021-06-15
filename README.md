# Pewlet-Hackard-Analysis

## Analysis Overview

In this project, I will be exploring HR data for an aging software company called Pewlett-Hackard. The data used for this task originated from 6 different CSV files, the tables are from the companies HR database. After analyzing the data files and identifying the needed tables, I created an entity relationship diagram (ERD) in order map out the relationships of these tables. Using primary keys and foreign keys, I was able to find clear relationships between the data tables, and plan potential combinations of the tables in order to perform proper analysis on my database. After creating my database, I was able to query the data, this revealed a complete view of Pewlett-Hackards employees slated to retire. 

The new tables generated enabled me to demonstrate just how massive this "Silver Tsunami" was. Action was immediately taken, as a plan was set in motion to provide a mentorship program where the employees slated to retire can train those ready to make a leap in their careers.

In this challenge, I am tasked with digging deeper into the idea of a mentorship program by finding open positions and employees that can mentor. My analysis helped build a roadmap into this new mentorship program and positions that would be soon opened, by taking a deeper look at the positions of those slated to retire, as well as their eligibility to participate in this mentorship program. The combination of the two will help Pewlett-Hackard in easing the blow of the retirement wave by creating a smoother transition through training.

## Key Points by Table

### Retirement Title

- Large sum of duplicate values in the "retirement_titles" table. (See Below)

![](Resources/Retirement_titles.png)

- New table "unique_titles" created through query.
- The "unique_titles" table alleviates the issue of duplicates in the "retirement_titles" table.
  - The table still however shows employees who may have already retired.

- Most of our retiring employees are either Senior Engineers or Senior Staff.

![](Resources/retiring_titles.png)

### Employees Eligible for Program

- Final Query reveals those currently in the company based on standard retirement age. 
  - 1550 retiring employees are still active.

![](Resources/mentorship_eligibilty.png)

## Summary

We will have approxamately 1550 qualified individuals to participate as mentors for our mentorship program. We can see that with the 'mentorship_eligibility.png' file right above.

It does not appear that Pewlett-Hackard has enough qualified individuals for a direct peer-to-peer mentorship program, as the vacancies revealed to us in our retirement titles summary far outways the meer 1550 individuals that we have at our disposal. I would recommend more of a group mentorship format for the employees slated to retire, so that those who are ready to fill the posistions can still absorb knowledge from those retiring while allowing our senior leaders to go into a part time role to ease them into retirement. 
