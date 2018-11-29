-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- ZEB SFH Concept --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
/* 
Mistakes found in spreadsheet calculations:
- 36: Quantity calculations do not make sense! Wrong formula. The correct formula (which I have used here) is to first convert emission factor [GWP/m] to [GWP/kg] (1.5 kg/m) and then multiply by quantity in [kg].
	This gives very different results. The building element 36 becomes more than twice as large.
- 21: Not affecting the calculations here, but there are two conflicting emission values shown for material "Massivholtz...": one for GWP/kg and another for GWP/m3
- 21: same for concrete, but not affecting calculations
Only 36 differs significantly from the results obtained here.
*/
USE bLCAd;

-- -- -- -- -- -- -- -- --
-- Define building name --
-- -- -- -- -- -- -- -- --
-- Define the building_identifier that will be used to reference the building (composed of a letter for the typology and a three digit number)
SET @BLD='R003';

-- -- -- -- -- -- --
-- Insert building --
-- -- -- -- -- -- --
-- First insert building
call insert_building(@BLD,
/*Name:*/						'ZEB SFH Concept',
/*Project:*/					'ZEB',
/*Calculation method:*/			'Excel',
/*Main data type:*/				'Mixed',
/*Study type:*/					'published research', 
/*Year of study:*/				2013,

/*Lifetime:*/					60,
/*floor area:*/					160,
/*heated volume:*/				420,
/*area_footprint:*/				80,
/*area roof:*/					80,
/*area wall:*/					189,
/*area windows and doors:*/		36,

/*heatloss number:*/			NULL,
/*uval_walls:*/					0.12,
/*uval_windows:*/				0.65,
/*uval_doors:*/					0.65,
/*uval_ground:*/				0.07,
/*uval_roof:*/					0.1,
/*thermal_bridges:*/			0.03,

/*GWP B6:*/						5.05*160,
/*GWP B7:*/						NULL,
/*stories above ground:*/		2,
/*stories below ground:*/		NULL,

/*comments:*/					'comments', 
/*typology:*/					'residential', 
/*construction type:*/			'timber', 
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

	-- -- -- -- -- -- -- -- -- -- -- --
	-- Insert GWP results: Option 2 --
	-- -- -- -- -- -- -- -- -- -- -- --
	/* Option 2: Inserting materials and then material inventories
	This option has the highest level of detail, it actually recalculates the whole LCA and contains all information
	*/	
			-- Insert material categories if they are not already in the database
			# TEMPLATE: INSERT INTO materialCat (materialCat) VALUES ('','')
			
			-- Insert location if it is not already in the database
			# TEMPLATE: INSERT INTO location (country, city) VALUES ('','');
		
        -- Insert materials if they are not already in the database
		# TEMPLATE: call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							2016, 'FU', Density, iEEF_A1A3, RSL, 'Comment', 'materialCat', 'CountryProduction', 'CityProduction');
		call blcad.insert_material('Concrete, normal, at plant/CH U ZEB', 'Generic', 'Ecoinvent', 						NULL, 'm3', 2380, 261.24, NULL, 'comment', 'concrete', NULL, NULL);
		call blcad.insert_material('Polystyrene foam slab, at plant/RER', 'Generic', 'Ecoinvent', 						NULL, 'kg', 1, 4.21, NULL, 'comment', 'plastics', NULL, NULL);
		call blcad.insert_material('Plastic polyethylene (LDPE)', 'Generic', 'Ecoinvent',								NULL, 'kg', 1, 2.10, NULL, 'comment', 'plastics', NULL, NULL);
		call blcad.insert_material('Massivholz Buche, Eiche, kammergetrocknet, gehobelt (EMPA)', 'Generic', 'EMPA', 	NULL, 'm3', 715, 20.28, NULL, 'comment', 'timber', NULL, NULL);

		call blcad.insert_material('Steel, low-alloyed, at plant/RER U ZEB', 'Generic', 'Ecoinvent', 					NULL, 'kg', 1, 1.72, NULL, 'comment', 'steel', NULL, NULL);

		call blcad.insert_material('Massivholz Fichte / Tanne / Lärche, Skandinavien, sägerau, entrindet (EMPA - row 297)', 'Generic', 'EMPA', NULL, 'kg', 1, 0.09, NULL, 'comment', 'timber', 'Scandinavia', 'na');
		call blcad.insert_material('Glass wool mat, at plant/CH U ZEB and Glava EPD', 'Generic', 'Ecoinvent', 			NULL, 'kg', 1, 1.49, NULL, 'comment', 'insulation', NULL, NULL);
		call blcad.insert_material('Gypsum plaster board, at plant/CH U ZEB and Norgips EPD', 'Generic', 'Ecoinvent', 	NULL, 'kg', 1, 0.35, NULL, 'comment', 'plaster', NULL, NULL);
		call blcad.insert_material('Polyethylene,LDPE, granulate, at plant/RERU', 'Generic', 'Ecoinvent', 				NULL, 'kg', 1, 2.1, NULL, 'comment', 'vapour/wind barrier', NULL, NULL);
		call blcad.insert_material('Wind barrier (kraftpapier - okologische EMPA)', 'Generic', 'EMPA', 					NULL, 'kg', 1, 1.69, NULL, 'comment', 'vapour/wind barrier', NULL, NULL);
		call blcad.insert_material('Massivholz Fichte / Tanne / Lärche Schweiz, kammergetrocknet, gehobelt', 'Generic', 'EMPA', NULL, 'kg', 1, 0.13, NULL, 'comment', 'timber', 'Switzerland', 'na');
		call blcad.insert_material('Flat glass, coated, at plant/RER U', 'Generic', 'Ecoinvent', 						NULL, 'kg', 1, 1.09, NULL, 'comment', 'glass', NULL, NULL);
		call blcad.insert_material('EPD- Cembrit Etna True- Fiber cement  To gate -Finland - 2012  (Data input EMPA Faserzementplatte gross', 'Generic', 'EMPA', NULL, 'kg', 1, 1.09, NULL, 'comment', 'cement', NULL, NULL);
		call blcad.insert_material('medium density fibreboard, at plant/m3/RER (okologische EMPA)', 'Generic', 'EMPA', 	NULL, 'kg', 1, 0.64, NULL, 'comment', 'timber', NULL, NULL);
		call blcad.insert_material('Sawn timber, softwood, planed, air dried, at plant / RER U', 'Generic', 'Ecoinvent', NULL, 'm3', 500, 85, NULL, 'comment', 'timber', NULL, NULL);
		
		call blcad.insert_material('Ceramic tiles, at regional storage / CH U', 'Generic', 'Ecoinvent', 				NULL, 'kg', 1, 0.781, NULL, 'comment', 'ceramic', NULL, NULL);

		call blcad.insert_material('Planed timber, softwood, at plant/ NO U or Massivholz Buche, Eiche, kammergetrocknet, gehobelt (EMPA)', 'Generic', 'EMPA', NULL, 'kg', 1, 0.16, NULL, 'comment', 'timber', NULL, NULL);

		call blcad.insert_material('Asfalt (ATB) (Asphaltdeckschicht - EMPA row 438)', 'Generic', 'EMPA', 				NULL, 'kg', 1, 0.09, NULL, 'comment', 'asphalt', NULL, NULL);
		call blcad.insert_material('OSB/ 3 plate (15mm) (EMPA row 299)', 'Generic', 'EMPA', 							NULL, 'kg', 1, 0.53, NULL, 'comment', 'timber', NULL, NULL);
		call blcad.insert_material('EPS 400mm (0,036 W/Mk) (EMPA row 336)', 'Generic', 'EMPA', 							NULL, 'kg', 1, 4.21, NULL, 'comment', 'insulation', NULL, NULL);
		call blcad.insert_material('PE Foil (0,2mm) Tyvek el. tilsvarende', 'na', 'na', 								NULL, 'kg', 1, 2.1, NULL, 'comment', 'vapour/wind barrier', NULL, NULL);

		call blcad.insert_material('PEX - High density polyethylene (HDPE)', 'na', 'na', 								NULL, 'kg', 1, 2.33, NULL, 'comment', 'plastics', NULL, NULL);
		call blcad.insert_material('Bosch EHP 7 LW/M', 'Specific', 'Other', 											NULL, 'pcs', NULL, 1526, NULL, 'comment', 'heat pump', NULL, NULL);
		call blcad.insert_material('Refrigirator fluid (R-407)', 'na', 'na', 											NULL, 'kg', 1, 103, NULL, 'comment', 'tbd', NULL, NULL);
		
		call blcad.insert_material('Ventilation duct, steel, 100x50 mm, at plant/RER U', 'Generic', 'Ecoinvent', 		NULL, 'm', 1.5, 6.342, NULL, 'comment', 'steel', NULL, NULL);
		
		call blcad.insert_material('Evacuated tube collector, at plant', 'Generic', 'Ecoinvent', 						NULL, 'm2', NULL, 90.45, NULL, 'comment', 'ST panel', NULL, NULL);


			-- Insert transport emission factors if they are not already in the database
			# TEMPLATE: INSERT INTO GWP_transport (mode, name, GWP_pertkm) VALUES ('', '', );

		-- Insert materials into the inventory of the building, connected to a certain building element
		# TEMPLATE: call insert_materialInventory(@BLD, level, 'name_material', 							quantity, 'FU', RSL (optional), 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
			# 21
				# 216
		call insert_materialInventory(@BLD, 216, 'Concrete, normal, at plant/CH U ZEB', 								31.9, 'm3', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 216, 'Polystyrene foam slab, at plant/RER', 								1263, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 216, 'Plastic polyethylene (LDPE)', 										157.92, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
			# Parkett, why here and not Dekker?
		call insert_materialInventory(@BLD, 216, 'Massivholz Buche, Eiche, kammergetrocknet, gehobelt (EMPA)', 		1.045, 'm3', 15, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		
			# 22
				# 223
		call insert_materialInventory(@BLD, 223, 'Steel, low-alloyed, at plant/RER U ZEB', 							800, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
			
			# 23
				# 231
		call insert_materialInventory(@BLD, 231, 'Massivholz Fichte / Tanne / Lärche, Skandinavien, sägerau, entrindet (EMPA - row 297)', 					5691.6, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 231, 'Glass wool mat, at plant/CH U ZEB and Glava EPD', 															2480, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 231, 'Gypsum plaster board, at plant/CH U ZEB and Norgips EPD', 													3524.4, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 231, 'Polyethylene,LDPE, granulate, at plant/RERU', 																334.64, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 231, 'Wind barrier (kraftpapier - okologische EMPA)', 															231.4, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# 234
		call insert_materialInventory(@BLD, 234, 'Massivholz Fichte / Tanne / Lärche Schweiz, kammergetrocknet, gehobelt', 									243.54, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 234, 'Massivholz Fichte / Tanne / Lärche Schweiz, kammergetrocknet, gehobelt', 									61.38, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 234, 'Flat glass, coated, at plant/RER U', 																		1522.5, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# 235
		call insert_materialInventory(@BLD, 235, 'EPD- Cembrit Etna True- Fiber cement  To gate -Finland - 2012  (Data input EMPA Faserzementplatte gross', 	540, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 235, 'medium density fibreboard, at plant/m3/RER (okologische EMPA)', 											995.28, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 235, 'Sawn timber, softwood, planed, air dried, at plant / RER U', 												1.78, 'm3', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		
			# 24
				# 241
		call insert_materialInventory(@BLD, 241, 'Massivholz Fichte / Tanne / Lärche, Skandinavien, sägerau, entrindet (EMPA - row 297)', 				146.9, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 241, 'Glass wool mat, at plant/CH U ZEB and Glava EPD', 														64.0, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 241, 'Gypsum plaster board, at plant/CH U ZEB and Norgips EPD', 												362.7, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# 242
		call insert_materialInventory(@BLD, 242, 'Massivholz Fichte / Tanne / Lärche, Skandinavien, sägerau, entrindet (EMPA - row 297)', 				578.3, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 242, 'Glass wool mat, at plant/CH U ZEB and Glava EPD', 														252.0, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 242, 'Glass wool mat, at plant/CH U ZEB and Glava EPD', 														30.5, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 242, 'Gypsum plaster board, at plant/CH U ZEB and Norgips EPD', 												2106.0, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 242, 'Gypsum plaster board, at plant/CH U ZEB and Norgips EPD', 												89.1, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# 244
		call insert_materialInventory(@BLD, 244, 'Flat glass, coated, at plant/RER U', 																	62.5, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 244, 'Massivholz Fichte / Tanne / Lärche Schweiz, kammergetrocknet, gehobelt', 								490.1, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# 246
		call insert_materialInventory(@BLD, 246, 'Ceramic tiles, at regional storage / CH U', 															2318.0, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

			# 25
				# 251
		call insert_materialInventory(@BLD, 251, 'Massivholz Fichte / Tanne / Lärche, Skandinavien, sägerau, entrindet (EMPA - row 297)', 				1398, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 251, 'Glass wool mat, at plant/CH U ZEB and Glava EPD', 														749.6, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# 254
		call insert_materialInventory(@BLD, 254, 'medium density fibreboard, at plant/m3/RER (okologische EMPA)', 										1279.98, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 254, 'Planed timber, softwood, at plant/ NO U or Massivholz Buche, Eiche, kammergetrocknet, gehobelt (EMPA)', 747.18, 'kg', 15, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# 257
		call insert_materialInventory(@BLD, 257, 'Gypsum plaster board, at plant/CH U ZEB and Norgips EPD', 												873.00, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 257, 'Sawn timber, softwood, planed, air dried, at plant / RER U', 											0.237, 'm3', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

			# 26
				# 261
		call insert_materialInventory(@BLD, 261, 'Massivholz Fichte / Tanne / Lärche, Skandinavien, sägerau, entrindet (EMPA - row 297)', 				1666, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# 262
        call insert_materialInventory(@BLD, 262, 'Asfalt (ATB) (Asphaltdeckschicht - EMPA row 438)', 													693, 'kg', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 262, 'OSB/ 3 plate (15mm) (EMPA row 299)', 																	1069.2, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 262, 'EPS 400mm (0,036 W/Mk) (EMPA row 336)', 																632.394, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 262, 'PE Foil (0,2mm) Tyvek el. tilsvarende', 																158.86, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 262, 'Gypsum plaster board, at plant/CH U ZEB and Norgips EPD', 												962.1, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

			# 29 THESE INVENTORIES WERE PLACED IN 29, BUT THEY ARE ALL HEATING RELATED SO I CHANGED THAT
				# Heating: Piping and radiator
		call insert_materialInventory(@BLD, 32, 'PEX - High density polyethylene (HDPE)', 																6.62+11.8, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 32, 'Steel, low-alloyed, at plant/RER U ZEB', 																42+56, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# Hot water tank: Place somewhere else?
        call insert_materialInventory(@BLD, 32, 'Hot water tank 600l, at plant/CH/I U', 																	1, 'pcs', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
				# Heat pump: # Place somewhere else?
        call insert_materialInventory(@BLD, 32, 'Bosch EHP 7 LW/M', 																						1, 'pcs', 20, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 32, 'Refrigirator fluid (R-407)', 																			1.35, 'kg', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

			# 36
																										# convert to [GWP/kg] --> *quantity in [kg]
		call insert_materialInventory(@BLD, 36, 'Ventilation duct, steel, 100x50 mm, at plant/RER U', 							1/(1.5)*39.1, 'm', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 36, 'Ventilation duct, steel, 100x50 mm, at plant/RER U', 							1/(1.5)*18, 'm', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 36, 'Ventilation duct, steel, 100x50 mm, at plant/RER U', 							1/(1.5)*28, 'm', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 36, 'Ventilation duct, steel, 100x50 mm, at plant/RER U', 							1/(1.5)*(67), 'm', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 36, 'Ventilation duct, steel, 100x50 mm, at plant/RER U', 							1/(1.5)*(40), 'm', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 36, 'Ventilation duct, steel, 100x50 mm, at plant/RER U', 							1/(1.5)*(4), 'm', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

			# 49
							# PV RSL is here recalculated from 30 to 40 yrs to account for 50% lower emissions in replacement
		call insert_materialInventory(@BLD, 49, 'Photovoltaic panel, single-Si, at plant/RER/I U', 								69, 'm2', 40, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
		call insert_materialInventory(@BLD, 49, 'Evacuated tube collector, at plant', 											8.3, 'm2', 20, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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