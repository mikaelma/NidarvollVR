SELECT
building_identifier,building_name,project,floor_area,heated_volume,
area_footprint,area_roof,area_wall,area_windowAndDoor,
heatloss_number,storiesAB,storiesBG,occupants,comments,typology,
construction_type,country,city,built_status,energy_ambition_level
FROM buildings b 
JOIN typology t on b.idtypology=t.idtypology
JOIN constructiontype ct on b.idconstruction_type=ct.idconstruction_type
JOIN location l on l.idlocation=b.idlocation
JOIN builtstatus bs on bs.idbuilt_status=b.idbuilt_status
JOIN energyambitionlevel eal on eal.idenergy_ambition_level=b.idenergy_ambition_level
WHERE building_identifier='R001'
;

SELECT
calculation_method,main_data_source,study_type,study_year,lifetime,GWP_B6,GWP_B7
FROM buildings b 
JOIN typology t on b.idtypology=t.idtypology
JOIN constructiontype ct on b.idconstruction_type=ct.idconstruction_type
JOIN location l on l.idlocation=b.idlocation
JOIN builtstatus bs on bs.idbuilt_status=b.idbuilt_status
JOIN energyambitionlevel eal on eal.idenergy_ambition_level=b.idenergy_ambition_level
WHERE building_identifier='R001'
;
