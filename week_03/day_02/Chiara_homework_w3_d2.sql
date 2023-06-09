/* Question 1:  (a). Find the first name, last name and team name of employees who are members of teams. */

SELECT 
	a.first_name,
	a.last_name,
	t.name
FROM employees AS a
INNER JOIN teams AS t
ON a.team_id = t.id;

/* (b). Find the first name, last name and team name of employees who are members of teams and are 
 enrolled in the pension scheme. */

SELECT 
	e.first_name,
	e.last_name,
	t.name
FROM employees AS e
INNER JOIN teams AS t
ON e.team_id = t.id
WHERE e.pension_enrol = TRUE;


/*Find the first name, last name and team name of employees who are members of teams, where their team has a charge
 cost greater than 80. */


SELECT 
	e.first_name,
	e.last_name,
	t.name
FROM employees AS e
INNER JOIN teams AS t
ON e.team_id = t.id
WHERE CAST(t.charge_cost AS INT)>80;


/*Question 2:  (a). Get a table of all employees details, together with their local_account_no and local_sort_code, 
if they have them. */


SELECT *
FROM employees AS e
LEFT JOIN pay_details AS pd
ON e.pay_detail_id = pd.id;


/* (b). Amend your query above to also return the name of the team that each employee belongs to.   */

SELECT *,
t.name AS team_name
FROM employees AS e
LEFT JOIN pay_details AS pd
ON e.pay_detail_id = pd.id
LEFT JOIN teams AS t
ON e.team_id = t.id;




/* Question 3: (a). Make a table, which has each employee id along with the team that employee belongs to. */



SELECT 
	e.id AS employee_id,
	t.name AS team_name
FROM employees As e
LEFT JOIN teams AS t
ON e.team_id = t.id;



/*  (b). Breakdown the number of employees in each of the teams.   */

SELECT 
	t.name AS team_name,
	COUNT(e.id) AS number_employees_per_team
FROM employees As e
LEFT JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.name;


/*  (c). Order the table above by so that the teams with the least employees come first.     */


SELECT 
	t.name AS team_name,
	COUNT(e.id) AS number_employees_per_team
FROM employees As e
LEFT JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.name
ORDER BY COUNT(e.id);


/*Question 4: (a). Create a table with the team id, team name and the count of the number of employees in each team. */

SELECT 
	t.id,
	t.name,
	COUNT(e.id)
FROM teams AS t
INNER JOIN employees AS e
ON t.id = e.team_id
GROUP BY t.id;


/* (b). The total_day_charge of a team is defined as the charge_cost of the team multiplied by the number of employees in 
 * the team. Calculate the total_day_charge for each team.   */

SELECT 
	t.id,
	t.name,
	COUNT(e.id),
	CAST(t.charge_cost AS INT)*COUNT(e.id) AS total_day_charge
FROM teams AS t
LEFT JOIN employees AS e
ON t.id = e.team_id
GROUP BY t.id;

/*  (c). How would you amend your query from above to show only those teams with a total_day_charge greater than 5000?  */

SELECT 
	t.id,
	t.name,
	COUNT(e.id),
	CAST(t.charge_cost AS INT)*COUNT(e.id) AS total_day_charge
FROM teams AS t
INNER JOIN employees AS e
ON t.id = e.team_id
GROUP BY t.id
HAVING CAST(t.charge_cost AS INT)*COUNT(e.id) > 5000;


/* Extensions */


/* Question 5:  How many of the employees serve on one or more committees? */



SELECT 
  COUNT(DISTINCT(employee_id)) AS num_employees_on_committees
FROM employees_committees;



/* Question 6: How many of the employees do not serve on a committee?  */


SELECT 
COUNT(e.id)
FROM employees AS e
LEFT JOIN employees_committees AS ec
ON e.id = ec.employee_id
WHERE ec.id IS NULL;


