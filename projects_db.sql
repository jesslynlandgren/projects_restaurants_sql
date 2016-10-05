--1
select * from project,tech;

--2
select * from project left outer join project_uses_tech on project.id = project_uses_tech.project_id;

--3
select * from tech left outer join project_uses_tech on tech.id = project_uses_tech.tech_id;

--4
select
	*
from
	project
left outer join project_uses_tech
	on project.id = project_uses_tech.project_id
left outer join tech
	on project_uses_tech.tech_id = tech.id;

--5
select
	project.name, count(tech.*)
from
	project
left outer join project_uses_tech
	on project.id = project_uses_tech.project_id
left outer join tech
	on project_uses_tech.tech_id = tech.id
group by
	project.name;

--6
select
	tech.name, count(project.*)
from
	tech
left outer join project_uses_tech
	on tech.id = project_uses_tech.tech_id
left outer join project
	on project_uses_tech.project_id = project.id
group by
	tech.name;

--7
select
	project.name, count(tech.*)
from
	project
left outer join project_uses_tech
	on project.id = project_uses_tech.project_id
left outer join tech
	on project_uses_tech.tech_id = tech.id
group by
	project.name
order by
	count(tech.*);

--8
select
	tech.name, count(project.*)
from
	tech
left outer join project_uses_tech
	on tech.id = project_uses_tech.tech_id
left outer join project
	on project_uses_tech.project_id = project.id
group by
	tech.name
order by
	count(project.*);

--9
select
	project.name, count(tech.*)
into
	tech_count
from
	project
left outer join project_uses_tech
	on project.id = project_uses_tech.project_id
left outer join tech
	on project_uses_tech.tech_id = tech.id
group by
	project.name
order by
	count(tech.*);

select avg(count)
from tech_count;

select avg(select
	project.name, count(tech.*)
from
	project
left outer join project_uses_tech
	on project.id = project_uses_tech.project_id
left outer join tech
	on project_uses_tech.tech_id = tech.id
group by
	project.name
order by
	count(tech.*)) techcounts;
