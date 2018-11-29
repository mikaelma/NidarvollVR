-- Group (all buildings) by materialCat
	-- obviously, only buildings with matInventory show up
SELECT 
    be.idlevels,
    l.name,
    mc.materialCat,
    AVG(m.EEf_A1A3) AS avgEmissionFactor,
    SUM(mi.quantity * density) AS Mass_kg,
    SUM(mi.A1A3) as sum_A1A3,
    SUM(mi.A4),
    SUM(mi.A5),
    SUM(mi.B4_m),
    SUM(mi.B4_t),
    SUM(mi.B4_m + mi.B4_t) AS sum_B4,
    SUM(mi.A1A3 + mi.A4 + coalesce(mi.A5,0) + mi.B4_m + mi.B4_t) AS sum_all_LC
FROM
    materialinventory mi
        JOIN
    materials m ON mi.idmaterials = m.idmaterials
        JOIN
    buildingelements be ON be.idbuilding_elements = mi.idbuilding_elements
        JOIN
    materialcat mc ON m.idmaterialCat = mc.idmaterialCat
        JOIN
    levels l ON l.idlevels = be.idlevels
        JOIN
    buildings b ON b.idbuildings = be.idbuildings
WHERE
    l.name = 'Outer walls'
GROUP BY materialCat
ORDER BY sum_A1A3 desc;