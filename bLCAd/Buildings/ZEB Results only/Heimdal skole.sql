-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Workflow for inserting a new building / updating a building entry --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
/* 
have inserted idlevels 2 ONLY
and only emissions from SCHOOL


*/
USE bLCAd;


-- -- -- -- -- -- -- -- --
-- Define building name --
-- -- -- -- -- -- -- -- --
-- Define the building_identifier that will be used to reference the building (composed of a letter for the typology and a three digit number)
SET @BLD='S005';

-- -- -- -- -- -- --
-- Insert building --
-- -- -- -- -- -- --
-- First insert building
call insert_building(@BLD,
/*Name:*/						'Heimdal skole',
/*Project:*/					'ZEB',
/*Calculation method:*/			'Excel',
/*Main data type:*/				NULL,
/*Study type:*/					'published research', 
/*Year of study:*/				2018,

/*Lifetime:*/					60,
/*floor area:*/					18675,
/*heated volume:*/				NULL,
/*area_footprint:*/				NULL,
/*area roof:*/					NULL,
/*area wall:*/					NULL,
/*area windows and doors:*/		NULL,

/*heatloss number:*/			NULL,
/*uval_walls:*/					0.1,
/*uval_windows:*/				0.8,
/*uval_doors:*/					0.8,
/*uval_ground:*/				0.075,
/*uval_roof:*/					0.09,
/*thermal_bridges:*/			0.02,

/*GWP B6:*/						3.58*18675,
/*GWP B7:*/						NULL,
/*stories above ground:*/		5,
/*stories below ground:*/		NULL,
	
/*comments:*/					'School only w/o flerbrukshall', 
/*typology:*/					'school', 
/*construction type:*/			'na', 
/*Country:*/					'Norway',
/*city:*/						'Trondheim', 
/*built status:*/				'built', 
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

    call insert_GWP_BE(@BLD, 21, 165297, 1984, NULL, 0, 0, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 22, 1121757, 5698, NULL, 0, 0, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 23, 480102, 9819, NULL, 224630, 6089, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 24, 1138122, 156507, NULL, 1386114, 284164, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 25, 1890379, 56216, NULL, 96200, 4047, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    call insert_GWP_BE(@BLD, 26, 692959, 4845, NULL, 27069, 430, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


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