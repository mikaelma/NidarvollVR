-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Workflow for inserting a new building / updating a building entry --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
/* 
have inserted idlevels 2 ONLY


*/
USE bLCAd;


-- -- -- -- -- -- -- -- --
-- Define building name --
-- -- -- -- -- -- -- -- --
-- Define the building_identifier that will be used to reference the building (composed of a letter for the typology and a three digit number)
SET @BLD='O002';

-- -- -- -- -- -- --
-- Insert building --
-- -- -- -- -- -- --
-- First insert building
call insert_building(@BLD,
/*Name:*/						'ZEB Office concept',
/*Project:*/					'ZEB',
/*Calculation method:*/			'Excel',
/*Main data type:*/				NULL,
/*Study type:*/					'published research', 
/*Year of study:*/				2013,

/*Lifetime:*/					60,
/*floor area:*/					1980,
/*heated volume:*/				NULL,
/*area_footprint:*/				NULL,
/*area roof:*/					NULL,
/*area wall:*/					NULL,
/*area windows and doors:*/		NULL,

/*heatloss number:*/			NULL,
/*uval_walls:*/					0.12,
/*uval_windows:*/				0.75,
/*uval_doors:*/					0.75,
/*uval_ground:*/				0.11,
/*uval_roof:*/					0.09,
/*thermal_bridges:*/			0.03,

/*GWP B6:*/						4.35*1980,
/*GWP B7:*/						NULL,
/*stories above ground:*/		4,
/*stories below ground:*/		NULL,
	
/*comments:*/					'comments', 
/*typology:*/					'office', 
/*construction type:*/			'na', 
/*Country:*/					'Norway',
/*city:*/						'na', 
/*built status:*/				'concept', 
/*energy ambition level:*/		'ZEB-OM'
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

    call insert_GWP_BE(@BLD, 21, 67703.4, NULL, NULL, 0, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 22, 48156.6, NULL, NULL, 0, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 23, 119606.8, NULL, NULL, 64174.5, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 24, 99331.9, NULL, NULL, 49512.8, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 25, 191839.8, NULL, NULL, 25650.1, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 26, 7190.2, NULL, NULL, 1625.0, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 28, 4010.3, NULL, NULL, 0, NULL, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

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