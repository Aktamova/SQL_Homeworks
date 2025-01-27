use W3Resource

-- task 1
select v.venue_name, c.city 
from soccer.soccer_venue as v
join soccer.soccer_city as c
on v.city_id = c.city_id
join SOCCER.match_mast as m 
on m.venue_id = v.venue_id
where m.play_stage = 'F'


-- task 2
select match_no, country_name, goal_score 
from SOCCER.match_details as d
join SOCCER.soccer_country as c
on d.team_id = c.country_id
where decided_by = 'N'


-- task 3
select player_name, count(*) as goal_number, country_name 
from SOCCER.goal_details as d
join SOCCER.player_mast as p
on d.player_id = p.player_id
join SOCCER.soccer_country as c
on p.team_id = c.country_id
where goal_schedule = 'NT'
group by player_name, country_name 
order by goal_number desc


-- task 4
select top 1 player_name, country_name, count(player_name) as [count]
from SOCCER.goal_details as d
join SOCCER.player_mast as m
on d.player_id = m.player_id
join SOCCER.soccer_country as c
on m.team_id = c.country_id
group by country_name, player_name
order by [count] desc


-- task 5 
select player_name, jersey_no, play_stage
from SOCCER.goal_details as d
join SOCCER.player_mast as m
on d.player_id = m.player_id
join SOCCER.soccer_country as c
on c.country_id = m.team_id
where d.play_stage = 'F'

select * from soccer.goal_details
where player_id = 160319


-- task 6
select country_name
from SOCCER.soccer_country as co
join SOCCER. soccer_city as ct
on co.country_id = ct.country_id
join SOCCER.soccer_venue as v
on v.city_id = ct.city_id
group by country_name


-- task 7
select player_name, jersey_no, country_name, goal_time, play_stage, goal_schedule, goal_half
from soccer.soccer_country as c
join SOCCER.player_mast as m on c.country_id = m.team_id
join SOCCER.goal_details as d on m.player_id = d.player_id
where goal_id = 1 


-- task 8
select referee_name, country_name 
from SOCCER.soccer_country as c
join SOCCER.referee_mast as r on c.country_id = r.country_id
join SOCCER.match_mast as m on m.referee_id = r.referee_id
where match_no = 1


-- task 9
select referee_name, country_name
from SOCCER.soccer_country as c
join SOCCER.referee_mast as r on c.country_id = r.country_id
join SOCCER.match_mast as m on m.referee_id = r.referee_id
where play_stage = 'F'


-- task 10
select ass_ref_name, country_name
from SOCCER.asst_referee_mast as a
join SOCCER.soccer_country as c on a.country_id = c.country_id
join SOCCER.match_details as d on a.ass_ref_id = d.ass_ref
where match_no = 1


-- task 11
select ass_ref_name, country_name
from SOCCER.asst_referee_mast as a
join SOCCER.soccer_country as c on a.country_id = c.country_id
join SOCCER.match_details as d on a.ass_ref_id = d.ass_ref
where play_stage = 'F'


-- task 12
select venue_name, city
from SOCCER.soccer_venue as v
join SOCCER.soccer_city as c on c.city_id = v.city_id
join SOCCER.match_mast as m on v.venue_id = m.venue_id
where match_no = 1


-- task 13
select venue_name, city, aud_capacity, audience
from SOCCER.soccer_venue as v
join SOCCER.soccer_city as c on v.city_id = c.city_id
join SOCCER.match_mast as m on v.venue_id = m.venue_id
where play_stage = 'F'


-- task 14
select venue_name, city, count(match_no)
from SOCCER.soccer_venue as v
join SOCCER.soccer_city as c on c.city_id = v.city_id
join SOCCER.match_mast as m on m.venue_id = v.venue_id
group by venue_name,city
order by venue_name


-- task 15
select match_no, country_name, player_name
from SOCCER.player_booked as b
join SOCCER.player_mast as m on b.player_id = m.player_id
join SOCCER.soccer_country as c on c.country_id = b.team_id
where sent_off = 'y' and match_no = (select min(match_no) from SOCCER.player_booked)


-- task 16
select country_name as Team, team_group, goal_for
from SOCCER.soccer_team as t
join SOCCER.soccer_country as c on t.team_id = c.country_id
where goal_for = 1


-- task 17
select country_name, count(*) as [count]
from SOCCER.soccer_country as c
join SOCCER.player_booked as b on c.country_id = b.team_id
group by country_name
order by [count] desc


-- task 18
select venue_name, COUNT(goal_score) as [count]
from SOCCER.soccer_country as c
join SOCCER.goal_details as d on c.country_id = d.team_id
join SOCCER.match_mast as m on d.match_no = m.match_no
join SOCCER.soccer_venue as v on v.venue_id = m.venue_id
group by venue_name
order by [count] desc


