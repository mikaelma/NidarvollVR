-- -- -- -- -- -- -- -- 
-- ZEB Multikomfort --
-- -- -- -- -- -- -- -- 
/* 
A4 is calculated in the spreadsheet but not included in the summary and stated system boundary, therefore not including A4 now (can change my mind later).

Mistakes found in spreadsheet calculations:
- 23 - Wrong reference to material 'UV wind barrier Isola PET' leading to 30 deficit
- 25 - Floor on ground - 'Glava, EPDnr 221: Glass wool, Cradle-to-gate':  Not multiplied by emission factor leading to a value of 2067.6 instead of the correct 1178.5< difference of 889.1
- 25 - 'Norwegian I-beam from Byggma EPD': Wrong reference to material in library, which means the value in spreadsheet is 296 too small
- 26: Exactly the same as for 25 'Glava, EPDnr 221: Glass wool, Cradle-to-gate', 2054.05 instead of 1170.811 difference 883.24
- 49: PV material factor not used.. some numbers are written in directly.. Im using factor from library which gives lager result
- 69: The summation is mistakenly(I suppose?) not including the entries on floor heating
After these mistakes are accounted for, I get the same results (exept some small rounding differences)
*/
USE bLCAd;


-- -- -- -- -- -- -- -- --
-- Define building name --
-- -- -- -- -- -- -- -- --
-- Define the building_identifier that will be used to reference the building (composed of a letter for the typology and a three digit number)
SET @BLD='R002';

