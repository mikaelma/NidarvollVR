-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- FutureBuilt Papirbredden II --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
/* 

The values I have available for material quantities are rounded to the nearest ton, which means imprecice values. Results are therefore not precise either.
It is possible to reverse calculate these quantities, if necessary.

NB: Have to update building info

*/
USE bLCAd;


-- -- -- -- -- -- -- -- --
-- Define building name --
-- -- -- -- -- -- -- -- --
-- Define the building_identifier that will be used to reference the building (composed of a letter for the typology and a three digit number)
SET @BLD='O001';

-- -- -- -- -- -- --
-- Insert building --
-- -- -- -- -- -- --
-- First insert building
call insert_building(@BLD,
/*Name:*/						'FutureBuilt Papirbredden 2',
/*Project:*/					'FutureBuilt',
/*Calculation method:*/			NULL,
/*Main data type:*/				NULL,
/*Study type:*/					'industry, certification', 
/*Year of study:*/				NULL,

/*Lifetime:*/					60,
/*floor area:*/					8536,
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
	
/*Comments:*/					'Hus 1 og del av kjeller (39% av total kjeller)', 
/*Typology:*/					'office', 
/*Construction type:*/			'steel', 
/*Country:*/					'Norway',
/*City:*/						'Drammen', 
/*Built status:*/				'built', 
/*Energy ambition level:*/		'Passive House'
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
		# TEMPLATE: call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							 NULL, 'FU', Density, iEEF_A1A3, RSL, 'Comment', 'materialCat', 'CountryProduction', 'CityProduction');

call insert_material('PB2: Naturstein', 'na', 'na', 										NULL, 'kg', 1, 1654/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'rock', 				NULL, NULL);
call insert_material('PB2: Aluvinduer', 'na', 'na', 										NULL, 'kg', 1, 2414/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'windows', 				NULL, NULL);
call insert_material('PB2: Vinduer trekarm m/alubeslag', 'na', 'na', 						NULL, 'kg', 1, 1829/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'windows', 				NULL, NULL);
call insert_material('PB2: Gips', 'na', 'na', 												NULL, 'kg', 1, 397/1000, NULL, 		'FutureBuilt Papirbredden 2', 	'gypsum', 				NULL, NULL);
call insert_material('PB2: Isolasjon, Glava 350mm', 'na', 'na', 							NULL, 'kg', 1, 967/1000, NULL, 		'FutureBuilt Papirbredden 2', 	'insulation', 			NULL, NULL);
call insert_material('PB2: Tre', 'na', 'na', 												NULL, 'kg', 1, 48/1000, NULL, 		'FutureBuilt Papirbredden 2', 	'timber', 				NULL, NULL);
call insert_material('PB2: Vind- /damp-sperre', 'na', 'na', 								NULL, 'kg', 1, 1928/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'vapour/wind barrier', 	NULL, NULL);
call insert_material('PB2: OSB-plate', 'na', 'na', 											NULL, 'kg', 1, 446/1000, NULL, 		'FutureBuilt Papirbredden 2', 	'timber', 					NULL, NULL);
call insert_material('PB2: Tre + glass kontorfront', 'na', 'na', 							NULL, 'kg', 1, 956/1000, NULL, 		'FutureBuilt Papirbredden 2', 	'tbd', 					NULL, NULL);
call insert_material('PB2: Stålprofiler innvendige vegger', 'na', 'na', 					NULL, 'kg', 1, 15/1000, NULL, 		'FutureBuilt Papirbredden 2', 	'steel', 				NULL, NULL);
call insert_material('PB2: Maling', 'na', 'na', 											NULL, 'kg', 1, 2628/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'paint', 				NULL, NULL);
call insert_material('PB2: Himling, mineralull T-profil (glava aqx-venu)', 'na', 'na',		NULL, 'kg', 1, 1011/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'insulation', 					NULL, NULL);
call insert_material('PB2: Himling, mineralull limt', 'na', 'na', 							NULL, 'kg', 1, 967/1000, NULL, 		'FutureBuilt Papirbredden 2', 	'insulation', 					NULL, NULL);


call insert_material('PB2: Linoleum (Forbo)', 'na', 'na', 									NULL, 'kg', 1, 1110/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'linoleum', 			NULL, NULL);
call insert_material('PB2: Tepper (tiska tiara)', 'na', 'na', 								NULL, 'kg', 1, 2570/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'carpet', 				NULL, NULL);
call insert_material('PB2: Granitt', 'na', 'na', 											NULL, 'kg', 1, 1654/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'granite', 				NULL, NULL);
call insert_material('PB2: Betong HD inkl terrazzo trapp (Vanlig) inkl armering', 'na', 'na',NULL, 'kg', 1, 117/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'concrete', 			NULL, NULL);
call insert_material('PB2: Betong HDinkl terrazzo trapp (FA) inkl armering', 'na', 'na', 	NULL, 'kg', 1, 115/1000, NULL, 		'FutureBuilt Papirbredden 2', 	'concrete', 			NULL, NULL);
call insert_material('PB2: Takpapp,skråtak, 1 lag mono', 'na', 'na', 						NULL, 'kg', 1, 1430/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'tbd', 					NULL, NULL);
call insert_material('PB2: Takpapp terrasse, 1 lag base', 'na', 'na', 						NULL, 'kg', 1, 1240/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'tbd', 					NULL, NULL);
call insert_material('PB2: Takpapp terrasse, 1 lag top', 'na', 'na', 						NULL, 'kg', 1, 1375/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'tbd', 					NULL, NULL);
call insert_material('PB2: Isolasjon, rockwool', 'na', 'na', 								NULL, 'kg', 1, 1224/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'insulation', 			NULL, NULL);
call insert_material('PB2: Multicem', 'na', 'na', 											NULL, 'kg', 1, 613/1000, NULL, 		'FutureBuilt Papirbredden 2', 	'cement', 					NULL, NULL);
call insert_material('PB2: Spunt', 'na', 'na', 												NULL, 'kg', 1, 1200/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'steel', 					NULL, NULL);
call insert_material('PB2: Søyler og dragere FA', 'na', 'na', 								NULL, 'kg', 1, 208/1000, NULL, 		'FutureBuilt Papirbredden 2', 	'tbd', 					NULL, NULL);
call insert_material('PB2: Betong', 'na', 'na', 											NULL, 'kg', 1, 136/1000, NULL, 		'FutureBuilt Papirbredden 2', 	'concrete', 			NULL, NULL);
call insert_material('PB2: Armering', 'na', 'na', 											NULL, 'kg', 1, 350/1000, NULL, 		'FutureBuilt Papirbredden 2', 	'tbd', 					NULL, NULL);
call insert_material('PB2: Isolasjon EPS', 'na', 'na', 										NULL, 'kg', 1, 4196/1000, NULL, 	'FutureBuilt Papirbredden 2', 	'insulation', 			NULL, NULL);
call insert_material('PB2: Bæresystem stål', 'na', 'na', 									NULL, 'kg', 1, 850/1000, NULL, 		'FutureBuilt Papirbredden 2', 	'steel', 				NULL, NULL);
call insert_material('PB2: Søyler og dragere Vanlig', 'na', 'na', 							NULL, 'kg', 1, 295/1000, NULL, 		'FutureBuilt Papirbredden 2', 	'tbd', 					NULL, NULL);

			-- Insert transport emission factors if they are not already in the database
			# TEMPLATE: INSERT INTO GWP_transport (mode, name, GWP_pertkm) VALUES ('', '', );

		-- Insert materials into the inventory of the building, connected to a certain building element
		# TEMPLATE: call insert_materialInventory(@BLD, level, 'name_material', 							quantity, 'FU', RSL (optional), 	'nameT1', T1dist, 'nameT2', T2dist, 'nameT3', T3dist, A5, 		'CountryProduction' (optional), 'CityProduction' (optional));
	# 23
call insert_materialInventory(@BLD, 23, 'PB2: Naturstein', 											157*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 23, 'PB2: Aluvinduer', 											129*1000, 'kg', 25, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 23, 'PB2: Vinduer trekarm m/alubeslag', 						8*1000, 'kg', 25, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 23, 'PB2: Gips', 												17*1000, 'kg', 20, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 23, 'PB2: Isolasjon, Glava 350mm', 								10*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 23, 'PB2: Tre', 												31*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 23, 'PB2: Vind- /damp-sperre', 									0.1*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 23, 'PB2: Vind- /damp-sperre', 									0.1*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 23, 'PB2: OSB-plate', 											5*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
	# 24
call insert_materialInventory(@BLD, 24, 'PB2: Gips', 												98*1000, 'kg', 20, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 24, 'PB2: Tre + glass kontorfront', 							21*1000, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 24, 'PB2: Tre', 												7*1000, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 24, 'PB2: Isolasjon, Glava 350mm', 								6*1000, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 24, 'PB2: Stålprofiler innvendige vegger', 						10*1000, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 24, 'PB2: Maling', 												8*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
	# 25
call insert_materialInventory(@BLD, 25, 'PB2: Himling, mineralull T-profil (glava aqx-venu)', 		3*1000, 'kg', 15, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 25, 'PB2: Himling, mineralull limt', 							0.395*1000, 'kg', 15,NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 25, 'PB2: Linoleum (Forbo)', 									21*1000, 'kg', 25, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 25, 'PB2: Tepper (tiska tiara)', 								4*1000, 'kg', 25, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 25, 'PB2: Granitt', 											59*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 25, 'PB2: Betong HD inkl terrazzo trapp (Vanlig) inkl armering',4805*1000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 25, 'PB2: Betong HDinkl terrazzo trapp (FA) inkl armering', 	1990*1000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
	# 26
call insert_materialInventory(@BLD, 26, 'PB2: Takpapp,skråtak, 1 lag mono', 						4*1000, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 26, 'PB2: Takpapp terrasse, 1 lag base', 						2*1000, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 26, 'PB2: Takpapp terrasse, 1 lag top', 						3*1000, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 26, 'PB2: Isolasjon, rockwool', 								89*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 26, 'PB2: Tre', 												23*1000, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
	# 21
call insert_materialInventory(@BLD, 21, 'PB2: Multicem', 											1820*1000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 21, 'PB2: Spunt', 												200*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 21, 'PB2: Søyler og dragere FA', 								263*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 21, 'PB2: Betong', 												2696*1000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 21, 'PB2: Armering', 											90*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 21, 'PB2: Betong', 												1547*1000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 21, 'PB2: Armering', 											96*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 21, 'PB2: Isolasjon EPS', 										3*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
	# 22
call insert_materialInventory(@BLD, 22, 'PB2: Bæresystem stål', 									60*1000, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
call insert_materialInventory(@BLD, 22, 'PB2: Søyler og dragere Vanlig', 							1627*1000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);



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