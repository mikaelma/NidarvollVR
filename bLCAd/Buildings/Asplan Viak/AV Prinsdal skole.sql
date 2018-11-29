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
SET @BLD='X999';

-- -- -- -- -- -- --
-- Insert building --
-- -- -- -- -- -- --
-- First insert building
call insert_building(@BLD,
/*Name:*/						'Name',
/*Project:*/					NULL,
/*Calculation method:*/			NULL,
/*Main data type:*/				'EPD/Ecoinvent/Mixed',
/*Study type:*/					'published research/unpublished research/industry, certification', 
/*Year of study:*/				study_year,

/*Lifetime:*/					Lifetime,
/*floor area:*/					floor_area,
/*heated volume:*/				heated_volume,
/*area_footprint:*/				area_footprint,
/*area roof:*/					area_roof,
/*area wall:*/					area_wall,
/*area windows and doors:*/		area_windows_and_doors,

/*heatloss number:*/			NULL,
/*uval_walls:*/					NULL,
/*uval_windows:*/				NULL,
/*uval_doors:*/					NULL,
/*uval_ground:*/				NULL,
/*uval_roof:*/					NULL,
/*thermal_bridges:*/			NULL,

/*GWP B6:*/						GWP_B6,
/*GWP B7:*/						NULL,
/*stories above ground:*/		stories_above_ground,
/*stories below ground:*/		stories_below_ground,
	
/*comments:*/					'comments', 
/*typology:*/					'typology', 
/*construction type:*/			'construction_type', 
/*Country:*/					'Norway',
/*city:*/						'city', 
/*built status:*/				'built_status', 
/*energy ambition level:*/		'energy_ambition_level'
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

			# individual materials
		call insert_material('Betong B45, lavkarbon klasse A', 'Specific/Generic', 'EPD/Ecoinvent', 						NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Armeringsstål, 100 % resirk', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Limtre', 'Specific/Generic', 'EPD/Ecoinvent', 												NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Stål, I, H, U, L, T profil', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Glassfasade', 'Specific/Generic', 'EPD/Ecoinvent', 											NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Ytterdør, tre/aluminium', 'Specific/Generic', 'EPD/Ecoinvent', 								NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Ytterdør, tre, malt', 'Specific/Generic', 'EPD/Ecoinvent', 									NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Ytterdør, glass/aluminium', 'Specific/Generic', 'EPD/Ecoinvent', 								NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Skyvedør, glass', 'Specific/Generic', 'EPD/Ecoinvent', 										NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Vindu, 3-lags, åpningsbart, med aluminiumbeslag', 'Specific/Generic', 'EPD/Ecoinvent', 		NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Vindu, 3-lags, ikke åpningsbart, med aluminiumbeslag', 'Specific/Generic', 'EPD/Ecoinvent', 	NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Trekledning', 'Specific/Generic', 'EPD/Ecoinvent', 											NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Glass Front systemvegg', 'Specific/Generic', 'EPD/Ecoinvent', 								NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Foldedør, glass', 'Specific/Generic', 'EPD/Ecoinvent', 										NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Innerdør, tre', 'Specific/Generic', 'EPD/Ecoinvent', 											NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Innerdør, stål', 'Specific/Generic', 'EPD/Ecoinvent', 										NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Skyvedør, glass', 'Specific/Generic', 'EPD/Ecoinvent', 										NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Vindu, 2-lags, ikke åpningsbart, med aluminiumsbeslag', 'Specific/Generic', 'EPD/Ecoinvent', 	NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('EPS', 'Specific/Generic', 'EPD/Ecoinvent', 													NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Linoleum', 'Specific/Generic', 'EPD/Ecoinvent', 												NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('Systemhimling, gipsplater', 'Specific/Generic', 'EPD/Ecoinvent', 								NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
			
			# composite parts
		call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);
		call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							NULL, 'FU', Density, iEEF_A1A3, NULL, 'Comment', 'materialCat', NULL, NULL);

			-- Insert transport emission factors if they are not already in the database
			# TEMPLATE: INSERT INTO GWP_transport (mode, name, GWP_pertkm) VALUES ('', '', );

		-- Insert materials into the inventory of the building, connected to a certain building element
		# TEMPLATE: call insert_materialInventory(@BLD, level, 'name_material', 							quantity, 'FU', RSL_(optional), 	'nameT1', T1dist, 'nameT2', T2dist, 'nameT3', T3dist, A5, 		'CountryProduction' (optional), 'CityProduction' (optional));

			# 21
				# 215
		-- call insert_materialInventory(@BLD, 215, 'name_material', 							quantity, 'm3', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
				# 216
		call insert_materialInventory(@BLD, 216, 'Betong B45, lavkarbon klasse A', 							30.050, 'm3', 60, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 216, 'name_material', 							quantity, 'm3', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 216, 'name_material', 							quantity, 'm3', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		call insert_materialInventory(@BLD, 216, 'Armeringsstål, 100 % resirk', 							4177.000, 'kg', 60, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		
			# 22
				# 222
		call insert_materialInventory(@BLD, 222, 'Limtre', 													17.435, 'm3', 60, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 222, 'name_material', 							quantity, 'kg', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 222, 'name_material', 							quantity, 'kg', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
				# 223
		call insert_materialInventory(@BLD, 223, 'Limtre', 													47.354, 'm3', 60, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		call insert_materialInventory(@BLD, 223, 'Stål, I, H, U, L, T profil', 								4524.000, 'kg', 60, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 223, 'name_material', 							quantity, 'kg', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		
			# 23
				# 231
					# 100mm massivtre + 250 mm iso Rockwool Redai Flex ventillert fasade + 27mm finer
		call insert_materialInventory(@BLD, 231, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 231, 'name_material', 							quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
				# 232
					# 180 mm massivtre
		call insert_materialInventory(@BLD, 232, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
				# 233
		call insert_materialInventory(@BLD, 233, 'Glassfasade', 											131.350, 'm2', 50, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
				# 234
		call insert_materialInventory(@BLD, 234, 'Ytterdør, tre/aluminium', 								5.170, 'm2', 30, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		call insert_materialInventory(@BLD, 234, 'Ytterdør, tre, malt', 									2.150, 'm2', 30, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		call insert_materialInventory(@BLD, 234, 'Ytterdør, glass/aluminium', 								12.800, 'm2', 30, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		call insert_materialInventory(@BLD, 234, 'Skyvedør, glass', 										4.280, 'm2', 30, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		call insert_materialInventory(@BLD, 234, 'Vindu, 3-lags, åpningsbart, med aluminiumbeslag', 		12.500, 'm2', 60, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		call insert_materialInventory(@BLD, 234, 'Vindu, 3-lags, ikke åpningsbart, med aluminiumbeslag', 	130.490, 'm2', 60, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 234, 'name_material', 							quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 234, 'name_material', 							quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
				# 235
		call insert_materialInventory(@BLD, 235, 'Trekledning', 											764.860, 'm2', 60, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		
			# 24
				# 241
					# 180 mm massivtre
		call insert_materialInventory(@BLD, 241, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
					# Vegg R'w 48 dB avstivende:100mm massivtre+50mm glassull med trestender 48x73+25mm gips+32mm massivtre
		call insert_materialInventory(@BLD, 241, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
				# 242
					# 165 mm massivtre
		call insert_materialInventory(@BLD, 242, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
					# 180 mm massivtre
		call insert_materialInventory(@BLD, 242, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
					# 22mm massivtre + 73 mm isolert stenderverk av stål
		call insert_materialInventory(@BLD, 242, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
					# 12 mm massivtre+73 mm isolert stenderverk av stål+12 mm massivtre
		call insert_materialInventory(@BLD, 242, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
					# 12mm massivtre + 73 mm isolert stenderverk av stål + branngips
		call insert_materialInventory(@BLD, 242, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
					# Vegg R'w 34 dB 32mm massivtre+100mmglassull med 2xtrestender 48x4873+22mm massivtre
		call insert_materialInventory(@BLD, 242, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
					# Vegg R'w 34 dB avstivende :100mm massivtre+50mm glassull+12,55mm robust gips
		call insert_materialInventory(@BLD, 242, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
					# Vegg R'w 40 dB : 13mm massivtre+12mm gips+50mm glassull med trestender 48x48+12,5mm gips+13mm massivtre
		call insert_materialInventory(@BLD, 242, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
					# Vegg R'w 48 dB :32mm massivtre+12,5mm gips+100mm glassull med 2xtrestender 48x73+25mm gips+13mm massivtre
		call insert_materialInventory(@BLD, 242, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
					# Vegg R'w 48 dB avstivende:100mm massivtre+50mm glassull med trestender 48x73+25mm gips+32mm massivtre
		call insert_materialInventory(@BLD, 242, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
				# 243
		call insert_materialInventory(@BLD, 243, 'Glass Front systemvegg', 									64.980, 'm2', 50, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
				# 244
		call insert_materialInventory(@BLD, 244, 'Foldedør, glass', 										23.520, 'm2', 30, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		call insert_materialInventory(@BLD, 244, 'Innerdør, tre', 											49.980, 'm2', 30, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		call insert_materialInventory(@BLD, 244, 'Innerdør, stål', 											89.350, 'm2', 30, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 244, 'name_material', 							quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 244, 'name_material', 							quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		call insert_materialInventory(@BLD, 244, 'Skyvedør, glass', 										13.990, 'm2', 30, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		call insert_materialInventory(@BLD, 244, 'Vindu, 2-lags, ikke åpningsbart, med aluminiumsbeslag', 	49.700, 'm2', 60, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 244, 'name_material', 							quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		
			# 25
				# 251
					# Etasjeskille: 12,5 mm gulvgips+22mmgulvspon+tilfarere98mm+grønne sylomerklosser+100mm glassull+180 mm massivtre
		call insert_materialInventory(@BLD, 251, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
				# 252
		-- call insert_materialInventory(@BLD, 252, 'name_material', 							quantity, 'm3', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		call insert_materialInventory(@BLD, 252, 'Betong B45, lavkarbon klasse A', 							153.460, 'm3', 60, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 252, 'name_material', 							quantity, 'm3', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 252, 'name_material', 							quantity, 'm3', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		call insert_materialInventory(@BLD, 252, 'Armeringsstål, 100 % resirk', 							1612.800, 'kg', 60, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 252, 'name_material', 							quantity, 'm3', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		call insert_materialInventory(@BLD, 252, 'EPS', 													121.250, 'm3', 60, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
				# 255
		call insert_materialInventory(@BLD, 255, 'Linoleum', 												1344.000, 'm2', 30, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 255, 'name_material', 							quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 255, 'name_material', 							quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
				# 257
		call insert_materialInventory(@BLD, 257, 'Systemhimling, gipsplater', 								1017.970, 'm2', 50, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 257, 'name_material', 							quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		-- call insert_materialInventory(@BLD, 257, 'name_material', 							quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		
			# 26
				# 261
					# Tak 100mm iso+360mm iso+trelekter+16mm finerplate
		call insert_materialInventory(@BLD, 261, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
					# Tak trelekter+16mm finerplate
		call insert_materialInventory(@BLD, 261, 'name_material', 											quantity, 'm2', RSL_(optional), 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
				# 262
		call insert_materialInventory(@BLD, 262, 'Trekledning', 											578.027, 'm2', 60, 	'nameT1', T1dist, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);

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