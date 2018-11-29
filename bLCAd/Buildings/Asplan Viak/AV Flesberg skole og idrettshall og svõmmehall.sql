-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Flesberg skole, sportshall, og svommehall --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
/* 
Fått tilgang på denne fra Asplan Viak

This script contains two buildings:
	- The school building with sports building
	- The swimming hall (below)

Transport emissions (A4) are not calculated, but the necessary information is given in excel, can therefore add this if I wish.

Mistakes found in excel for school and sporst building:
- 24, 'Systemvegg, Loc Wall tettvegg 42 dB',: The calculation formula for replacements is missing a factor of 1 for replacements, therefore the emissions become negative in the replacement phase, and lifetime emissions become zero. (5428 kgCO2 too small, corresponding to 0.01kgCO2/m2yr too small)
- 25, 'Trinnlydplate Glava': The unit of the quantity is not the same as the emission value. In the comments it is described "glava 20mm", therefore I am converting the 2591m2 to 51.82m3 (factor of 0.002), which gives considerably lower emissions. 218686kgCO2eq too large.
In total it leads to 19% too high results in excel.
The reduction they found was 49.6% but should have been 57.6%.

Mistakes found in excel for swimming hall:
- NONE, same results

*/
USE bLCAd;


-- -- -- -- -- -- -- -- --
-- Define building name --
-- -- -- -- -- -- -- -- --
-- Define the building_identifier that will be used to reference the building (composed of a letter for the typology and a three digit number)
SET @BLD='S001';

