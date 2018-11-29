-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Workflow for inserting a new building / updating a building entry --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
/* 
this can be used to store a building in a sql file for re-entry

The workflow for entering a building follows four steps:
 - Define building name
 - Insert building
 - Insert GWP results
 - Calculate building

eventually it would be good to have a GUI for this workflow, with dropdown menus and choices to add extra entry


*/
USE bLCAd;


-- -- -- -- -- -- -- -- --
-- Define building name --
-- -- -- -- -- -- -- -- --
-- Define the building_identifier that will be used to reference the building (composed of a letter for the typology and a three digit number)
SET @BLD='S003';

-- -- -- -- -- -- --
-- Insert building --
-- -- -- -- -- -- --
-- First insert building
call insert_building(@BLD,
/*Name:*/						'Ruselokka',
/*Project:*/					'Asplan Viak',
/*Calculation method:*/			'Excel',
/*Main data type:*/				NULL,
/*Study type:*/					'industry, certification', 
/*Year of study:*/				NULL,

/*Lifetime:*/					60,
/*floor area:*/					9740,
/*heated volume:*/				NULL,
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

/*GWP B6:*/						NULL,
/*GWP B7:*/						NULL,
/*stories above ground:*/		NULL,
/*stories below ground:*/		NULL,
	
/*comments:*/					'comments', 
/*typology:*/					'School', 
/*construction type:*/			'na', 
/*Country:*/					'Norway',
/*city:*/						'Oslo', 
/*built status:*/				'built', 
/*energy ambition level:*/		'na'
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
    call insert_GWP_BE(@BLD, 21, 59717, 1658, NULL, 0, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 22, 111938, 6443, NULL, 0, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 23, 426252, 8000, NULL, 49544, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 24, 288993, 14276, NULL, 31558, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 25, 578277, 21196, NULL, 48763, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 26, 326720, 8817, NULL, 0, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 28, 38528, 1070, NULL, 0, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);







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
		# TEMPLATE: call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							dataYear, 'FU', Density, iEEF_A1A3, RSL, 'Comment', 'materialCat', 'CountryProduction', 'CityProduction');

			-- Insert transport emission factors if they are not already in the database
			# TEMPLATE: INSERT INTO GWP_transport (mode, name, GWP_pertkm) VALUES ('', '', );

		-- Insert materials into the inventory of the building, connected to a certain building element
		# TEMPLATE: call insert_materialInventory(@BLD, level, 'name_material', 							quantity, 'FU', RSL_(optional), 	'nameT1', T1dist, 'nameT2', T2dist, 'nameT3', T3dist, A5, 		'CountryProduction' (optional), 'CityProduction' (optional));

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