-- task 19
select d.match_no, country_name
from SOCCER.match_details as d
join SOCCER.match_mast as m on m.match_no = d.match_no
join SOCCER.soccer_country as c on d.team_id = c.country_id
where stop1_sec = 0


-- task 20
select country_name, team_group, match_played
from SOCCER.soccer_team as t
join SOCCER.soccer_country as c on t.team_id = c.country_id
where goal_agnst = (select max(goal_agnst) from SOCCER.soccer_team)	


-- task 21
select m.match_no, country_name, stop2_sec
from SOCCER.match_details as d
join SOCCER.match_mast as m on  d.match_no = m.match_no
join SOCCER.soccer_country as c on c.country_id = d.team_id
where stop2_sec = (select max(stop2_sec) from SOCCER.match_mast)


-- task 22
select match_no, country_name 
from SOCCER.match_details as d
join SOCCER.soccer_country as c on d.team_id = c.country_id
where play_stage = 'G' and win_lose = 'D' and goal_score = 0


-- task 23
select m.match_no, country_name, stop2_sec
from SOCCER.match_mast as m 
join SOCCER.match_details as d on m.match_no = d.match_no
join SOCCER.soccer_country as c on d.team_id = c.country_id
where m.stop2_sec = (select stop2_sec from soccer.match_mast
order by stop2_sec desc offset 1 rows fetch next 1 rows only)


-- task 24
select country_name, player_name, count(posi_to_play) as count
from SOCCER.player_mast as m 
join SOCCER.match_details as d on d.player_gk = m.player_id
join soccer.soccer_country as c on c.country_id = d.team_id
where posi_to_play = 'GK'
group by player_name ,country_name

 -- task 25
 select top 1 venue_name, count(venue_name) as cnt
 from SOCCER.goal_details as d
 join SOCCER.soccer_country as c on d.team_id = c.country_id
 join soccer.match_mast  as m on m.match_no = d.match_no
 join SOCCER.soccer_venue as v on v.venue_id = m.venue_id
 group by venue_name
-- having count(venue_name) = (select max(count(venue_name)) 
 order by cnt desc 

 -- task 26
 select country_name, player_name,jersey_no, age
 from SOCCER.player_mast as m
 join SOCCER.soccer_country as c on m.team_id = c.country_id
 where age = (select max(age) from SOCCER.player_mast)


 -- task 27
select match_no, country_name, goal_score
from SOCCER.match_details as d
join SOCCER.soccer_country as c on d.team_id = c.country_id
where goal_score = 3


-- task 28
select country_name, team_group, match_played, goal_agnst, group_position
from SOCCER.soccer_team as t
join SOCCER.soccer_country as c on c.country_id = t.team_id
where match_played = 3 and goal_agnst = 4 and group_position = 4


-- task 29
select player_name, jersey_no, posi_to_play, age, country_name, playing_club
from SOCCER.player_mast as m
join SOCCER.soccer_country as c on c.country_id = m.team_id
join SOCCER.match_details as d on d.team_id = m.team_id
where playing_club ='Lyon' and play_stage = 'F'


-- task 30
select country_name, match_no
from SOCCER.soccer_country as c
join SOCCER.match_details as d on c.country_id = d.team_id
where play_stage = 's'


-- task 31
select country_name,player_name, jersey_no, posi_to_play
from SOCCER.soccer_country as c
join SOCCER.match_captain as mc on mc.team_id = c.country_id
join SOCCER.player_mast as pm on pm.player_id = mc.player_captain
where match_no in (48,49)


-- task 32
select match_no, country_name,player_name, jersey_no, posi_to_play
from SOCCER.soccer_country as c
join SOCCER.match_captain as mc on mc.team_id = c.country_id
join SOCCER.player_mast as pm on pm.player_id = mc.player_captain


-- task 33
select d.match_no, pm.player_name as Captain, m.player_name as [Goal Keeper], country_name
from SOCCER.soccer_country as c
join SOCCER.match_captain as mc on c.country_id = mc.team_id
join SOCCER.match_details as d on d.match_no = mc.match_no
join SOCCER.player_mast as pm on mc.player_captain = pm.player_id
join SOCCER.player_mast as m on d.player_gk = m.player_id
where m.posi_to_play = 'GK'


-- task 34
select player_name, country_name
from SOCCER.soccer_country as c
join SOCCER.player_mast as p on c.country_id = p.team_id
join SOCCER.match_mast as m on m.plr_of_match = p.player_id
where play_stage = 'F'