-- -- -- -- -- -- --
-- Insert building --
-- -- -- -- -- -- --
-- First insert building
call insert_building(@BLD,
/*Name:*/						'Flesberg skole og idrettshall',
/*Project:*/					'Asplan Viak',
/*Calculation method:*/			'Excel',
/*Main data type:*/				'EPD',
/*Study type:*/					'industry, certification', 
/*Year of study:*/				2018,

/*Lifetime:*/					60,
/*floor area:*/					4759+1905, -- school + sports building
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
	
/*comments:*/					'This is part of an accounting for school, sportsbuilding, and swimminghall. The swimminghall is here a separate building.', 
/*typology:*/					'school', 
/*construction type:*/			'na', 
/*Country:*/					'Norway',
/*city:*/						'Flesberg', 
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

		call insert_material('Betong B30M60 Lavkarbon B Unicon Kongsberg', 'Specific', 'Custom', 		NULL, 'm3', 2400.000, 218.590, NULL, 'Prosjektspesifikk EPD for Flesberg skole', 																						'concrete', NULL, NULL);
		call insert_material('Armeringsstål, 100 % resirk', 'Specific', 'EPD', 							NULL, 'kg', 1, 0.330, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Betongvarer/NEPD-434-305-EN_Steel-reinforcement-products-for-concrete.pdf', 		'steel', NULL, NULL);
		call insert_material('Betong B30, lavkarbon klasse B', 'Generic', 'Other', 						NULL, 'm3', 2400.000, 240.000, NULL, 'http://www.byggutengrenser.no/filer/nedlasting/NB%2037%20-%20Lavkarbonbetong-16juni15.pdf', 										'concrete', NULL, NULL);
		call insert_material('Massivtre', 'Specific', 'EPD', 											NULL, 'm3', 500.000, 78.100, NULL, 'Uoffisielle tall fra ny EPD', 																										'timber', NULL, NULL);
		call insert_material('Royalimpregnert trelast', 'Specific', 'EPD', 								NULL, 'm3', 528.000, 118.000, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Heltreprodukter/294_Royalimpregnert-trelast.pdf', 						'timber', NULL, NULL);
		call insert_material('Vindu, 3-lags, åpningsbart, med aluminiumbeslag', 'Specific', 'EPD',		NULL, 'm2', 37.354, 88.585, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/D%C3%B8rer%20og%20vinduer/NEPD256E_NorDan-NTech-Fully-reversible-window-105-80.pdf', 'windows', NULL, NULL);
		call insert_material('Glassfasade', 'Specific', 'EPD', 											NULL, 'm2', 26.698, 85.000, NULL, 'Snitt, schüco glassfasade', 																											'glass', NULL, NULL);
		call insert_material('Rockwool Redair Flex isolasjon', 'Specific', 'EPD', 						NULL, 'm3', 63.800, 75.514, NULL, 'Comment', 																															'insulation', NULL, NULL);
		call insert_material('Konstruksjonstrevirke', 'Specific', 'EPD', 								NULL, 'm3', 360.000, 53.000, NULL, 'http://epd-norge.no/getfile.php/EPDer/Byggevarer/Heltreprodukter/NEPD-308-179-NO_Strutural-timber--Norwegian-version_no.pdf', 		'timber', NULL, NULL);
		call insert_material('Gips', 'Specific', 'EPD', 												NULL, 'm3', 720.000, 212.800, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Bygningsplater/NEPD-113-177-EN_Norgips-Standard-type-A.pdf', 				'gypsum', NULL, NULL);
		call insert_material('Keramisk flis + PP-membran', 'Specific', 'Custom', 						NULL, 'm2', 14.200, 18.030, NULL, 'Lagt til PP og flislim + sementmørtel, ref Oddbjørn:; https://epd-online.com/EmbeddedEpdList/Download/5596', 						'ceramic', NULL, NULL);
		call insert_material('Trekledning', 'Generic', 'Ecoinvent', 									NULL, 'm3', 13.440, 2.490, NULL, 'Ecoinvent, wood cladding RER', 																										'timber', NULL, NULL);
		call insert_material('Glassull', 'Specific', 'EPD', 											NULL, 'm3', 16.500, 21.143, NULL, 'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD%20221N%20Glava%20glass%20ull.pdf', 										'insulation', NULL, NULL);
		call insert_material('Stålstender', 'Specific', 'EPD', 											NULL, 'm', 0.650, 1.510, NULL, 'http://epd-norge.no/getfile.php/EPDer/Byggevarer/Bygningsplater/NEPD00171N_rev1_ST-LPROFIL-TIL-INNERVEGG.pdf', 							'steel', NULL, NULL);
		call insert_material('Glass Front systemvegg', 'Specific', 'EPD', 								NULL, 'm2', 26.698, 90.790, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Bygningsplater/NEPD-331-214-NO_Glass-Front-systemvegg.pdf', 				'tbd', NULL, NULL);
		call insert_material('Innerdør, tre', 'Specific', 'EPD', 										NULL, 'm2', 31.075, 35.651, NULL, 'http://epd-norge.no/doerer-og-vinduer/nordic-inner-door-without-frame-52x825x2040-mm-article1297-319.html', 							'doors', NULL, NULL);
		call insert_material('Innerdør, glass/tre', 'Generic', 'Ecoinvent', 							NULL, 'm2', 57.100, 64.568, NULL, 'Comment', 																															'doors', NULL, NULL);
		call insert_material('Systemvegg, Loc Wall tettvegg 42 dB', 'Specific', 'EPD', 					NULL, 'm2', 29.115, 23.600, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Bygningsplater/NEPD-1197-370_Loc-Wall-systemvegg.pdf', 						'tbd', NULL, NULL);
		call insert_material('Limtre', 'Specific', 'EPD', 												NULL, 'm3', 430.000, 39.000, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Heltreprodukter/NEPD-346-236-NO_Limtre.pdf', 								'timber', NULL, NULL);
		call insert_material('Stål, hulprofil', 'Specific', 'EPD', 										NULL, 'kg', 1, 2.290, NULL, 'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD%2000253%20Cold-formed-welded-structural-hollow-sections-Type-31-GODKJENT.pdf', 'steel', NULL, NULL);
		call insert_material('Stål, I, H, U, L, T profil', 'Specific', 'EPD', 							NULL, 'kg', 1, 1.320, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/St%C3%A5lkonstruksjoner/81_Type-22--IHULT-and-wide-flats-selections.pdf', 		'steel', NULL, NULL);
		call insert_material('Betong B35M45 Lavkarbon B Unicon Kongsberg', 'Specific', 'Custom', 							NULL, 'm3', 2400.000, 250.190, NULL, 'Prosjektspesifikk EPD for Flesberg skole', 																	'concrete', NULL, NULL);
		call insert_material('Betong B25, lavkarbon klasse B', 'Generic', 'Other', 						NULL, 'm3', 2400.000, 220.000, NULL, 'http://www.byggutengrenser.no/filer/nedlasting/NB%2037%20-%20Lavkarbonbetong-16juni15.pdf', 										'concrete', NULL, NULL);
		call insert_material('EPS Trykkfasthet 80', 'Specific', 'EPD', 									NULL, 'm3', 15.000, 92.632, NULL, 'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD-322-185-NO%20EPS-isolasjon%20trykkfasthet-80%20rev-June-2015%20GK.pdf', 	'plastics', NULL, NULL);
		call insert_material('XPS Sundolitt Trykkfasthet 250', 'na', 'na', 								NULL, 'm3', 27.273, 100.909, NULL, 'Comment', 																															'insulation', NULL, NULL);
		call insert_material('Himlingsplate, 50 mm, Troldtekt', 'Specific', 'EPD', 						NULL, 'm2', 15.000, 3.120, NULL, 'http://www.troldtekt.com/~/media/Files/EPD%20and%20DoPs/Troldtekt_EPD.pdf', 															'tbd', NULL, NULL);
		call insert_material('Oppheng til himling', 'na', 'Custom', 									NULL, 'm2', 3.300, 3.610, NULL, 'Sammensatt', 																															'tbd', NULL, NULL);
		call insert_material('Systemhimling med glava 20 mm', 'Specific', 'EPD', 						NULL, 'm2', 83.300, 5.682, NULL, 'Comment', 																															'tbd', NULL, NULL);
		call insert_material('Systemhimling med glava 40 mm', 'na', 'na',	 							NULL, 'm2', 83.300, 7.680, NULL, 'Comment', 																															'tbd', NULL, NULL);
		call insert_material('Vinyl', 'Specific', 'EPD', 												NULL, 'm2', 4.300, 6.700, NULL, 'https://epd-online.com/EmbeddedEpdList/Download/8437', 																				'vinyl', NULL, NULL);
		call insert_material('Trinnlydplate Glava', 'Specific', 'EPD', 									NULL, 'm3', 66.000, 84.571, NULL, 'Skaleringsfaktor 4; http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Isolasjon/NEPD-221N_Glava_glass_ull_no.pdf', 			'tbd', NULL, NULL);
		call insert_material('Avrettingsmasse Hey\'di Propan Basic', 'Specific', 'EPD', 				NULL, 'm3', 1850.000, 316.350, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Sement/173_Avrettingsmasse--Proplan-Basic-og-Proplan-Fin----------------------------------------------------------------------------------.pdf', 'tbd', NULL, NULL);
		call insert_material('Asfaltpapp, dobbel', 'Specific', 'EPD', 									NULL, 'm2', 8.500, 5.090, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Takbelegg_membraner/NEPD269E_Multi-layer-fully-torched-modified-bitumen-roof-waterproofing-system.pdf', 'tbd', NULL, NULL);
		call insert_material('Lett-tak med 300 mm steinull', 'Specific', 'Custom', 						NULL, 'm2', 50.000, 55.000, NULL, 'http://lett-tak.no/wp-content/uploads/2014/07/Aasveien_skole_klimagassregnskap_Lett-Tak.pdf', 										'tbd', NULL, NULL);
		call insert_material('Stål, 20% resirkulert', 'Generic', 'Ecoinvent', 							NULL, 'kg', 1, 2.000, NULL, 'Comment', 																																	'steel', NULL, NULL);


			-- Insert transport emission factors if they are not already in the database
			# TEMPLATE: INSERT INTO GWP_transport (mode, name, GWP_pertkm) VALUES ('', '', );

		-- Insert materials into the inventory of the building, connected to a certain building element
		# TEMPLATE: call insert_materialInventory(@BLD, level, 'name_material', 							quantity, 'FU', RSL_(optional), 	'nameT1', T1dist, 'nameT2', T2dist, 'nameT3', T3dist, A5, 		'CountryProduction' (optional), 'CityProduction' (optional));

-- -- -- -- -- -- -- -- -- -- --
-- SCHOOL AND SPORTS BUILDING --
-- -- -- -- -- -- -- -- -- -- --
			# 21
		call insert_materialInventory(@BLD, 21, 'Betong B30M60 Lavkarbon B Unicon Kongsberg', 		364, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL,NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 21, 'Armeringsstål, 100 % resirk', 						40890, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
			# 23
		call insert_materialInventory(@BLD, 23, 'Betong B30, lavkarbon klasse B', 					123, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Armeringsstål, 100 % resirk', 						12165, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Massivtre', 										414, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Royalimpregnert trelast', 							4, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Royalimpregnert trelast', 							61.522, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Vindu, 3-lags, åpningsbart, med aluminiumbeslag',	558, 'm2', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Glassfasade', 										171, 'm2', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Rockwool Redair Flex isolasjon', 					556.5, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Konstruksjonstrevirke', 							15, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Glassfasade', 										94, 'm2', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Gips', 												6.383, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
			# 24
	--  call insert_materialInventory(@BLD, 24, 'Betong B30M60 Lavkarbon B Unicon Kongsberg', 		0, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 24, 'Armeringsstål, 100 % resirk', 						0, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Massivtre', 										179, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Gips', 												2.249, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 24, 'Keramisk flis + PP-membran', 						0, 'm2', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Trekledning', 										21.63, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Glassull', 											495, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Stålstender', 										12471, 'm', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Glass Front systemvegg', 							220, 'm2', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Innerdør, tre', 									438, 'm2', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Innerdør, glass/tre', 								64, 'm2', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Glass Front systemvegg', 							6, 'm2', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Systemvegg, Loc Wall tettvegg 42 dB', 				230, 'm2', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
			# 22
		call insert_materialInventory(@BLD, 22, 'Limtre', 											8, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 22, 'Limtre', 											14, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 22, 'Stål, hulprofil', 									0, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 22, 'Stål, I, H, U, L, T profil', 						0, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 22, 'Betong B30M60 Lavkarbon B Unicon Kongsberg', 		0, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 22, 'Armeringsstål, 100 % resirk', 						0, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
			# 25
	--  call insert_materialInventory(@BLD, 25, 'Betong B35M45 Lavkarbon B Unicon Kongsberg', 		0, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Betong B25, lavkarbon klasse B', 					621, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Armeringsstål, 100 % resirk', 						44760, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'EPS Trykkfasthet 80', 								1014, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'XPS Sundolitt Trykkfasthet 250', 					71, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 25, 'Betong B30M60 Lavkarbon B Unicon Kongsberg', 		0, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 25, 'Armeringsstål, 100 % resirk', 						0, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Massivtre', 										1124, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Himlingsplate, 50 mm, Troldtekt', 					1094, 'm2', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Oppheng til himling', 								1106, 'm2', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Systemhimling med glava 20 mm', 					1757, 'm2', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Systemhimling med glava 40 mm', 					1805, 'm2', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Gips', 												8.216, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Glassull', 											63.2, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Vinyl', 											4958, 'm2', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 25, 'Keramisk flis + PP-membran', 						0, 'm2', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Trinnlydplate Glava', 								2591*0.002, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Avrettingsmasse Hey\'di Propan Basic', 				81, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
			# 26
	--  call insert_materialInventory(@BLD, 26, 'Massivtre', 										0, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 26, 'Asfaltpapp, dobbel', 								3950, 'm2', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 26, 'Lett-tak med 300 mm steinull', 						3643, 'm2', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
			# 28
		call insert_materialInventory(@BLD, 28, 'Betong B30, lavkarbon klasse B', 					10, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 28, 'Stål, 20% resirkulert', 							750, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 28, 'Massivtre', 										18.4, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);

		-- ?call insert_materialInventory(@BLD, level, 'Massivtre', 							83, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);

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





-- -- -- -- -- -- --
-- SWIMMING HALL --
-- -- -- -- -- -- --

-- -- -- -- -- -- -- -- --
-- Define building name --
-- -- -- -- -- -- -- -- --
-- Define the building_identifier that will be used to reference the building (composed of a letter for the typology and a three digit number)
SET @BLD='sw001';

-- -- -- -- -- -- --
-- Insert building --
-- -- -- -- -- -- --
-- First insert building
call insert_building(@BLD,
/*Name:*/						'Flesberg skole swimming hall',
/*Project:*/					'Asplan Viak',
/*Calculation method:*/			'Excel',
/*Main data type:*/				'EPD',
/*Study type:*/					'industry, certification', 
/*Year of study:*/				2018,

/*Lifetime:*/					60,
/*floor area:*/					2344, -- swimming hall
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
	
/*comments:*/					'This is part of an accounting for school, sportsbuilding, and swimminghall. The swimminghall is here a separate building.', 
/*typology:*/					'swimming hall', 
/*construction type:*/			'na', 
/*Country:*/					'Norway',
/*city:*/						'Flesberg', 
/*built status:*/				'na', 
/*energy ambition level:*/		'na'
);


	# 21
		call insert_materialInventory(@BLD, 21, 'Betong B30M60 Lavkarbon B Unicon Kongsberg', 		73.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 21, 'Armeringsstål, 100 % resirk', 						7110.000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
			# 23
		call insert_materialInventory(@BLD, 23, 'Betong B30, lavkarbon klasse B', 					331.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Armeringsstål, 100 % resirk', 						29835.000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Massivtre', 										120.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 23, 'Royalimpregnert trelast', 							0, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Royalimpregnert trelast', 							30.058, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 23, 'Vindu, 3-lags, åpningsbart, med aluminiumbeslag',	0, 'm2', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Glassfasade', 										153.000, 'm2', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Rockwool Redair Flex isolasjon', 					216.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Konstruksjonstrevirke', 							5.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Glassfasade', 										12.000, 'm2', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 23, 'Gips', 												0.845, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
			# 24
		call insert_materialInventory(@BLD, 24, 'Betong B30M60 Lavkarbon B Unicon Kongsberg', 		37.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Armeringsstål, 100 % resirk', 						3000.000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 24, 'Massivtre', 										0, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Gips', 												0.546, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Keramisk flis + PP-membran', 						371.000, 'm2', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 24, 'Trekledning', 										0, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Glassull', 											68.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Stålstender', 										2691.000, 'm', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Glass Front systemvegg', 							90.000, 'm2', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 24, 'Innerdør, tre', 									24.000, 'm2', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 24, 'Innerdør, glass/tre', 								0, 'm2', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 24, 'Glass Front systemvegg', 							0, 'm2', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 24, 'Systemvegg, Loc Wall tettvegg 42 dB', 				0, 'm2', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
			# 22
	--  call insert_materialInventory(@BLD, 22, 'Limtre', 											0, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 22, 'Limtre', 											0, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 22, 'Stål, hulprofil', 									40000.000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 22, 'Stål, I, H, U, L, T profil', 						60000.000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 22, 'Betong B30M60 Lavkarbon B Unicon Kongsberg', 		8.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 22, 'Armeringsstål, 100 % resirk', 						1000.000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
			# 25
		call insert_materialInventory(@BLD, 25, 'Betong B35M45 Lavkarbon B Unicon Kongsberg', 		602.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 25, 'Betong B25, lavkarbon klasse B', 					0, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Armeringsstål, 100 % resirk', 						72240.000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'EPS Trykkfasthet 80', 								45.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'XPS Sundolitt Trykkfasthet 250', 					150.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Betong B30M60 Lavkarbon B Unicon Kongsberg', 		265.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Armeringsstål, 100 % resirk', 						32000.000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 25, 'Massivtre', 										0, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Himlingsplate, 50 mm, Troldtekt', 					212.000, 'm2', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Oppheng til himling', 								200.000, 'm2', 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 25, 'Systemhimling med glava 20 mm', 					0, 'm2', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Systemhimling med glava 40 mm', 					24.000, 'm2', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Gips', 												0.260, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Glassull', 											2.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 25, 'Vinyl', 											0, 'm2', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Keramisk flis + PP-membran', 						600.000, 'm2', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 25, 'Trinnlydplate Glava', 								0*0.002, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Avrettingsmasse Hey\'di Propan Basic', 				23.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
			# 26
		call insert_materialInventory(@BLD, 26, 'Massivtre', 										36.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 26, 'Asfaltpapp, dobbel', 								1505.000, 'm2', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 26, 'Lett-tak med 300 mm steinull', 						0, 'm2', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
			# 28
		call insert_materialInventory(@BLD, 28, 'Betong B30, lavkarbon klasse B', 					10.000, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 28, 'Stål, 20% resirkulert', 							750.000, 'kg', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);
	--  call insert_materialInventory(@BLD, 28, 'Massivtre', 										0, 'm3', 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL);


	call calculate_building(@BLD);