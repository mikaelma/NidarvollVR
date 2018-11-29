/*
Insert new building
*/
USE `bLCAd`;
DROP procedure IF EXISTS `insert_building`;

DELIMITER //
CREATE  PROCEDURE `insert_building`(	in ibuilding_identifier varchar(45),
										in ibuilding_name varchar(45),
                                        in iproject varchar(45),
										in icalculation_method varchar(45),
                                        in imain_data_source enum('EPD','Ecoinvent','Mixed'),
                                        in istudy_type enum('published research','unpublished research','industry, certification'), 
                                        in istudy_year year,
										in ilifetime int(11),
										in ifloor_area int(11),
										in iheated_volume int(11),
                                        in iarea_footprint int(11),
										in iarea_roof int(11),
										in iarea_wall int(11),
										in iarea_windowAndDoor int(11),
										
										in iheatloss_number decimal(10,5),
										in iuval_walls decimal(4,3),
										in iuval_windows decimal(4,3),
										in iuval_doors decimal(4,3),
										in iuval_ground decimal(4,3),
										in iuval_roof decimal(4,3),
										in ithermal_bridges decimal(4,3),

										in iGWP_B6 decimal(10,5),
										in iGWP_B7 decimal(10,5),
										in istoriesAB int(11),
										in istoriesBG int(11),
										in icomments varchar(1000),
										in itypology varchar(45),
										in iconstruction_type varchar(45),
                                        in icountry varchar(45),
										in icity varchar(45),
										in ibuilt_status varchar(45),
										in ienergy_ambition_level varchar(45)
										)

BEGIN
-- -- -- -- -- -- -- 
-- Insert values --
-- -- -- -- -- -- -- 
INSERT INTO buildings
(
	building_identifier, 
    building_name,
    project,
    calculation_method,
    main_data_source,
    study_type,
    study_year,
    lifetime, 
    floor_area, 
    heated_volume, 
    area_footprint,
	area_roof, 
    area_wall, 
    area_windowAndDoor, 
    
    heatloss_number, 
	uval_walls,
	uval_windows,
	uval_doors,
	uval_ground,
	uval_roof,
	thermal_bridges,

    GWP_B6, 
    GWP_B7, 
    storiesAB, 
    storiesBG, 
    comments, 
	idtypology, 
    idconstruction_type,
    idlocation,
    idbuilt_status,
    idenergy_ambition_level)
VALUES 
(

    ibuilding_identifier,
    ibuilding_name, 
    iproject,
    icalculation_method,
	imain_data_source,
	istudy_type,
    istudy_year,
	ilifetime, 
	ifloor_area, 
	iheated_volume, 
    iarea_footprint,
	iarea_roof, 
    iarea_wall, 
	iarea_windowAndDoor, 
	
	iheatloss_number, 
	iuval_walls,
	iuval_windows,
	iuval_doors,
	iuval_ground,
	iuval_roof,
	ithermal_bridges,
	
	iGWP_B6,
	iGWP_B7, 
	istoriesAB, 
	istoriesBG, 
    icomments, 
    (SELECT idtypology from typology t where t.typology=itypology),
	(SELECT idconstruction_type from constructiontype c where c.construction_type=iconstruction_type),
	(SELECT idlocation from location l where l.country=icountry and l.city=icity),
	(SELECT idbuilt_status from builtstatus b where b.built_status=ibuilt_status),
	(SELECT idenergy_ambition_level from energyambitionlevel e where e.energy_ambition_level=ienergy_ambition_level)
);


END//
DELIMITER ;