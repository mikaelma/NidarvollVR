-- TODO
-- Li har muligens zeros der hvor det ikke er tatt med? burde være NULLs ellers blir snittet feil
-- Qi er ikke riktig, er totalen for alle bygg


SELECT 
mc.materialcat,
count(distinct(b.idbuildings)),
sum(mi.A1A3) as sumA1A3,

-- Qi: quantity
SUM(mi.quantity*m.density/b.floor_area)/count(distinct(b.idbuildings)) AS Qi, 
MAX(mi.quantity*m.density/b.floor_area) AS QiMAX, 
MIN(mi.quantity*m.density/b.floor_area) AS QiMIN, 

-- Fi: emission intensity
SUM(mi.quantity*m.density*m.EEf_A1A3)/SUM(mi.quantity*m.density) AS Fi,
MAX(m.EEf_A1A3) AS FiMAX,
MIN(m.EEf_A1A3) AS FiMIN,

-- Li: lifetime factor
SUM(mi.quantity*m.density*(b.lifetime/mi.RSL_mi-1))/SUM(mi.quantity*m.density) AS Li,
MAX(b.lifetime/mi.RSL_mi-1) AS LiMAX,
MIN(b.lifetime/mi.RSL_mi-1) AS LiMIN

-- Ti, 
-- Di

FROM materialinventory mi
JOIN materials m on m.idmaterials = mi.idmaterials
JOIN materialcat mc on mc.idmaterialCat = m.idmaterialCat
JOIN buildingelements be on be.idbuilding_elements = mi.idbuilding_elements
JOIN buildings b on b.idbuildings = be.idbuildings

where b.building_identifier='R001' -- mi.idbuilding_elements 
group by mc.materialcat -- , b.idbuildings
order by sumA1A3 desc