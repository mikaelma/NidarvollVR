-- joining all data from all tables (except for location in the materials table, since it is not necessary: location is transfered to materialInventory table

/* -- buildings component
idbuildings, building_identifier, building_name, project, calculation_method, main_data_source, study_type, study_year, lifetime, floor_area, heated_volume, area_footprint, area_roof, area_wall, area_windowAndDoor, heatloss_number, GWP_B6, GWP_B7, storiesAB, storiesBG, occupants, comments, idtypology, idconstruction_type, idlocation, idbuilt_status, idenergy_ambition_level, idtypology, typology, idconstruction_type, construction_type, idenergy_ambition_level, energy_ambition_level, idbuilt_status, built_status, idlocation, country, city, 
-- building elements component
idbuilding_elements, idbuildings, idlevels, A1A3, A4, B4_m, B4_t, A5, B1, B2, B3, B5, C1, C2, C3, C4, D1, D2, D3, D4, idlevels, name, hierarchy, idparent, 
-- material inventory component
idmaterialInventory, idbuilding_elements, idmaterials, quantity, RSL_mi, idGWP_transport1, transport1_distance, idGWP_transport2, transport2_distance, idGWP_transport3, transport3_distance, idlocationproduction, A1A3, A4, B4_m, B4_t, A5, B1, B2, B3, B5, C1, C2, C3, C4, D1, D2, D3, D4, idGWP_transport, mode, name, GWPper_tkm, idGWP_transport, mode, name, GWPper_tkm, idGWP_transport, mode, name, GWPper_tkm, idlocation, country, city, 
-- materials component
idmaterials, name, dataType, sourceType, dataYear, FU, density, EEf_A1A3, RSL, comments, idmaterialCat, idlocationproduction, idmaterialCat, materialCat
*/

SELECT 
-- buildings component
building_identifier, 
building_name, 
project, 
calculation_method, 
-- main_data_source, 
study_type, 
study_year, 
lifetime AS lifetime_building, 

floor_area, 
heated_volume, 
area_footprint, 
-- area_roof, 
area_wall, 
area_windowAndDoor, 
-- heatloss_number, 
-- uval_walls,
-- uval_windows,
-- uval_doors,
-- uval_ground,
-- uval_roof,
-- thermal_bridges,
GWP_B6, 
-- GWP_B7, 
storiesAB, 
storiesBG, 
-- occupants, 

-- b.comments, 
typology, 
construction_type, 
energy_ambition_level, 
built_status, 
lb.country AS country_building, 
lb.city AS city_building, 

-- building elements component
l.idlevels, 
l.name AS be_name, 
l.hierarchy, 
l.idparent, 
be.A1A3 AS be_A1A3, 
be.A4 AS be_A4, 
be.B4_m AS be_B4_m, 
be.B4_t AS be_B4_t, 

-- material inventory component
quantity, 
RSL_mi AS lifetime_material, 

transport1_distance, 
GWPt1.mode AS transport1_mode, 
GWPt1.name AS transport1_name, 
GWPt1.GWPper_tkm AS transport1_GWPper_tkm,  

transport2_distance, 
GWPt2.mode AS transport2_mode, 
GWPt2.name AS transport2_name, 
GWPt2.GWPper_tkm AS transport2_GWPper_tkm,  

transport3_distance, 
GWPt3.mode AS transport3_mode, 
GWPt3.name AS transport3_name, 
GWPt3.GWPper_tkm AS transport3_GWPper_tkm,  

mi.A1A3 AS mi_A1A3, 
mi.A4 AS mi_A4, 
mi.B4_m AS mi_B4_m, 
mi.B4_t AS mi_B4_t, 

lmi.country AS country_production, 
lmi.city AS city_production, 

-- materials component
m.name, 
dataType, 
sourceType, 
dataYear, 
FU, 
density, 
EEf_A1A3,  
-- m.comments, 
materialCat

-- buildings component
FROM buildings b
LEFT JOIN typology t ON t.idtypology = b.idtypology 
LEFT JOIN constructionType ct ON ct.idconstruction_type = b.idconstruction_type
LEFT JOIN energyAmbitionLevel eal ON eal.idenergy_ambition_level = b.idenergy_ambition_level
LEFT JOIN builtStatus bs ON bs.idbuilt_status = b.idbuilt_status
LEFT JOIN location lb ON lb.idlocation = b.idlocation

-- building elements component
LEFT JOIN buildingElements be ON be.idbuildings = b.idbuildings
LEFT JOIN levels l ON l.idlevels = be.idlevels

-- material inventory component
LEFT JOIN materialInventory mi ON mi.idbuilding_elements = be.idbuilding_elements
LEFT JOIN GWP_transport GWPt1 ON GWPt1.idGWP_transport = mi.idGWP_transport1
LEFT JOIN GWP_transport GWPt2 ON GWPt2.idGWP_transport = mi.idGWP_transport2
LEFT JOIN GWP_transport GWPt3 ON GWPt3.idGWP_transport = mi.idGWP_transport3
LEFT JOIN location lmi ON lmi.idlocation = mi.idlocationproduction

-- materials component
LEFT JOIN materials m ON m.idmaterials = mi.idmaterials
LEFT JOIN materialCat mc ON mc.idmaterialcat = m.idmaterialcat

