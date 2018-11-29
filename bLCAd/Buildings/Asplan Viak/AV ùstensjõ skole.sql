-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Workflow for inserting a new building / updating a building entry --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
/* 
I get the same results as in the spreadsheet. NB: Transport emissions in the spreadsheet are only transport from A1A3 materials.


*/
USE bLCAd;


-- -- -- -- -- -- -- -- --
-- Define building name --
-- -- -- -- -- -- -- -- --
-- Define the building_identifier that will be used to reference the building (composed of a letter for the typology and a three digit number)
SET @BLD='S002';

-- -- -- -- -- -- --
-- Insert building --
-- -- -- -- -- -- --
-- First insert building
call insert_building(@BLD,
/*Name:*/						'Oestensjoe skole',
/*Project:*/					'Asplan Viak',
/*Calculation method:*/			'Excel',
/*Main data type:*/				'EPD',
/*Study type:*/					'industry, certification', 
/*Year of study:*/				2017,

/*Lifetime:*/					60,
/*floor area:*/					2084.7+1544.7,
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
/*typology:*/					'school', 
/*construction type:*/			'concrete', 
/*Country:*/					'Norway',
/*city:*/						'Oslo', 
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

		-- call insert_material('Stål, hulprofil', 'Specific', 'EPD', 										NULL, 'kg', 1, 2.290, NULL, 'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD%2000253%20Cold-formed-welded-structural-hollow-sections-Type-31-GODKJENT.pdf', 'steel', NULL, NULL);
		call insert_material('Betong B35, lavkarbon klasse A', 'Generic', 'Other', 						NULL, 'm3', 2400.000, 210.000, NULL, 'http://www.byggutengrenser.no/filer/nedlasting/NB%2037%20-%20Lavkarbonbetong-16juni15.pdf', 'concrete', NULL, NULL);
		-- call insert_material('Armeringsstål, 100 % resirk', 'Specific', 'EPD', 							NULL, 'kg', 1, 0.330, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Betongvarer/NEPD-434-305-EN_Steel-reinforcement-products-for-concrete.pdf', 'steel', NULL, NULL);
		call insert_material('EPS', 'Specific', 'EPD', 													NULL, 'm3', 15.000, 92.632, NULL, 'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD-322-185-NO%20EPS-isolasjon%20trykkfasthet-80%20rev-June-2015%20GK.pdf', 'plastics', NULL, NULL);
		call insert_material('Stål, HSQ-profil', 'Specific', 'EPD', 									NULL, 'kg', 1, 2.870, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/St%C3%A5lkonstruksjoner/76_Type-12--Welded-plated-beams--like-hat-profile--HSQ-beam.pdf', 'steel', NULL, NULL);
		-- call insert_material('Stål, I, H, U, L, T profil', 'Specific', 'EPD', 							NULL, 'kg', 1, 1.320, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/St%C3%A5lkonstruksjoner/81_Type-22--IHULT-and-wide-flats-selections.pdf', 'steel', NULL, NULL);
		-- call insert_material('Limtre', 'Specific', 'EPD', 												NULL, 'm3', 430.000, 39.000, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Heltreprodukter/NEPD-346-236-NO_Limtre.pdf', 'timber', NULL, NULL);
		-- call insert_material('Massivtre', 'Specific', 'EPD', 											NULL, 'm3', 500.000, 78.100, NULL, 'Uoffisielle tall fra ny EPD', 'timber', NULL, NULL);
		-- call insert_material('Konstruksjonstrevirke', 'Specific', 'EPD', 								NULL, 'm3', 360.000, 53.000, NULL, 'http://epd-norge.no/getfile.php/EPDer/Byggevarer/Heltreprodukter/NEPD-308-179-NO_Strutural-timber--Norwegian-version_no.pdf', 'timber', NULL, NULL);
		call insert_material('Steinull Rockwool murplate', 'Specific', 'EPD', 							NULL, 'm3', 40.600, 48.054, NULL, 'Skaleringsfaktor 1,4; http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Isolasjon/NEPD-00131E_rev1_ROCKWOOL-isolering%281%29.pdf', 'tbd', NULL, NULL);
		call insert_material('Vindsperre Nordgips Windliner', 'Specific', 'EPD', 						NULL, 'm2', 7.200, 1.800, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Bygningsplater/NEPD-109-177-EN_Norgips-Windliner-X-utvendig-X-type-EH2.pdf', 'vapour/wind barrier', NULL, NULL);
		call insert_material('Dampsperre Baca', 'Specific', 'EPD', 										NULL, 'm2', 0.163, 0.424, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Takbelegg_membraner/273N_Baca-Dampsperre.pdf', 'vapour/wind barrier', NULL, NULL);
		call insert_material('Stål, 0% resirkulert', 'Generic', 'Ecoinvent', 							NULL, 'kg', 1, 2.320, NULL, 'Comment', 'steel', NULL, NULL);
		call insert_material('Ytterdør, tre/aluminium', 'Generic', 'Ecoinvent', 						NULL, 'm2', 57.100, 125.041, NULL, 'Comment', 'doors', NULL, NULL);
		call insert_material('Ytterdør, glass/aluminium', 'Specific', 'EPD', 							NULL, 'm2', 48.500, 104.000, NULL, 'www.jansen.com%2Fen%2Fbuilding-systems%2Fdownload-centre%2Fcertificates%2Fdownload%2Fepd-tueren-212%2F&usg=AFQjCNGly-_JfgSEuQ4QIU-6VFKQB38Gkw&sig2=bHO99SBnKQnX16YZ-UiVwQ', 'doors', NULL, NULL);
		call insert_material('Skyvedør, glass', 'Specific', 'EPD', 										NULL, 'm2', 34.102, 105.876, NULL, 'https://www.dormakaba.com/resource/blob/17246/6a88ba0da4aadecb38dd08a92cbeb3a1/epd-st-flex-green-en-data.pdf', 'doors', NULL, NULL);
		-- call insert_material('Vindu, 3-lags, åpningsbart, med aluminiumbeslag', 'Specific', 'EPD', 		NULL, 'm2', 37.354, 88.585, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/D%C3%B8rer%20og%20vinduer/NEPD256E_NorDan-NTech-Fully-reversible-window-105-80.pdf', 'windows', NULL, NULL);
		call insert_material('Teglstein', 'Generic', 'Other', 											NULL, 'm3', 1850.000, 444.000, NULL, 'kgr.no', 'stone', NULL, NULL);
		call insert_material('Fermacell fibergips', 'Specific', 'EPD', 									NULL, 'm3', 1180.000, 586.400, NULL, 'http://www.hunton.no/wp-content/uploads/2016/05/EPD-Fermacell_Gypsum_Fibreboard-1.pdf', 'gypsum', NULL, NULL);
		-- call insert_material('Glassull', 'Specific', 'EPD', 											NULL, 'm3', 16.500, 21.143, NULL, 'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD%20221N%20Glava%20glass%20ull.pdf', 'insulation', NULL, NULL);
		-- call insert_material('Innerdør, tre', 'Specific', 'EPD', 										NULL, 'm2', 31.075, 35.651, NULL, 'http://epd-norge.no/doerer-og-vinduer/nordic-inner-door-without-frame-52x825x2040-mm-article1297-319.html', 'doors', NULL, NULL);
		call insert_material('Innerdør, stål', 'Specific', 'EPD', 										NULL, 'm2', 59.521, 52.785, NULL, 'Comment', 'doors', NULL, NULL);
		call insert_material('Innerdør, glass/stål', 'Specific', 'EPD', 								NULL, 'm2', 48.500, 104.000, NULL, 'www.jansen.com%2Fen%2Fbuilding-systems%2Fdownload-centre%2Fcertificates%2Fdownload%2Fepd-tueren-212%2F&usg=AFQjCNGly-_JfgSEuQ4QIU-6VFKQB38Gkw&sig2=bHO99SBnKQnX16YZ-UiVwQ', 'doors', NULL, NULL);
		-- call insert_material('Innerdør, glass/tre', 'Generic', 'Ecoinvent', 							NULL, 'm2', 57.100, 64.568, NULL, 'Comment', 'doors', NULL, NULL);
		call insert_material('Vindu, 1-lags, ikke åpningsbart, med aluminiumbeslag', 'Specific', 'EPD', NULL, 'm2', 12.268, 27.468, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/D%C3%B8rer%20og%20vinduer/NEPD256E_NorDan-NTech-Fully-reversible-window-105-80.pdf', 'windows', NULL, NULL);
		-- call insert_material('Keramisk flis + PP-membran', 'Specific', 'EPD', 							NULL, 'm2', 14.200, 18.030, NULL, 'https://epd-online.com/EmbeddedEpdList/Download/5596', 'tbd', NULL, NULL);
		call insert_material('Treullsementplate, 25 mm, Troldtekt', 'Specific', 'EPD', 					NULL, 'm2', 9.700, 2.018, NULL, 'http://www.troldtekt.com/~/media/Files/EPD%20and%20DoPs/Troldtekt_EPD.pdf', 'tbd', NULL, NULL);
		-- call insert_material('Gips', 'Specific', 'EPD', 												NULL, 'm3', 720.000, 212.800, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Bygningsplater/NEPD-113-177-EN_Norgips-Standard-type-A.pdf', 'gypsum', NULL, NULL);
		call insert_material('Grønne sylomerklosser', 'Generic', 'Ecoinvent', 							NULL, 'm2', 0.099, 0.488, NULL, 'Ecoinvent, PUR, 4 puter per m2', 'plastics', NULL, NULL);
		call insert_material('Sponplate', 'Specific', 'EPD', 											NULL, 'm3', 660.000, 196.000, NULL, 'http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Bygningsplater/274N_Forestia-sponplater.pdf', 'timber', NULL, NULL);
		-- call insert_material('Trinnlydplate Glava', 'Specific', 'EPD', 									NULL, 'm3', 66.000, 84.571, NULL, 'Skaleringsfaktor 4; http://epd.nsp01cp.nhosp.no/getfile.php/EPDer/Byggevarer/Isolasjon/NEPD-221N_Glava_glass_ull_no.pdf', 'tbd', NULL, NULL);
		call insert_material('Påstøp', 'Generic', 'Other', 												NULL, 'm3', 2400.000, 210.000, NULL, 'Betong B35, lavkarbon klasse A (NBF Publikasjon 37)', 'concrete', NULL, NULL);
		call insert_material('Linoleum', 'Specific', 'EPD', 											NULL, 'm2', 2.900, 2.600, NULL, 'http://construction-environment.com/download/Cffb648dX13dea6483bcX24d6/EPD_ERF_2013811_E.pdf', 'linoleum', NULL, NULL);
		call insert_material('Trinnlydsdempende belegg i kork', 'na', 'na', 							NULL, 'm3', 200.000, 292.000, NULL, 'Simapro, http://www.kork24.no/shop/37-vibrasjonsdempere-kork-isolasjon-korkfliser-hoey-tetthet/371-kork-termisk-og-lydisolering-isolasjonsplater-vegg-high-density-50x500x1000mm/', 'tbd', NULL, NULL);
		call insert_material('Lett-tak', 'Specific', 'Custom', 											NULL, 'm2', 55.000, 62.000, NULL, 'http://lett-tak.no/wp-content/uploads/2014/07/Aasveien_skole_klimagassregnskap_Lett-Tak.pdf', 'tbd', NULL, NULL);
		call insert_material('Betong B30, lavkarbon klasse A', 'Generic', 'Other', 						NULL, 'm3', 2400.000, 200.000, NULL, 'http://www.byggutengrenser.no/filer/nedlasting/NB%2037%20-%20Lavkarbonbetong-16juni15.pdf', 'concrete', NULL, NULL);


			-- Insert transport emission factors if they are not already in the database
			# TEMPLATE: INSERT INTO GWP_transport (mode, name, GWP_pertkm) VALUES ('', '', );

		-- Insert materials into the inventory of the building, connected to a certain building element
		# TEMPLATE: call insert_materialInventory(@BLD, level, 'name_material', 							quantity, 'FU', RSL_(optional), 	'nameT1', T1dist, 'nameT2', T2dist, 'nameT3', T3dist, A5, 		'CountryProduction' (optional), 'CityProduction' (optional));

			# 21
				# 215
		call insert_materialInventory(@BLD, 215, 'Stål, hulprofil', 									15892.800, 'kg', 60, 	'AV: Lastebil', 1500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# 216
		call insert_materialInventory(@BLD, 216, 'Betong B35, lavkarbon klasse A', 						110.900, 'm3', 60, 		'AV: Betongbil', 15, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 216, 'Armeringsstål, 100 % resirk', 						13308.000, 'kg', 60, 	'AV: Skip', 1600, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 216, 'EPS', 												52.320, 'm3', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
			# 22
		call insert_materialInventory(@BLD, 22, 'Stål, HSQ-profil', 									7938.700, 'kg', 60, 	'AV: Lastebil', 1500, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 22, 'Stål, I, H, U, L, T profil', 							100.100, 'kg', 60, 		'AV: Lastebil', 1500, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 22, 'Stål, hulprofil', 										18256.700, 'kg', 60, 	'AV: Lastebil', 1500, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 22, 'Limtre', 												44.956, 'm3', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
			# 23
				# 231
		call insert_materialInventory(@BLD, 231, 'Betong B35, lavkarbon klasse A', 						149.080, 'm3', 60, 		'AV: Betongbil', 15, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 231, 'Armeringsstål, 100 % resirk', 						11926.400, 'kg', 60, 	'AV: Skip', 1600, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 231, 'Massivtre', 											310.000, 'm3', 60, 		'AV: Lastebil', 1500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 231, 'Konstruksjonstrevirke', 								75.532, 'm3', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 231, 'Steinull Rockwool murplate', 							92.041, 'm3', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 231, 'EPS', 												113.794, 'm3', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 231, 'Vindsperre Nordgips Windliner', 						79.850, 'm2', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 231, 'Dampsperre Baca', 									1534.400, 'm2', 60, 	'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 231, 'Stål, 0% resirkulert', 								5005.000, 'kg', 60, 	'AV: Lastebil', 1500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# 234	
		call insert_materialInventory(@BLD, 234, 'Ytterdør, tre/aluminium', 							3.250, 'm2', 30, 		'AV: Lastebil', 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 234, 'Ytterdør, glass/aluminium', 							17.840, 'm2', 30, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 234, 'Skyvedør, glass', 									9.930, 'm2', 30, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 234, 'Vindu, 3-lags, åpningsbart, med aluminiumbeslag', 	230.000, 'm2', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# 235
		call insert_materialInventory(@BLD, 235, 'Teglstein', 											193.000, 'm3', 60, 		'AV: Lastebil', 1500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
			# 24
				# 241
		call insert_materialInventory(@BLD, 241, 'Betong B35, lavkarbon klasse A', 						144.370, 'm3', 60, 		'AV: Betongbil', 15, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 241, 'Armeringsstål, 100 % resirk', 						11549.600, 'kg', 60, 	'AV: Skip', 1600, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 241, 'Massivtre', 											68.818, 'm3', 60, 		'AV: Lastebil', 1500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 241, 'Konstruksjonstrevirke', 								0.330, 'm3', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 241, 'Fermacell fibergips', 								36.687, 'm3', 20, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 241, 'Glassull', 											261.365, 'm3', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# 244
		call insert_materialInventory(@BLD, 244, 'Innerdør, tre', 										156.580, 'm2', 30, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 244, 'Innerdør, stål', 										45.460, 'm2', 30, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 244, 'Innerdør, glass/stål', 								28.000, 'm2', 50, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 244, 'Innerdør, glass/tre', 								237.000, 'm2', 30, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 244, 'Skyvedør, glass', 									4.200, 'm2', 30, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 244, 'Vindu, 1-lags, ikke åpningsbart, med aluminiumbeslag',113.730, 'm2', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# 246
		call insert_materialInventory(@BLD, 246, 'Keramisk flis + PP-membran', 							999.000, 'm2', 30, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
			# 25
		call insert_materialInventory(@BLD, 25, 'Betong B35, Lavkarbon klasse A', 						465.084, 'm3', 60, 		'AV: Betongbil', 15, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Armeringsstål, 100 % resirk', 							55810.026, 'kg', 60, 	'AV: Skip', 1600, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Massivtre', 											404.859, 'm3', 60, 		'AV: Lastebil', 1500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Glassull', 											139.395, 'm3', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Treullsementplate, 25 mm, Troldtekt', 					2616.712, 'm2', 50, 	'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Gips', 												26.551, 'm3', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'EPS', 													297.296, 'm3', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Konstruksjonstrevirke', 								168.406, 'm3', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Grønne sylomerklosser', 								1871.180, 'm2', 60, 	'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Sponplate', 											41.166, 'm3', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Trinnlydplate Glava', 									9.570, 'm3', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Påstøp', 												54.164, 'm3', 60, 		'AV: Betongbil', 15, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# 255
		call insert_materialInventory(@BLD, 25, 'Linoleum', 											3357.660, 'm2', 30, 	'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 25, 'Trinnlydsdempende belegg i kork', 						10.073, 'm3', 30, 		'AV: Lastebil', 500, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
			# 26
				# 261
		call insert_materialInventory(@BLD, 261, 'Betong B35, lavkarbon klasse A', 						32.458, 'm3', 60, 		'AV: Betongbil', 15, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 261, 'Armeringsstål, 100 % resirk', 						49230.617, 'kg', 60, 	'AV: Skip', 1600, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 261, 'EPS', 												237.585, 'm3', 60, 		'AV: Lastebil', 500, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 261, 'Lett-tak', 											1367.517, 'm2', 60, 	'AV: Lastebil', 500, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
			# 28
		call insert_materialInventory(@BLD, 28, 'Betong B30, lavkarbon klasse A', 						18.279, 'm3', 60, 		'AV: Betongbil', 15, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 28, 'Armeringsstål, 100 % resirk', 							2193.480, 'kg', 60, 	'AV: Skip', 1600, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);



 

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