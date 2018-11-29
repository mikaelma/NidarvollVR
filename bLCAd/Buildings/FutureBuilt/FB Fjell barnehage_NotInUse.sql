-- -- -- -- -- -- -- -- -- -- -- --
-- FutureBuilt Fjell Barnehage --
-- -- -- -- -- -- -- -- -- -- -- --
/* 
I dont think that it is possible to use this data, because the A1A3 and B4 are presented as aggregated numbers only.
Another problem is that the category "basiselementer" does not exist.

NB: Not all building information is correct
*/
USE bLCAd;


-- -- -- -- -- -- -- -- --
-- Define building name --
-- -- -- -- -- -- -- -- --
-- Define the building_identifier that will be used to reference the building (composed of a letter for the typology and a three digit number)
SET @BLD='K001';

-- -- -- -- -- -- --
-- Insert building --
-- -- -- -- -- -- --
-- First insert building
/* TEMPLATE: call insert_building(@BLD,
	'Name', 'Main data type: EPD/Ecoinvent/Mixed', 'Study type: published research/unpublished research/industry/certification', study_year,
	Lifetime, floor area, heated volume, area_footprint, area roof, area wall, area windows and doors, heatloss number, GWP B6, stories above ground, stories below ground,
	'comments', 'typology', 'construction type', 'city', 'built status', 'energy ambition level'); */

call insert_building(@BLD,
/*Name:*/						'FutureBuilt Fjell Barnehage',
/*Project:*/					'FutureBuilt',
/*Calculation method:*/			'Klimagassregnskap.no',
/*Main data type:*/				'EPD',
/*Study type:*/					'industry, certification', 
/*Year of study:*/				2015,
-- /*Calculation method:*/			,

/*Lifetime:*/					60,
/*floor area:*/					755,
/*heated volume:*/				1945,
/*area_footprint:*/				NULL,
/*area roof:*/					NULL,
/*area wall:*/					NULL,
/*area windows and doors:*/		NULL,

/*heatloss number:*/			NULL,
/*uval_walls:*/					NULL,
/*uval_windows:*/				NULL,
/*uval_doors:*/					NULL,
/*uval_ground:*/				NULL,
/*uval_roof:*/					NULL,
/*thermal_bridges:*/			NULL,

/*GWP B6:*/						11.66*755,
/*GWP B7:*/						NULL,
/*stories above ground:*/		1,
/*stories below ground:*/		1,
	
/*comments:*/					'Results are including both A1A3 and B4 but it is not possible to separate these from the available report.', 
/*typology:*/					'kindergarden', 
/*construction type:*/			'timber', 
/*Country:*/					'Norway',
/*city:*/						'Drammen', 
/*built status:*/				'built', 
/*energy ambition level:*/		'Passive House'
);

-- -- -- -- -- -- -- -- --
-- Insert GWP results --
-- -- -- -- -- -- -- -- --
-- Then insert GWP results in one of the following ways

	-- -- -- -- -- -- -- -- -- -- -- --
	-- Insert GWP results: Option 1 --
	-- -- -- -- -- -- -- -- -- -- -- --
	/* Option 1: Inserting results into building elements
	This option has lower detail than the next, but often this is all the data that is available in the results obtained
	The detail level also varies within this option, in that the level at which results are entered can be hierarchies 0, 1, 2, or 3
	TEMPLATE: call insert_GWP_BE(@BLD, building element level, A1A3, A4, A5, B4_m, B4_t);
    */

call insert_GWP_BE(@BLD, 21, .628*755*60, NULL, NULL, NULL, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD, 22, .023*755*60, NULL, NULL, NULL, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD, 23, 1.34*755*60, NULL, NULL, NULL, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD, 24, 3.691*755*60, NULL, NULL, NULL, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD, 25, .661*755*60, NULL, NULL, NULL, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD, 26, .946*755*60, NULL, NULL, NULL, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD, 28, .155*755*60, NULL, NULL, NULL, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD, 29, .025*755*60, NULL, NULL, NULL, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);



	-- -- -- -- -- -- -- -- -- -- -- --
	-- Insert GWP results: Option 2 --
	-- -- -- -- -- -- -- -- -- -- -- --
	/* Option 2: Inserting materials and then material inventories
	This option has the highest level of detail, it actually recalculates the whole LCA and contains all information
	*/	
			-- Insert material categories if they are not already in the database
			# TEMPLATE: INSERT INTO materialCat (materialCat) VALUES ('');
			
			-- Insert location if it is not already in the database
			# TEMPLATE: INSERT INTO location (country, city) VALUES ('','');
		
        -- Insert materials if they are not already in the database
		# TEMPLATE: call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							'Norway', 2016, 'FU', Density, iEEF_A1A3, RSL, 'Comment', 'materialCat', 'CountryProduction', 'CityProduction');

			-- Insert transport emission factors if they are not already in the database
			# TEMPLATE: INSERT INTO GWP_transport (mode, name, GWP_pertkm) VALUES ('', '', );

		-- Insert materials into the inventory of the building, connected to a certain building element
		# TEMPLATE: call insert_materialInventory(@BLD, level, 'name_material', 							quantity, 'FU', RSL (optional), 	'nameT1', T1dist, 'nameT2', T2dist, 'nameT3', T3dist, A5, 		'CountryProduction' (optional), 'CityProduction' (optional));

	-- -- -- -- -- -- -- -- -- -- -- --
	-- Insert GWP results: Option 3 --
	-- -- -- -- -- -- -- -- -- -- -- --
	-- Option 3: A combination of the two above. Remember that entries at lower levels overwrite entries at higher levels.

-- -- -- -- -- -- -- -- --
-- Calculate building --
-- -- -- -- -- -- -- -- --
/* At last, calculate the rest of the results based on the inputs by running the following procedure
When running this procedure, any entries at lower levels in the building elements will overwrite entries in higher levels
Likewise, any materialInventory entries will overwrite any entries in the connected building element
I.e. lower levels have higher priority in the calculations 

One can choose to enter for example A5 directly into a chosen building element, and the rest through lower levels.
As long as A5 is kept NULL at all lower levels and material inventory, it will not be affected at a higher level.
It will, however, be overwritten if there are any entries for A5 on lower levels.
*/
call calculate_building(@BLD);