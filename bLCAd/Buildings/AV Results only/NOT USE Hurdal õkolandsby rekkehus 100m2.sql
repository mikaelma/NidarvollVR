-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Workflow for inserting a new building / updating a building entry --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
/* 
PROBLEMS because subcategories , not using this building

*/
USE bLCAd;


-- -- -- -- -- -- -- -- --
-- Define building name --
-- -- -- -- -- -- -- -- --
-- Define the building_identifier that will be used to reference the building (composed of a letter for the typology and a three digit number)
SET @BLD='X999';

-- -- -- -- -- -- --
-- Insert building --
-- -- -- -- -- -- --
-- First insert building
call insert_building(@BLD,
/*Name:*/						'Hurdal oekolandsby 100m2 rekkehus',
/*Project:*/					'Asplan Viak',
/*Calculation method:*/			NULL,
/*Main data type:*/				NULL,
/*Study type:*/					'industry, certification', 
/*Year of study:*/				NULL,

/*Lifetime:*/					60,
/*floor area:*/					100,
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
/*typology:*/					'residential', 
/*construction type:*/			'na', 
/*Country:*/					'Norway',
/*city:*/						'Hurdal', 
/*built status:*/				'na', 
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

call insert_GWP_BE(@BLD,21 ,5796,410.662, NULL, 0.645, 1.83912, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD,216 ,438,1.544, NULL, 0, 0, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD,222 ,4	,0.291, NULL, 0, 0, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD,223,3	,1.455, NULL, 0, 0, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD,231,2165,191.279	, NULL, 190.996, 38.06086, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD,241,447,51.189, NULL, 224.553, 34.14982, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD,25,804	,71.242, NULL, 127.766, 18.5076, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD,252,1762,66.752, NULL, 	219.296, 16.3736, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD,2522,33	,7.005, NULL, 16.351, 2.91, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD,26,1378	,100.646, NULL, 256.505, 18.3136, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
call insert_GWP_BE(@BLD,234,2377,19.456, NULL, 0, 0, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


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