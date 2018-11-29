SELECT * 
FROM materialinventory mi
JOIN materials m ON mi.idmaterials=m.idmaterials
JOIN buildingelements be ON be.idbuilding_elements=mi.idbuilding_elements
JOIN materialcat mc ON m.idmaterialCat=mc.idmaterialCat
JOIN levels l ON l.idlevels=be.idlevels
JOIN buildings b ON b.idbuildings=be.idbuildings;

-- show which materials contribute to most emissions in A1A3 for the entire building
SELECT b.building_identifier, b.building_name, mc.materialCat, m.name ,m.EEf_A1A3 as EmissionFactor, sum(mi.quantity), m.FU,mi.RSL_mi, sum(mi.A1A3) as sum_A1A3, sum(mi.A4), sum(mi.A5), sum(mi.B4_m), sum(mi.B4_t), sum(mi.B4_m+mi.B4_t)
FROM materialinventory mi
JOIN materials m ON mi.idmaterials=m.idmaterials
JOIN buildingelements be ON be.idbuilding_elements=mi.idbuilding_elements
JOIN materialcat mc ON m.idmaterialCat=mc.idmaterialCat
JOIN levels l ON l.idlevels=be.idlevels
JOIN buildings b ON b.idbuildings=be.idbuildings
where building_identifier='R001'
group by m.name
order by sum_A1A3 desc;