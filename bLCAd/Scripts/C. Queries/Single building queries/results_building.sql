-- view results for a building at a specified hierarchy
-- comment out building to show for all buildings (same for hierarchy)
/*
Some restrictions:
	-- General:
		where b.building_identifier = 'R003'
		where l.idlevels = 21
        where l.hierarchy = 2
	-- Show only entries where A4 is included
		and A4>0
*/
SELECT 
    b.building_identifier,
    b.building_name,
    l.hierarchy,
    l.name,
    be.idlevels,
    be.A1A3,
    be.A4,
    be.A5,
    be.B4_m,
    be.B4_t,
    be.B4_m + be.B4_t AS B4,
    be.A1A3 / (b.floor_area * b.lifetime) AS A1A3_pm2yr,
    be.A4 / (b.floor_area * b.lifetime) AS A4_pm2yr,
    be.A5 / (b.floor_area * b.lifetime) AS A5_pm2yr,
    be.B4_m / (b.floor_area * b.lifetime) AS B4__m_pm2yr,
    be.B4_t / (b.floor_area * b.lifetime) AS B4_t_pm2yr,
    be.B4_m / (b.floor_area * b.lifetime) + be.B4_t / (b.floor_area * b.lifetime)  as B4_pm2yr
FROM
    buildingelements be
        JOIN
    levels l ON l.idlevels = be.idlevels
        JOIN
    buildings b ON be.idbuildings = b.idbuildings
WHERE
    -- b.building_identifier = 'R003';
       l.hierarchy = 0;