-- -- -- -- -- -- --
-- Insert building --
-- -- -- -- -- -- --
-- First insert building
call insert_building(@BLD,
/*Name:*/						'ZEB Multikomfort',
/*Project:*/					'ZEB',
/*Calculation method:*/			'Excel',
/*Main data type:*/				'Mixed',
/*Study type:*/					'published research', 
/*Year of study:*/				2014,

/*Lifetime:*/					60,
/*floor area:*/					202,
/*heated volume:*/				610, /*from Torhildur et al.*/
/*area_footprint:*/				NULL,
/*area roof:*/					NULL,
/*area wall:*/					229,/*from Torhildur et al.*/
/*area windows and doors:*/		59.9,/*from Torhildur et al.*/

/*heatloss number:*/			NULL,
/*uval_walls:*/					0.11,
/*uval_windows:*/				0.75,
/*uval_doors:*/					0.75,
/*uval_ground:*/				0.08,
/*uval_roof:*/					0,
/*thermal_bridges:*/			0.03,

/*GWP B6:*/						4.6*202,
/*GWP B7:*/						NULL,
/*stories above ground:*/		2,
/*stories below ground:*/		NULL,
	
/*comments:*/					'comments', 
/*typology:*/					'residential', 
/*construction type:*/			'timber', 
/*Country:*/					'Norway',
/*city:*/						'Larvik', 
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
		# TEMPLATE: call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							data_year, 'FU', Density, iEEF_A1A3, RSL, 'Comment', 'materialCat', 'CountryProduction', 'CityProduction');
	call insert_material('Low carbon concrete type B', 'Specific', 'EPD', 													2014, 'm3', NULL, 235, NULL, 'Comment', 'cement', 'Norway', 'Brevik');
    call insert_material('Celca Steel Service OY, EPD: Reinforcement', 'Specific', 'EPD', 									2011, 'kg', NULL, 0.39, NULL, '100% scrap-based steel', 'steel', 'Finland', 'na');
    call insert_material('Gluelaminated beam from Moelven (EPD-Mikado)', 'Specific', 'EPD', 								2007, 'm3', 500, 43.44, NULL, 'Comment', 'timber', 'Norway', 'Moelv');
    call insert_material('Tømmer produksjon, MIKADO, med interntransport', 'Specific', 'EPD', 								2009, 'kg', NULL, 0.0414, NULL, 'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD084N%20rev1%20H%C3%B8vellast.pdf', 'timber', 'Norway', 'na');
    call insert_material('Steel, low-alloyed, at plant/RER U', 'Generic', 'Ecoinvent', 										NULL, 'kg', 1, 1.45, NULL, 'Comment', 'steel', NULL, NULL);
    call insert_material('Glasroc storm EPD', 'Specific', 'EPD', 															2012, 'm2', NULL, 2.64, NULL, 'EPD- NO 227D', 'plaster', 'Norway', 'na');
    call insert_material('UV wind barrier Isola PET', 'Generic', 'Ecoinvent', 												NULL, 'm2', 0.195, 0.338429214, NULL, 'Based on SINTEF Technical approval number 2043, where it is stated that the weight is 195 grams/m2, and the PET foil weigh 60 grams/m2 and that the UV also has carbon fiber.', 'vapour/wind barrier', 'Norway', 'Porsgrunn');
    call insert_material('12,5 plasterboard gyproc', 'Specific', 'EPD', 													2010, 'm2', NULL, 2.39, NULL, 'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD223GyprocGN13.pdf', 'plaster', 'Norway', 'Fredrikstad');
    call insert_material('Glava, EPDnr 221: Glass wool, Cradle-to-gate', 'Specific', 'EPD', 								2005, 'm2', 16.6, 0.57, NULL, 'www.epd-norge.no', 'insulation', 'Norway', 'Askim');
    call insert_material('EPD-Norwegian timber cladding painted', 'Specific', 'EPD', 										2009, 'm2', NULL, 2.124, NULL, 'EPD- NO 137N', 'timber', 'Norway', 'na');
    call insert_material('Brick wall  (old reused bricks)', 'Generic', 'EPD', 												NULL, 'm2', NULL, 0, NULL, 'No emissions from production', 'brick', NULL, NULL);
    call insert_material('Door, outer, wood-glass, at plant/RER U', 'Generic', 'Ecoinvent', 								NULL, 'm2', NULL, 89.514434, NULL, 'Comment', 'doors', NULL, NULL);
    call insert_material('Glazing, triple (3-IV), U<0.5 W/m2K, at plant/RER U ZEB', 'Generic', 'Ecoinvent', 				2009, 'm2', NULL, 56.8, NULL, 'Comment', 'glass', 'Europe', 'Central');
    call insert_material('Window frame, wood-metal, U=1.6 W/m2K, at plant/RER U', 'Generic', 'Ecoinvent', 					2010, 'm2', NULL, 245, NULL, 'Comment', 'timber', 'Europe', 'Central');
    call insert_material('Flat glass, uncoated, at plant/RER U (of project KlimaTre - yttervegg)', 'Generic', 'Klimatre',	NULL, 'kg', 1, 0.97921942, NULL, 'Comment', 'glass', 'Europe', 'na');
    call insert_material('Ceramic tiles, at regional storage/CH U', 'Generic', 'Ecoinvent', 								NULL, 'kg', NULL, 0.78093876, NULL, 'Comment', 'ceramic', NULL, NULL);
    call insert_material('Alkyd paint, white, 60% in H2O, at plant/RER U', 'Generic', 'Ecoinvent', 							2003, 'm2', NULL, 0.71183931, NULL, 'Comment', 'paint', 'Europe', 'na');
    call blcad.insert_material('Vapour barrier', 'Generic', 'Ecoinvent', 													2010, 'm2', 0.139, 0.113600358, NULL, '0,139 kg/m2 (15mm) is taken from http://www.icopal.no/Produkter/Dampsperre.aspx', 'plastics', NULL, NULL);
    call blcad.insert_material('Inner panel timber (Norwegian)', 'Generic', 'EPD', 											2010, 'm2', 7, 0.4, NULL, 'EPD E 085; NB! To grave', 'timber', 'Norway', 'na');
	call blcad.insert_material('Door, inner, wood, at plant/RER U', 'Generic', 'Ecoinvent', 								2007, 'm2', 30, 36.692393, 	NULL, 'comment', 'timber', 'Europe', 'Central');
	call blcad.insert_material('Fibreboard - Forrestia 2011- Analysis Kari Sørnes', 'Specific', 'Custom', 					2011, 'm3', 765, 185, NULL, '(Forestia, 2012)', 'timber', 'Norway', 'na');
    call blcad.insert_material('Hunton, EPD: Asphalt wind barrier', 'Specific', 'EPD', 										2008, 'm2', 4.86, 1.828, NULL, 'www.epd-norge.no', 'bitumen', 'Norway', 'Gjoevik');
    call blcad.insert_material('Norwegian I-beam from Byggma EPD', 'Specific', 'EPD', 										2009, 'm', NULL, 1.365, NULL, 'http://www.masonite.no/media/93306/EPD88N-I-bjelke.pdf; 400 millimeter high, Included - raw materials, production and 50 of transport emissions from the EPD', 'timber', 'Norway', 'na');
	call blcad.insert_material('Expanded Polystyrene (EPS) Foam Insulation', 'Specific', 'EPD', 							2011, 'm3', 15, 41, NULL, 'ECO-EPS-00050101-1106 ', 'insulation', 'Europe', 'na');
	call blcad.insert_material('XPS - Extruded Polystyrene Foam', 'Specific', 'EPD', 										NULL, 'm3', 34, 154.75, NULL, 'http://bau-umwelt.de/download/C2cb5f20aX138928500d0X6962/EPD_FPX_2010111_E.pdf?ITServ=CY1f3ceb6X139c3f2661aX6fad', 'insulation', NULL, NULL);
	call blcad.insert_material('Laminate flooring EGGER Flooring EPD 2011', 'Specific', 'EPD', 								NULL, 'm2', NULL, 3.05, NULL, 'P O Box 750, DK-9100 Aalborg', 'flooring', NULL, NULL);
	call blcad.insert_material('Carpet- EPD-BauUmwelt Desso - 100 % PA6  fra nov. 2011', 'Specific', 'EPD', 				2011, 'm2', 0.4, 9.64, NULL, 'EPD-CEM-2012111-E Declaration number', 'flooring', NULL, NULL);
	call blcad.insert_material('Gyproc Gypsum Rehab 6,5 millimeter', 'Specific', 'EPD', 									2010, 'm2', 5.6, 1.42, NULL, 'http://www.epd-norge.no/getfile.php/PDF/EPD/Byggevarer/NEPD222GyprocGN6.pdf', 'gypsum', 'Norway', 'Fredrikstad');
	call blcad.insert_material('Ventilation duct, steel, 100x50 mm, at plant/RER U ZEB', 'Generic', 'Ecoinvent', 			2007, 'm', 1.5, 6.3421557, NULL, 'comment', 'steel', NULL, NULL);
	call blcad.insert_material('Connection piece, steel, 100x50 mm, at plant/RER U', 'Generic', 'Ecoinvent', 				NULL, 'pcs', 0.2, 0.87484061, NULL, 'comment', 'steel', NULL, NULL);
	call blcad.insert_material('Silencer, steel, DN 125, at plant/CH U', 'Generic', 'Ecoinvent', 							NULL, 'pcs', 8.3, 25.106158, NULL, 'Comment', 'steel', NULL, NULL);
	call blcad.insert_material('Elbow 90°, steel, 100x50 mm, at plant/RER U', 'Generic', 'Ecoinvent', 						NULL, 'pcs', 0.27, 1.2045995, NULL, 'Comment', 'steel', NULL, NULL);
	call blcad.insert_material('Outside air intake, stainless steel, DN 370, at plant/RER U', 'Specific', 'Ecoinvent', 		NULL, 'pcs', 32, 189.15705, NULL, 'Comment', 'steel', NULL, NULL);
	call blcad.insert_material('Sealing tape, aluminum/PE, 50 mm wide, at plant/RER U', 'Generic', 'Ecoinvent', 			NULL, 'm', NULL, 0.24048624, NULL, 'comment', 'aluminium', NULL, NULL);
	call blcad.insert_material('Control and wiring, central unit, at plant/RER U', 'Generic', 'Ecoinvent', 					NULL, 'pcs', 4.2, 28.456572, NULL, 'comment', 'technical installations', NULL, NULL);
	call blcad.insert_material('Ventilation equipment, central, 600-1200 m3/h, at plant/RER U', 'Generic', 'Ecoinvent', 	NULL, 'pcs', 142, 804.09661, NULL, 'comment', 'technical installations', NULL, NULL);
	call blcad.insert_material('Exxact Frames - Schneider Electrics (steel frame)', 'Specific', 'PEP', 						2010, 'pcs', 0.0253, 0.2, NULL, 'http://ecatalogue.schneider-electric.no/ProductSheet.aspx?productId=1348714&groupid=144472&navid=65533&navoption=6', 'steel', 'Europe', 'na');
	call blcad.insert_material('Exxact 2-stikk m/j+bv 1,5 sk a Schneider Electrics (stikkkontakt)', 'Specific', 'PEP', 		2010, 'pcs', 0.110, 0.911, NULL, 'comment', 'technical installations', 'Europe', 'na');
	call blcad.insert_material('Multifix flush mounted boxes (Schneider Electrics)', 'Specific', 'PEP', 					2013, 'pcs', NULL, 0.542, NULL, 'comment', 'technical installations', 'Europe', 'na');
	call blcad.insert_material('Exxact KNX push-buttons Schneider Electrics', 'Specific', 'PEP', 							2010, 'pcs', 0.105, 14.9, NULL, 'comment', 'technical installations', 'Europe', 'na');
	call blcad.insert_material('Push-Button Interfaces', 'Specific', 'PEP', 												2010, 'pcs', 0.028, 0.00044, NULL, 'http://ecatalogue.schneider-electric.no/ProductSheet.aspx?productId=729894&groupid=154845&navid=81056&navoption=6', 'technical installations', 'Europe', 'na');
	call blcad.insert_material('KNX ARGUS Presence pw', 'Specific', 'PEP', 													2013, 'pcs', 0.195, 2.42, NULL, 'http://ecatalogue.schneider-electric.no/ProductSheet.aspx?productId=729808&groupid=154814&navid=81054&navoption=6', 'technical installations', 'Europe', 'na');
	call blcad.insert_material('Exxact Movement Detectors (PIRs)', 'Specific', 'PEP', 										2010, 'pcs', 0.125, 3.98, NULL, 'http://ecatalogue.schneider-electric.no/ProductSheet.aspx?productId=1348895&groupid=144604&navid=57993&navoption=6', 'technical installations', 'Europe', 'na');
    call blcad.insert_material('KNX DALI-Gateway REG-K/1/16(64)/64/IP1', 'Specific', 'PEP', 								2012, 'pcs', 0.251, 27.7, NULL, 'http://ecatalogue.schneider-electric.no/ProductSheet.aspx?productId=3655074&groupid=154791&navid=81052&navoption=6', 'technical installations', 'Europe', 'na');
    call blcad.insert_material('Exxact Connect RF push-buttons', 'Specific', 'PEP', 										2010, 'pcs', 0.110, 1.65, NULL, 'Schneider Electric Industries SAS', 'technical installations', 'Europe', 'na');
	call blcad.insert_material('KNX flush mounted Actuators', 'Specific', 'PEP', 											2014, 'pcs', 0.150, 3.99, NULL, 'comment', 'technical installations', 'Europe', 'na');
	call blcad.insert_material('KNX Switch Actuators', 'Specific', 'PEP', 													2012, 'pcs', 0.55, 0.0471, NULL, 'http://ecatalogue.schneider-electric.no/ProductSheet.aspx?productId=729858&groupid=154831&navid=81068&navoption=6', 'technical installations', 'Europe', 'na');
	call blcad.insert_material('Electronics for control units /RER /U', 'Generic', 'Ecoinvent', 							2007, 'kg', 1, 26, NULL, 'comment', 'technical installations', 'Global', 'na');
	call blcad.insert_material('KNX CO2-, Humidity and Temperature sensors', 'Specific', 'PEP', 							2014, 'pcs', 0.15, 10.8, NULL, 'Schneider Electric Industries SAS', 'technical installations', 'Europe', 'na');
	call blcad.insert_material('KNX LOGIC MODUL BASIC REG-K REF: 676090 OR MTN676090', 'Specific', 'PEP', 					2009, 'pcs', 0.122, 2.3362, NULL, 'Schneider Electric Industries SAS', 'technical installations', 'Europe', 'na');
	call blcad.insert_material('100 meter Cable from Ole Erik Berges Master Thesis (see Figure Below, Figure is how ever 100 m)', 'Generic', 'Custom', NULL, 'm', 1, 0.396, NULL, 'Ole Erik Berget Master Thesis, HiOA, 2013', 'technical installations', 'Europe', 'na');
	call blcad.insert_material('Cable, data cable in infrastructure, at plant/GLO U', 'Generic', 'Ecoinvent', 				NULL, 'm', 0.06, 0.16910988, NULL, 'comment', 'technical installations', NULL, NULL);
	call blcad.insert_material('Photovoltaic panel, single-Si, at plant/RER/I U', 'Generic', 'Ecoinvent', 					NULL, 'm2', NULL, 199.31087, NULL, 'comment', 'PV panel', NULL, NULL);
	call blcad.insert_material('Flat plate collector, at plant/CH/I U', 'Generic', 'Ecoinvent', 							NULL, 'm2', NULL, 103.62578, NULL, 'comment', 'ST panel', NULL, NULL);
	call blcad.insert_material('Expansion vessel 25l, at plant/CH/I U', 'Generic', 'Ecoinvent', 							NULL, 'pcs', NULL, 17.10093, NULL, 'comment', 'technical installations', NULL, NULL);
	call blcad.insert_material('Pump 40W, at plant/CH/I U', 'Generic', 'Ecoinvent', 										NULL, 'pcs', NULL, 6.9562462, NULL, 'comment', 'technical installations', NULL, NULL);
	call blcad.insert_material('Hot water tank 600l, at plant/CH/I U', 'Generic', 'Ecoinvent', 								NULL, 'pcs', NULL, 650.53147, NULL, 'comment', 'hot water tank', NULL, NULL);
	call blcad.insert_material('High densitiy polyethylene (EPD-Plastics Europe)', 'Specific', 'EPD', 						2008, 'kg', NULL, 1.96, NULL, 'http://www.plasticseurope.org/Documents/Document/20100312112214-FINAL_HDPE_280409-20081215-017-EN-v1.pdf', 'plastics', 'Europe', 'na');
	call blcad.insert_material('Copper, at regional storage/RER U', 'Generic', 'Ecoinvent', 								NULL, 'kg', NULL, 1.8835372, NULL, 'comment', 'copper', NULL, NULL);

			-- Insert transport emission factors if they are not already in the database
			# TEMPLATE: INSERT INTO GWP_transport (mode, name, GWP_pertkm) VALUES ('', '', );

		-- Insert materials into the inventory of the building, connected to a certain building element
		# TEMPLATE: call insert_materialInventory(@BLD, level, 'name_material', 							quantity, 'FU', RSL (optional), 	'nameT1', T1dist, 'nameT2', T2dist, 'nameT3', T3dist, A5, 		'CountryProduction' (optional), 'CityProduction' (optional));
		#21
    call insert_materialInventory(@BLD, 21, 'Low carbon concrete type B', 															33, 'm3', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 21, 'Celca Steel Service OY, EPD: Reinforcement', 											1800, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 		NULL, NULL);
		#22
    call insert_materialInventory(@BLD, 22, 'Gluelaminated beam from Moelven (EPD-Mikado)', 										28.14, 'm3', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 22, 'Tømmer produksjon, MIKADO, med interntransport',										7.2*500, 'kg', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 22, 'Steel, low-alloyed, at plant/RER U', 													373, 'kg', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
		#23	
    call insert_materialInventory(@BLD, 23, 'Glasroc storm EPD', 																	332.11, 'm2', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 23, 'UV wind barrier Isola PET', 															352.72, 'm2', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 23, '12,5 plasterboard gyproc', 															285.47, 'm2', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 23, 'Glava, EPDnr 221: Glass wool, Cradle-to-gate', 										352.72*(350/37), 'm2', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 23, 'EPD-Norwegian timber cladding painted', 												255.05, 'm2', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 23, 'Tømmer produksjon, MIKADO, med interntransport',										8302.75, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 23, 'Brick wall  (old reused bricks)', 														37.69, 'm2', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
			# 234
    call insert_materialInventory(@BLD, 23, 'Door, outer, wood-glass, at plant/RER U', 												2.07, 'm2', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 23, 'Glazing, triple (3-IV), U<0.5 W/m2K, at plant/RER U ZEB',							 	54.929+2.07, 'm2', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 23, 'Window frame, wood-metal, U=1.6 W/m2K, at plant/RER U', 								2.746, 'm2', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
		#24
			# 242 Non-bearing inner wall + door
    call insert_materialInventory(@BLD, 24, '12,5 plasterboard gyproc', 															289.05, 'm2', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 24, 'Flat glass, uncoated, at plant/RER U (of project KlimaTre - yttervegg)', 				2.7*7645.26*(0.005*1), 'kg', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 24, 'Ceramic tiles, at regional storage/CH U', 												39.24*15.1, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 24, 'Alkyd paint, white, 60% in H2O, at plant/RER U', 										119.8, 'm2',  8, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 24, 'Glava, EPDnr 221: Glass wool, Cradle-to-gate', 										155.703, 'm2', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 24, 'Tømmer produksjon, MIKADO, med interntransport', 										740.5, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 24, 'Vapour barrier', 																		40.86, 'm2', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 24, 'Inner panel timber (Norwegian)', 														89.59, 'm2', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 24, 'Door, inner, wood, at plant/RER U', 													52.38, 'm2', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
		#25
			# Slab structure second floor
    call insert_materialInventory(@BLD, 25, 'Tømmer produksjon, MIKADO, med interntransport', 										1060, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 25, 'Glava, EPDnr 221: Glass wool, Cradle-to-gate', 										71.00*(250/37), 'm2', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 25, 'Fibreboard - Forrestia 2011- Analysis Kari Sørnes', 									1.56, 'm3', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 25, '12,5 plasterboard gyproc', 															26.00, 'm2', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
			# Floor on ground
    call insert_materialInventory(@BLD, 25, 'Glava, EPDnr 221: Glass wool, Cradle-to-gate', 										153*(500/37), 'm2', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 25, 'Fibreboard - Forrestia 2011- Analysis Kari Sørnes', 									2.904, 'm3', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 25, 'Hunton, EPD: Asphalt wind barrier', 													132, 'm2', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 25, 'Tømmer produksjon, MIKADO, med interntransport', 										1518, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 25, 'Norwegian I-beam from Byggma EPD', 													330, 'm', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 25, 'Expanded Polystyrene (EPS) Foam Insulation', 											7.5, 'm3', 25, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 25, 'XPS - Extruded Polystyrene Foam', 														4, 'm3', 50, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
			# Floor covering
    call insert_materialInventory(@BLD, 25, 'Laminate flooring EGGER Flooring EPD 2011', 											180, 'm2', 20, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 25, 'Carpet- EPD-BauUmwelt Desso - 100 % PA6  fra nov. 2011', 								6, 'm2', 50, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 25, 'Ceramic tiles, at regional storage/CH U', 												3.2*15.1, 'kg', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 25, 'Gyproc Gypsum Rehab 6,5 millimeter', 													153, 'm2', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
		#26
			# Primary construction
    call insert_materialInventory(@BLD, 26, 'Tømmer produksjon, MIKADO, med interntransport', 										559.25, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
			# Roofing
	call insert_materialInventory(@BLD, 26, 'Glava, EPDnr 221: Glass wool, Cradle-to-gate', 										152*(500/37), 'm2', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 26, 'Vapour barrier', 																		152, 'm2', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 26, '12,5 plasterboard gyproc', 															152*2, 'm2', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
		#28
			# Internal stairs
    call insert_materialInventory(@BLD, 28, 'Tømmer produksjon, MIKADO, med interntransport', 										0.6*500, 'kg', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
	call insert_materialInventory(@BLD, 28, 'Flat glass, uncoated, at plant/RER U (of project KlimaTre - yttervegg)', 				6.41*(6/1000)*7645.26, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
	call insert_materialInventory(@BLD, 28, 'Steel, low-alloyed, at plant/RER U', 													20, 'kg', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
		#36
	call insert_materialInventory(@BLD, 36, 'Ventilation duct, steel, 100x50 mm, at plant/RER U ZEB', 								31.05, 'm', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 36, 'Connection piece, steel, 100x50 mm, at plant/RER U', 									32.5, 'pcs', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 36, 'Ventilation duct, steel, 100x50 mm, at plant/RER U ZEB', 								8.832, 'm', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 36, 'Connection piece, steel, 100x50 mm, at plant/RER U', 									35.2, 'pcs', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 36, 'Silencer, steel, DN 125, at plant/CH U', 												6.84, 'pcs', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 36, 'Elbow 90°, steel, 100x50 mm, at plant/RER U', 											13.75, 'pcs', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 36, 'Ventilation duct, steel, 100x50 mm, at plant/RER U ZEB', 								28.8, 'm', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 36, 'Elbow 90°, steel, 100x50 mm, at plant/RER U', 											14.4, 'pcs', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 36, 'Silencer, steel, DN 125, at plant/CH U', 												3, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 36, 'Outside air intake, stainless steel, DN 370, at plant/RER U', 							1*(203/780), 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 36, 'Sealing tape, aluminum/PE, 50 mm wide, at plant/RER U', 								100, 'm', 20, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 36, 'Control and wiring, central unit, at plant/RER U', 									1, 'pcs', 20, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 36, 'Ventilation equipment, central, 600-1200 m3/h, at plant/RER U', 						2*(200/780), 'pcs', 20, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
		#43
	call insert_materialInventory(@BLD, 43, 'Exxact Frames - Schneider Electrics (steel frame)', 									49, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Exxact 2-stikk m/j+bv 1,5 sk a Schneider Electrics (stikkkontakt)', 					51, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Multifix flush mounted boxes (Schneider Electrics)', 									57, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Multifix flush mounted boxes (Schneider Electrics)', 									15, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Exxact Frames - Schneider Electrics (steel frame)', 									10, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Exxact 2-stikk m/j+bv 1,5 sk a Schneider Electrics (stikkkontakt)', 					2.4, 'pcs', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Exxact 2-stikk m/j+bv 1,5 sk a Schneider Electrics (stikkkontakt)', 					3, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Exxact Frames - Schneider Electrics (steel frame)', 									6, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Exxact Frames - Schneider Electrics (steel frame)', 									9, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Exxact KNX push-buttons Schneider Electrics', 											7, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Push-Button Interfaces', 																1, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'KNX ARGUS Presence pw', 																1, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Exxact Movement Detectors (PIRs)', 													6, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'KNX DALI-Gateway REG-K/1/16(64)/64/IP1', 												3, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'KNX flush mounted Actuators', 															1, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'KNX Switch Actuators', 																3, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Exxact KNX push-buttons Schneider Electrics', 											7, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Exxact KNX push-buttons Schneider Electrics', 											1, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Electronics for control units /RER /U', 												2*0.2, 'kg', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'KNX CO2-, Humidity and Temperature sensors', 											6, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Exxact Connect RF push-buttons', 														7, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'KNX LOGIC MODUL BASIC REG-K REF: 676090 OR MTN676090', 								8, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Electronics for control units /RER /U', 												1*0.2, 'kg', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL);
    call insert_materialInventory(@BLD, 43, '100 meter Cable from Ole Erik Berges Master Thesis (see Figure Below, Figure is how ever 100 m)', 	500, 'm', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 43, 'Cable, data cable in infrastructure, at plant/GLO U', 									250, 'm', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL);
    call insert_materialInventory(@BLD, 43, '100 meter Cable from Ole Erik Berges Master Thesis (see Figure Below, Figure is how ever 100 m)', 	300, 'm', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL);
		#49
			# PV
				# there is a strange calculation where the material is not used for the calculation, rather 100*1.1 is used, dont know why, I will use material
	call insert_materialInventory(@BLD, 49, 'Photovoltaic panel, single-Si, at plant/RER/I U', 										115, 'm2', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL);
        #69
			# Solar thermal collectors
	call insert_materialInventory(@BLD, 69, 'Flat plate collector, at plant/CH/I U', 												16, 'm2', 20, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 69, 'Expansion vessel 25l, at plant/CH/I U', 												2, 'pcs', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 69, 'Pump 40W, at plant/CH/I U', 															2, 'pcs', 20, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 69, 'Hot water tank 600l, at plant/CH/I U', 												1, 'pcs', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
			# Floor heating
    call insert_materialInventory(@BLD, 69, 'High densitiy polyethylene (EPD-Plastics Europe)', 									823*0.17, 'kg', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 69, 'High densitiy polyethylene (EPD-Plastics Europe)', 									20, 'kg', 30, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 69, 'Steel, low-alloyed, at plant/RER U', 													30, 'kg', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);
    call insert_materialInventory(@BLD, 69, 'Copper, at regional storage/RER U', 													10, 'kg', 60, 		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,		NULL, NULL);


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

One can choose to enter for example NULL directly into a chosen building element, and the rest through lower levels.
As long as A5 is kept NULL at all lower levels and material inventory, it will not be affected at a higher level.
It will, however, be overwritten if there are any entries for A5 on lower levels.
*/
call calculate_building(@BLD);