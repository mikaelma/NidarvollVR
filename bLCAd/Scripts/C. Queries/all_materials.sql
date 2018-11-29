-- show all materials
SELECT 
    m.idmaterials, m.name, m.dataType, m.sourceType, m.dataYear, m.FU, m.EEf_A1A3, m.density, m.RSL, m.comments, mc.materialCat, l.country, l.city
FROM
    materials m
    LEFT JOIN materialcat mc ON mc.idmaterialCat = m.idmaterialCat
    LEFT JOIN location l ON l.idlocation = m.idlocationproduction

;