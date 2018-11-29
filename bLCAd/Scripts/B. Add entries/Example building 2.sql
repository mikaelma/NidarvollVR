-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Workflow for inserting a new building / updating a building entry --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
/* 
Example building 2.
Example of using Option 2 for data entry.
Data used are results for ZEB Living Lab.

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
/* TEMPLATE: call insert_building(@BLD,
	'Name', 'Main data type: EPD/Ecoinvent/Mixed', 'Study type: published research/unpublished research/industry/certification', study_year,
	Lifetime, floor area, heated volume, area_footprint, area roof, area wall, area windows and doors, heatloss number, GWP B6, stories above ground, stories below ground,
	'comments', 'typology', 'construction type', 'city', 'built status', 'energy ambition level'); */
    
call insert_building(@BLD, 
	'ZEB Living lab - inventory', 'EPD', 'published research', 9999,
	60, 102, 319, NULL, 119, 207, 25, NULL, NULL, 1, 0,
    'This is an example for entering results at the material inventory level',
    'residential', 'timber', 'Trondheim', 'built', 'ZEB-OM');

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
		# TEMPLATE: insert into materialcat(materialcat) values ('vapour/wind barrier');
        
		-- Insert location if it is not already in the database
		
        
		-- Insert materials if they are not already in the database
		# TEMPLATE: call insert_material('name', 'Specific/Generic', 'EPD/Ecoinvent', 							'Norway', 2016, 'FU', Density, iEEF_A1A3, RSL, 'Comment', 'materialCat', 'CountryProduction', 'CityProduction');
			# 21
        call insert_material('concrete, normal, at plant/ CH/ m3', 'Generic', 'Ecoinvent', 												'na', 2016, 'm3', 2380, 285, 60, 'Comment', 'concrete', NULL, NULL);
        call insert_material('polyvinylchloride, at regional storage/ RER/ kg', 'Generic', 'Ecoinvent', 								'na', 2016, 'kg', 1, 2.01, 60, 'Comment', 'plastics', NULL, NULL);
        call insert_material('aluminium, production mix, at plant/ RER/ kg', 'Generic', 'Ecoinvent', 									'na', 2016, 'kg', 1, 8.55, 60, 'Comment', 'aluminium', NULL, NULL);
        call insert_material('polystyrene, extruded (XPS) CO2 blown, at plant/ RER/ kg', 'Generic', 'Ecoinvent',						'na', 2016, 'kg', 1, 3.86, 60, 'Comment', 'insulation', 'Germany', 'na');
        call insert_material('reinforcing steel, at plant/ RER/ kg', 'Generic', 'Ecoinvent', 											'na', 2016, 'kg', 1, 1.45, 60, 'Comment', 'steel', NULL, NULL);
        call insert_material('sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 'Generic', 'Ecoinvent',						'na', 2016, 'm3', 540, 85.4, 60, 'Comment', 'timber', NULL, NULL);
			# 22
		call insert_material('glued laminated timber, indoor use, at plant/ RER/ m3', 'Generic', 'Ecoinvent',							'na', 2016, 'm3', 500, 205, 60, 'Comment', 'timber', NULL, NULL);
        call insert_material('oriented strand board, at plant/ RER/ m3', 			'Generic', 'Ecoinvent',								'na', 2016, 'm3', 650, 312, 60, 'Comment', 'timber', NULL, NULL);
			# 23 top
        call insert_material('plywood, indoor use, at plant/ RER/ m3', 'Generic', 'Ecoinvent', 											'na', 2016, 'm3', 650, 498, 30, 'Comment', 'timber', NULL, NULL);
        call insert_material('glass wool mat, at plant/ CH/ kg', 'Generic', 'Ecoinvent', 												'na', 2016, 'kg', 1, 1.22, 60, 'Comment', 'insulation', NULL, NULL);
        call insert_material('polyethylene, HDPE, granulate, at plant/ RER/ kg', 'Generic', 'Ecoinvent',								'na', 2016, 'kg', 1, 1.93, 60, 'Comment', 'vapour/wind barrier', NULL, NULL);
        call insert_material('polypropylene, granulate, at plant/ RER/ kg', 'Generic', 'Ecoinvent', 									'na', 2016, 'kg', 1, 1.97, 60, 'Comment', 'vapour/wind barrier', NULL, NULL);
        call insert_material('ceramic tiles, at regional storage/ CH/ kg', 'Generic', 'Ecoinvent', 										'na', 2016, 'kg', 1, 0.78, 20, 'Comment', 'ceramic', NULL, NULL);
			# 23 window north AND # 23 window south
        call insert_material('chromium steel 18/8, at plant/ RER/ kg', 'Generic', 'Ecoinvent', 											'na', 2016, 'kg', 1, 4.50, 40, 'Comment', 'steel', NULL, NULL);
        call insert_material('steel, converter, unalloyed, at plant/ RER/ kg', 'Generic', 'Ecoinvent', 									'na', 2016, 'kg', 1, 1.61, 40, 'Comment', 'steel', NULL, NULL);
        call insert_material('glass fibre reinforced plastic, polyamide, injection moulding, at plant/ RER/ kg', 'Generic', 'Ecoinvent','na', 2016, 'kg', 1, 8.79, 60, 'Comment', 'tbd', NULL, NULL);
        call insert_material('synthetic rubber, at plant/ RER/ kg', 'Generic', 'Ecoinvent', 											'na', 2016, 'kg', 1, 2.65, 40, 'Comment', 'tbd', NULL, NULL);
        call insert_material('acrylonitrile-butadiene-styrene copolymer, ABS, at plant/ RER/ kg', 'Generic', 'Ecoinvent', 				'na', 2016, 'kg', 1, 4.39, 40, 'Comment', 'tbd', NULL, NULL);
        call insert_material('powder coating, aluminium sheet/ RER/ m2', 'Generic', 'Ecoinvent', 										'na', 2016, 'm2', NULL, 3.78, 40, 'Comment', 'tbd', NULL, NULL);
        call insert_material('flat glass, coated, at plant/ RER/ kg', 'Generic', 'Ecoinvent', 											'na', 2016, 'kg', 1, 1.09, 60, 'Comment', 'tbd', NULL, NULL);
			# 23 sliding doors
        call insert_material('argon, liquid, at plant/ RER/ kg', 'Generic', 'Ecoinvent', 												'na', 2016, 'kg', 1, 0.31, NULL, 'Comment', 'tbd', NULL, NULL);
        call insert_material('sealing tape, aluminum/PE, 50 mm wide, at plant/ RER/ m', 'Generic', 'Ecoinvent', 						'na', 2016, 'm', NULL, 0.268, 30, 'Comment', 'tbd', NULL, NULL); 
			# vacuum insulation panels
        call insert_material('expanded perlite, at plant/ CH/ kg', 'Generic', 'Ecoinvent', 												'na', 2016, 'kg', 1, 1.00, 30, 'Comment', 'tbd', NULL, NULL);
			# bathroom window
			# entrance door
        call insert_material('polystyrene, expandable, at plant/ RER/ kg', 'Generic', 'Ecoinvent', 										'na', 2016, 'kg', 1, 3.38, 30, 'Comment', 'tbd', NULL, NULL);
			# 25
        call insert_material('anhydrite floor, at plant/ CH/ kg', 'Generic', 'Ecoinvent', 												'na', 2016, 'kg', 1, 0.0425, 30, 'Comment', 'Argon', NULL, NULL);
			# 26
		call insert_material('bitumen adhesive compound, hot, at plant/ RER/ kg', 'Generic', 'Ecoinvent', 								'na', 2016, 'kg', 1, 0.6, 60, 'Comment', 'roofing felt', NULL, NULL);
        call insert_material('textile, woven cotton, at plant/ GLO/ kg', 'Generic', 'Ecoinvent', 										'na', 2016, 'kg', 1, 24.8, 60, 'Comment', 'tbd', NULL, NULL);
        call insert_material('bitumen seal, alu80, production / RER / kg', 'Generic', 'Ecoinvent', 										'na', 2016, 'kg', 1, 2.03, 60, 'Comment', 'tbd', NULL, NULL);
        call insert_material('Polyurethane, flexible foam, at plant / RER / kg', 'Generic', 'Ecoinvent', 								'na', 2016, 'kg', 1, 4.31, 60, 'Comment', 'tbd', NULL, NULL);
        call insert_material('paraffin, at plant/ RER/ kg', 'Generic', 'Ecoinvent', 													'na', 2016, 'kg', 1, 0.83, 60, 'Comment', 'tbd', NULL, NULL);
			# 27
		call insert_material('sawn timber, hardwood, planed, air / kiln dried, u=10%, at plant/ RER/ m3', 'Generic', 'Ecoinvent', 		'na', 2016, 'm3', 540, 63.9, 60, 'Comment', 'tbd', NULL, NULL);
			# 31
		call insert_material('sanitary ceramics, at regional storage/ CH/ kg', 'Generic', 'Ecoinvent',									'na', 2016, 'kg', 1, 1.02, 60, 'Comment', 'tbd', NULL, NULL);
			# 32
		call insert_material('ethylene, pipeline system, at plant/ RER/ kg', 'Generic', 'Ecoinvent', 									'na', 2016, 'kg', 1, 1.46, 60, 'Comment', 'tbd', NULL, NULL);
        call insert_material('flat plate collector, at plant/ CH/ m2', 'Generic', 'Ecoinvent',											'na', 2016, 'm2', 39, 104, 60, 'Density is uncertain because weight formula in excel is wrong', 'tbd', NULL, NULL);
		call insert_material('hot water tank 600l, at plant/ CH/ unit', 'Generic', 'Ecoinvent',											'na', 2016, 'pcs', 95, 326, 60, 'Comment', 'tbd', NULL, NULL);
        call insert_material('heat pump 30kW/ RER/ unit', 'Generic', 'Ecoinvent',														'na', 2016, 'pcs', 150, 505, 60, 'Comment', 'tbd', NULL, NULL);
			# 36
        call insert_material('flexible duct, aluminum/PET, DN of 125, at plant/ RER/ m', 'Generic', 'Ecoinvent',						'na', 2016, 'm', 0.17, 1.38, 60, 'Comment', 'tbd', NULL, NULL);
        call insert_material('air distribution housing, steel, 120 m3/h, at plant/ CH/ unit', 'Generic', 'Ecoinvent',					'na', 2016, 'pcs', 67, 30.5, 60, 'Comment', 'tbd', NULL, NULL);
        call insert_material('supply air inlet, steel/SS, DN 75, at plant/ RER/ unit', 'Generic', 'Ecoinvent',							'na', 2016, 'pcs', 0.3, 11.2, 60, 'Comment', 'tbd', NULL, NULL);
        call insert_material('exhaust air valve, in-wall housing, plastic/steel, DN 125, at plant/ CH/ unit', 'Generic', 'Ecoinvent',	'na', 2016, 'pcs', 0.3, 2.09, 60, 'Comment', 'tbd', NULL, NULL);
        call insert_material('exhaust air outlet, steel/aluminum, 85x365 mm, at plant/ CH/ unit', 'Generic', 'Ecoinvent',				'na', 2016, 'pcs', 0.5, 16.7, 60, 'Comment', 'tbd', NULL, NULL);
        call insert_material('outside air intake, stainless steel, DN 370, at plant/ RER/ unit', 'Generic', 'Ecoinvent',				'na', 2016, 'pcs', 0.5, 197, 60, 'Comment', 'tbd', NULL, NULL);
			# 44
		call insert_material('plugs, inlet and outlet, for computer cable, at plant/ GLO/ unit', 'Generic', 'Ecoinvent',				'na', 2016, 'pcs', 1.3, 0.328, 60, 'Comment', 'tbd', NULL, NULL);
			# 49
		call insert_material('photovoltaic panel, multi-Si, at plant/ ROW/ m2', 'Generic', 'Ecoinvent',									'na', 2016, 'm2', 18, 129, 30, 'Density is uncertain because weight formula in excel is wrong', 'tbd', NULL, NULL);
        call insert_material('electronic component, unspecified, at plant/ GLO/ kg', 'Generic', 'Ecoinvent',							'na', 2016, 'kg', 1, 64.5, 30, 'Comment', 'tbd', NULL, NULL);
        call insert_material('cable, three-conductor cable / GLO / m', 'Generic', 'Ecoinvent',											'na', 2016, 'm', 0.086, 4.38, 30, 'Comment', 'tbd', NULL, NULL);
        
		-- Insert transport emission factors if they are not already in the database
		# TEMPLATE: INSERT INTO GWP_transport (mode, name, GWP_pertkm) VALUES ('', '', ), ('', '', ), ('', '', );

		-- Insert materials into the inventory of the building, connected to a certain building element
			-- quantities must be inserted in the same unit as the material is in
		# TEMPLATE: call insert_materialInventory(@BLD, level, 'name_material', 							quantity, 'FU', RSL (optional), 	'nameT1', T1dist, 'nameT2', T2dist, 'nameT3', T3dist, A5, 		'CountryProduction' (optional), 'CityProduction' (optional));
			# 21
        call insert_materialInventory(@BLD, 21, 'concrete, normal, at plant/ CH/ m3', 												9.33, 'm3', 60, 	'Transport, lorry 16-32t, EURO5', 456, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Gardermoen');
        call insert_materialInventory(@BLD, 21, 'polyvinylchloride, at regional storage/ RER/ kg', 									14.51, 'kg', 60, 	'Transport, lorry 16-32t, EURO5', 650, NULL, NULL, NULL, NULL, NULL, 										'na', 'na');
        call insert_materialInventory(@BLD, 21, 'aluminium, production mix, at plant/ RER/ kg', 									9.33, 'kg', 60, 	'Transport, lorry 16-32t, EURO5', 1891, 'Transport, transoceanic freight ship', 0.08, NULL, NULL, NULL,		'Belgium', 'Brussels');
        call insert_materialInventory(@BLD, 21, 'polystyrene, extruded (XPS) CO2 blown, at plant/ RER/ kg', 						166.05, 'kg', 60, 	'Transport, lorry 16-32t, EURO5', 1891, 'Transport, transoceanic freight ship', 1.43, NULL, NULL, NULL,		 NULL, NULL);
        call insert_materialInventory(@BLD, 21, 'reinforcing steel, at plant/ RER/ kg', 											571.15, 'kg', 60, 	'Transport, lorry 16-32t, EURO5', 1456, 'Transport, transoceanic freight ship', 14.28, NULL, NULL, NULL, 	'United Kingdom', 'Sheffield');
        call insert_materialInventory(@BLD, 21, 'sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 						0.31, 'm3', 60, 	'Transport, lorry 16-32t, EURO3', 494, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Oslo');
			# 22
        call insert_materialInventory(@BLD, 22, 'glued laminated timber, indoor use, at plant/ RER/ m3', 							13.88, 'm3', 60, 	'Transport, lorry 16-32t, EURO5', 366, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Oslo');
        call insert_materialInventory(@BLD, 22, 'sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 						1.96, 'm3', 60, 	'Transport, lorry 16-32t, EURO3', 494, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Oslo');
        call insert_materialInventory(@BLD, 22, 'sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 						0.432, 'm3', 60, 	'Transport, lorry 16-32t, EURO5', 841, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Vennesla');
        call insert_materialInventory(@BLD, 22, 'oriented strand board, at plant/ RER/ m3', 										0.96, 'm3', 60, 	'Transport, lorry 16-32t, EURO5', 841, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Vennesla');
			# 23 top
        call insert_materialInventory(@BLD, 23, 'plywood, indoor use, at plant/ RER/ m3', 											1.26, 'm3', 30, 	'Transport, lorry 16-32t, EURO5', 1785, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL, 		'Spain', 'Laudio');
        call insert_materialInventory(@BLD, 23, 'glass wool mat, at plant/ CH/ kg', 												435.79, 'kg', 60, 	'Transport, lorry 16-32t, EURO3', 545, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Askim');
        call insert_materialInventory(@BLD, 23, 'polyethylene, HDPE, granulate, at plant/ RER/ kg', 								140.88, 'kg', 60, 	'Transport, lorry 16-32t, EURO5', 378, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Goevik');
        call insert_materialInventory(@BLD, 23, 'polypropylene, granulate, at plant/ RER/ kg', 										736.25, 'kg', 50, 	'Transport, lorry 16-32t, EURO5', 378, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Goevik');
        call insert_materialInventory(@BLD, 23, 'sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 						4.89, 'm3', 50, 	'Transport, lorry 16-32t, EURO3', 494, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Oslo');
        call insert_materialInventory(@BLD, 23, 'ceramic tiles, at regional storage/ CH/ kg', 										203.73, 'kg', 20, 	'Transport, lorry 16-32t, EURO5', 4098, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL, 		'Turkey', 'Can');
			# 23 window north
        call insert_materialInventory(@BLD, 23, 'aluminium, production mix, at plant/ RER/ kg', 									73.60, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1846, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL,		'Germany', 'Ulm');
        call insert_materialInventory(@BLD, 23, 'chromium steel 18/8, at plant/ RER/ kg', 						0.51, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1846, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL,		'Germany', 'Ulm');
        call insert_materialInventory(@BLD, 23, 'steel, converter, unalloyed, at plant/ RER/ kg', 									13.16, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1846, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL,		'Germany', 'Ulm');
        call insert_materialInventory(@BLD, 23, 'glass fibre reinforced plastic, polyamide, injection moulding, at plant/ RER/ kg', 4.90, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1846, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL,		'Germany', 'Ulm');
        call insert_materialInventory(@BLD, 23, 'synthetic rubber, at plant/ RER/ kg', 												8.42, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1846, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL,		'Germany', 'Ulm');
        call insert_materialInventory(@BLD, 23, 'acrylonitrile-butadiene-styrene copolymer, ABS, at plant/ RER/ kg', 				2.63, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1846, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL,		'Germany', 'Ulm');
        call insert_materialInventory(@BLD, 23, 'powder coating, aluminium sheet/ RER/ m2', 										15.28, 'm2', 40, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,																	'Germany', 'Ulm');
        call insert_materialInventory(@BLD, 23, 'flat glass, coated, at plant/ RER/ kg', 											77.94, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1846, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL,		'Germany', 'Ulm');
        call insert_materialInventory(@BLD, 23, 'sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 						0.018, 'm3', 40, 	'Transport, lorry 16-32t, EURO5', 1846, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL,		'Germany', 'Ulm');
			# 23 window south
		call insert_materialInventory(@BLD, 23, 'aluminium, production mix, at plant/ RER/ kg', 									76.60, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1846, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL,		'Germany', 'Ulm');
        call insert_materialInventory(@BLD, 23, 'chromium steel 18/8, at plant/ RER/ kg', 						0.12, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1846, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL,		'Germany', 'Ulm');
        call insert_materialInventory(@BLD, 23, 'steel, converter, unalloyed, at plant/ RER/ kg', 									6.22, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1846, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL,		'Germany', 'Ulm');
        call insert_materialInventory(@BLD, 23, 'glass fibre reinforced plastic, polyamide, injection moulding, at plant/ RER/ kg', 14.10, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1846, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL,		'Germany', 'Ulm');
        call insert_materialInventory(@BLD, 23, 'synthetic rubber, at plant/ RER/ kg', 												5.12, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1846, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL,		'Germany', 'Ulm');
        call insert_materialInventory(@BLD, 23, 'powder coating, aluminium sheet/ RER/ m2', 										23.17, 'm2', 40, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,																	'Germany', 'Ulm');
        call insert_materialInventory(@BLD, 23, 'flat glass, coated, at plant/ RER/ kg', 											535.40, 'kg', 40, 	'Transport, lorry 16-32t, EURO3', 1846, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL,		'Germany', 'Ulm');
			# 23 sliding doors
		call insert_materialInventory(@BLD, 23, 'sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 						40.56, 'm3', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'aluminium, production mix, at plant/ RER/ kg', 									8.70, 'kg', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'flat glass, coated, at plant/ RER/ kg', 											245.58, 'kg', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'argon, liquid, at plant/ RER/ kg', 												259.35, 'kg', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'plywood, indoor use, at plant/ RER/ m3', 											0.399, 'm3', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'sealing tape, aluminum/PE, 50 mm wide, at plant/ RER/ m', 							33.12, 'm', 30, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,																	'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'glass fibre reinforced plastic, polyamide, injection moulding, at plant/ RER/ kg', 1.10, 'kg', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
			# 23 vacuum insulation panels
		call insert_materialInventory(@BLD, 23, 'expanded perlite, at plant/ CH/ kg', 												6.75, 'kg', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'aluminium, production mix, at plant/ RER/ kg', 									9.72, 'kg', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'polypropylene, granulate, at plant/ RER/ kg', 										81, 'kg', 30, 		'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
			# 23 bathroom window
		call insert_materialInventory(@BLD, 23, 'sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 						3.32, 'm3', 40, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'aluminium, production mix, at plant/ RER/ kg', 									0.67, 'kg', 40, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'glass fibre reinforced plastic, polyamide, injection moulding, at plant/ RER/ kg', 16.50, 'kg', 40, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'flat glass, coated, at plant/ RER/ kg', 											26.70, 'kg', 40, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'argon, liquid, at plant/ RER/ kg', 												39.90, 'kg', 40, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'sealing tape, aluminum/PE, 50 mm wide, at plant/ RER/ m', 							6.14, 'm', 40, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL,																	'Poland', 'Wolsztyn');
			# 23 entrance door
		call insert_materialInventory(@BLD, 23, 'sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 						2.24, 'm3', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'aluminium, production mix, at plant/ RER/ kg', 									0.45, 'kg', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'glass fibre reinforced plastic, polyamide, injection moulding, at plant/ RER/ kg', 32.90, 'kg', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'flat glass, coated, at plant/ RER/ kg', 											21.90, 'kg', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'argon, liquid, at plant/ RER/ kg', 												32.80, 'kg', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'sealing tape, aluminum/PE, 50 mm wide, at plant/ RER/ m', 							3.17, 'm', 30,	NULL, NULL, NULL, NULL, NULL, NULL, NULL,																	'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'polystyrene, expandable, at plant/ RER/ kg', 										3.43, 'kg', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'plywood, indoor use, at plant/ RER/ m3', 											0.02, 'm3', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
        call insert_materialInventory(@BLD, 23, 'chromium steel 18/8, at plant/ RER/ kg', 											6.02, 'kg', 30, 	'Transport, lorry 16-32t, EURO3', 1702, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL,		'Poland', 'Wolsztyn');
			# 24 
		call insert_materialInventory(@BLD, 24, 'plywood, indoor use, at plant/ RER/ m3', 											3.97, 'm3', 30, 	'Transport, lorry 16-32t, EURO5', 1785, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL, 		'Spain', 'Laudio');
        call insert_materialInventory(@BLD, 24, 'glass wool mat, at plant/ CH/ kg', 												187, 'kg', 60, 		'Transport, lorry 16-32t, EURO5', 545, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Askim');
        call insert_materialInventory(@BLD, 24, 'sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 						0.1, 'm3', 40, 		'Transport, lorry 16-32t, EURO5', 494, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Oslo');
        call insert_materialInventory(@BLD, 24, 'polystyrene, expandable, at plant/ RER/ kg', 										2.64, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1728, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL, 		'Belgium', 'Brussels');
			#25
		call insert_materialInventory(@BLD, 25, 'oriented strand board, at plant/ RER/ m3', 										5.53, 'm3', 60, 	'Transport, lorry 16-32t, EURO5', 1413, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL, 		'Germany', 'Heiligengrabe');
        call insert_materialInventory(@BLD, 25, 'glass wool mat, at plant/ CH/ kg', 												826, 'kg', 60, 		'Transport, lorry 16-32t, EURO3', 545, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Askim');
        call insert_materialInventory(@BLD, 25, 'anhydrite floor, at plant/ CH/ kg', 												173, 'kg', 50, 		'Transport, lorry 16-32t, EURO5', 494, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Oslo');
        call insert_materialInventory(@BLD, 25, 'polyethylene, HDPE, granulate, at plant/ RER/ kg', 								243, 'kg', 50, 		'Transport, lorry 16-32t, EURO5', 378, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Goevik');
        call insert_materialInventory(@BLD, 25, 'sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 						1.8, 'm3', 25, 		'Transport, lorry 16-32t, EURO3', 1057, NULL, NULL, NULL, NULL, NULL, 										'Sweden', 'Nybro');
        call insert_materialInventory(@BLD, 25, 'ceramic tiles, at regional storage/ CH/ kg', 										52.99, 'kg', 20, 	'Transport, lorry 16-32t, EURO5', 4098, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL, 		'Turkey', 'Can');
			# 26 top
		call insert_materialInventory(@BLD, 26, 'plywood, indoor use, at plant/ RER/ m3', 											4.22, 'm3', 30, 	'Transport, lorry 16-32t, EURO5', 1785, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL, 		'Spain', 'Laudio');
        call insert_materialInventory(@BLD, 26, 'glass wool mat, at plant/ CH/ kg', 												1210, 'kg', 60, 	'Transport, lorry 16-32t, EURO3', 545, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Askim');
        call insert_materialInventory(@BLD, 26, 'polyethylene, HDPE, granulate, at plant/ RER/ kg', 								653, 'kg', 60, 		'Transport, lorry 16-32t, EURO5', 378, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Goevik');
        call insert_materialInventory(@BLD, 26, 'polypropylene, granulate, at plant/ RER/ kg', 										767, 'kg', 50, 		'Transport, lorry 16-32t, EURO5', 378, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Goevik');
        call insert_materialInventory(@BLD, 26, 'sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 						2.49, 'm3', 50, 	'Transport, lorry 16-32t, EURO3', 494, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Oslo');
        call insert_materialInventory(@BLD, 26, 'bitumen adhesive compound, hot, at plant/ RER/ kg', 								221, 'kg', 30, 		'Transport, lorry 16-32t, EURO5', 378, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Porsgrunn');
        call insert_materialInventory(@BLD, 26, 'polystyrene, expandable, at plant/ RER/ kg', 										222, 'kg', 25, 		'Transport, lorry 16-32t, EURO5', 1728, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL, 		'Belgium', 'Brussels');
        call insert_materialInventory(@BLD, 26, 'oriented strand board, at plant/ RER/ m3', 										0.69, 'm3', 60, 	'Transport, lorry 16-32t, EURO5', 1364, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL, 		'Germany', 'Heiligengrabe');
        call insert_materialInventory(@BLD, 26, 'aluminium, production mix, at plant/ RER/ kg', 									255, 'kg', 30, 		'Transport, lorry 16-32t, EURO5', 1728, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL, 		'Belgium', 'Brussels');
            # 26 4x window
		call insert_materialInventory(@BLD, 26, 'sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 						9.24, 'm3', 40, 	'Transport, lorry 16-32t, EURO5', 494, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Oslo');
        call insert_materialInventory(@BLD, 26, 'aluminium, production mix, at plant/ RER/ kg', 									55.88, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1728, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL, 		'Belgium', 'Brussels');
        call insert_materialInventory(@BLD, 26, 'textile, woven cotton, at plant/ GLO/ kg', 										206.8, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 492, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Oslo');
        call insert_materialInventory(@BLD, 26, 'flat glass, coated, at plant/ RER/ kg', 											48, 'kg', 40, 		'Transport, lorry 16-32t, EURO5', 625, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Larvik');
        call insert_materialInventory(@BLD, 26, 'argon, liquid, at plant/ RER/ kg', 												66.4, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 485, NULL, NULL, NULL, NULL, NULL, 										'na', 'na');
        call insert_materialInventory(@BLD, 26, 'chromium steel 18/8, at plant/ RER/ kg', 											2.92, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 1092, 'Transport, transoceanic freight ship', 364, NULL, NULL, NULL, 		'United Kingdom', 'Sheffield');
            # 26 PV mounting frame
		call insert_materialInventory(@BLD, 26, 'aluminium, production mix, at plant/ RER/ kg', 									156.44, 'kg', 30, 	'Transport, lorry 16-32t, EURO5', 1722, NULL, NULL, NULL, NULL, NULL, 										'Germany', 'Cologne');
        call insert_materialInventory(@BLD, 26, 'bitumen seal, alu80, production / RER / kg', 										106.09, 'kg',30, 	'Transport, lorry 16-32t, EURO5', 1722, NULL, NULL, NULL, NULL, NULL, 										'Germany', 'Cologne');
        call insert_materialInventory(@BLD, 26, 'Polyurethane, flexible foam, at plant / RER / kg', 								4.28, 'kg', 30, 	'Transport, lorry 16-32t, EURO5', 1722, NULL, NULL, NULL, NULL, NULL, 										'Germany', 'Cologne');
        call insert_materialInventory(@BLD, 26, 'polyethylene, HDPE, granulate, at plant/ RER/ kg', 								224, 'kg', 30, 		'Transport, lorry 16-32t, EURO5', 1722, NULL, NULL, NULL, NULL, NULL, 										'Germany', 'Cologne');
        call insert_materialInventory(@BLD, 26, 'sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 						0.18, 'm3', 30, 	'Transport, lorry 16-32t, EURO5', 1722, NULL, NULL, NULL, NULL, NULL, 										'Germany', 'Cologne');
        call insert_materialInventory(@BLD, 26, 'chromium steel 18/8, at plant/ RER/ kg', 											11.27, 'kg', 30, 	'Transport, lorry 16-32t, EURO5', 1722, NULL, NULL, NULL, NULL, NULL, 										'Germany', 'Cologne');
            # 26 phase change material
		call insert_materialInventory(@BLD, 26, 'paraffin, at plant/ RER/ kg', 														216, 'kg', 60, 		'Transport, lorry 16-32t, EURO5', 5, NULL, NULL, NULL, NULL, NULL, 											'Norway', 'Trondheim');
        call insert_materialInventory(@BLD, 26, 'polyethylene, HDPE, granulate, at plant/ RER/ kg', 								144, 'kg', 60, 		'Transport, lorry 16-32t, EURO5', 378, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Goevik');
        call insert_materialInventory(@BLD, 26, 'sealing tape, aluminum/PE, 50 mm wide, at plant/ RER/ m', 							330, 'm', 60, 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, 																	'na', 'na');
        call insert_materialInventory(@BLD, 26, 'aluminium, production mix, at plant/ RER/ kg', 									48.6, 'kg', 60, 	'Transport, lorry 16-32t, EURO5', 1728, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL, 		'Belgium', 'Brussels');
			# 27
		call insert_materialInventory(@BLD, 27, 'plywood, indoor use, at plant/ RER/ m3', 											2.34, 'm3', 30, 	'Transport, lorry 16-32t, EURO5', 1785, 'Transport, transoceanic freight ship', 49, NULL, NULL, NULL, 		'Spain', 'Laudio');
        call insert_materialInventory(@BLD, 27, 'sawn timber, hardwood, planed, air / kiln dried, u=10%, at plant/ RER/ m3', 		0.51, 'm3', 30, 	'Transport, lorry 16-32t, EURO3', 494, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Oslo');
			# 28
		call insert_materialInventory(@BLD, 28, 'sawn timber, softwood, planed, air dried, at plant/ RER/ m3', 						21.64, 'm3', 20, 	'Transport, lorry 16-32t, EURO3', 625, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Skien');
        call insert_materialInventory(@BLD, 28, 'chromium steel 18/8, at plant/ RER/ kg', 											1880, 'kg', 60, 	'Transport, lorry 16-32t, EURO5', 1092, 'Transport, transoceanic freight ship', 364, NULL, NULL, NULL, 		'United Kingdom', 'Sheffield');
			# 31
		call insert_materialInventory(@BLD, 31, 'sanitary ceramics, at regional storage/ CH/ kg', 									29.9, 'kg', 50, 	'Transport, lorry 16-32t, EURO5', 4098, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL, 		'Turkey', 'Can');
		call insert_materialInventory(@BLD, 31, 'chromium steel 18/8, at plant/ RER/ kg', 											1.7, 'kg', 15, 		'Transport, lorry 16-32t, EURO5', 1092, 'Transport, transoceanic freight ship', 364, NULL, NULL, NULL, 		'United Kingdom', 'Sheffield');
        call insert_materialInventory(@BLD, 31, 'flat glass, coated, at plant/ RER/ kg', 											27.6, 'kg', 40, 	'Transport, lorry 16-32t, EURO5', 625, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Larvik');
        call insert_materialInventory(@BLD, 31, 'chromium steel 18/8, at plant/ RER/ kg', 											5.5, 'kg', 50, 		'Transport, lorry 16-32t, EURO5', 1092, 'Transport, transoceanic freight ship', 364, NULL, NULL, NULL, 		'United Kingdom', 'Sheffield');
        call insert_materialInventory(@BLD, 31, 'chromium steel 18/8, at plant/ RER/ kg', 											1.5, 'kg', 15, 		'Transport, lorry 16-32t, EURO5', 1092, 'Transport, transoceanic freight ship', 364, NULL, NULL, NULL, 		'United Kingdom', 'Sheffield');
			# 32
		call insert_materialInventory(@BLD, 32, 'polyethylene, HDPE, granulate, at plant/ RER/ kg', 								85, 'kg', 50, 		'Transport, lorry 16-32t, EURO5', 378, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Goevik');
        call insert_materialInventory(@BLD, 32, 'ethylene, pipeline system, at plant/ RER/ kg', 									137.84, 'kg', 50, 	'Transport, lorry 16-32t, EURO5', 668, NULL, NULL, NULL, NULL, NULL, 										'na', 'na');
        call insert_materialInventory(@BLD, 32, 'flat plate collector, at plant/ CH/ m2', 											4.18, 'm2', 25, 	'Transport, lorry 16-32t, EURO5', 1790, 'Transport, transoceanic freight ship', 163, NULL, NULL, NULL, 		'Poland', 'na');
        call insert_materialInventory(@BLD, 32, 'hot water tank 600l, at plant/ CH/ unit', 											1, 'pcs', 20, 		'Transport, lorry 16-32t, EURO5', 556, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Hokksund');
        call insert_materialInventory(@BLD, 32, 'heat pump 30kW/ RER/ unit', 														1, 'pcs', 20, 		'Transport, lorry 16-32t, EURO5', 2293, 'Transport, transoceanic freight ship', 169, 'Transport, freight, rail', 23, NULL, 	'na', 'na');
			# 36
		call insert_materialInventory(@BLD, 36, 'chromium steel 18/8, at plant/ RER/ kg', 											53.4, 'kg', 60, 	'Transport, lorry 16-32t, EURO5', 1092, 'Transport, transoceanic freight ship', 364, NULL, NULL, NULL, 		'United Kingdom', 'Sheffield');
        call insert_materialInventory(@BLD, 36, 'flexible duct, aluminum/PET, DN of 125, at plant/ RER/ m', 						3, 'm', 60, 		'Transport, lorry 16-32t, EURO5', 552, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Drammen');
        call insert_materialInventory(@BLD, 36, 'air distribution housing, steel, 120 m3/h, at plant/ CH/ unit', 					1, 'pcs', 60, 		'Transport, lorry 16-32t, EURO5', 552, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Drammen');
        call insert_materialInventory(@BLD, 36, 'supply air inlet, steel/SS, DN 75, at plant/ RER/ unit', 							5, 'pcs', 60, 		'Transport, lorry 16-32t, EURO5', 552, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Drammen');
        call insert_materialInventory(@BLD, 36, 'exhaust air valve, in-wall housing, plastic/steel, DN 125, at plant/ CH/ unit', 	3, 'pcs', 60, 		'Transport, lorry 16-32t, EURO5', 552, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Drammen');
        call insert_materialInventory(@BLD, 36, 'exhaust air outlet, steel/aluminum, 85x365 mm, at plant/ CH/ unit', 				1, 'pcs', 60, 		'Transport, lorry 16-32t, EURO5', 552, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Drammen');
        call insert_materialInventory(@BLD, 36, 'outside air intake, stainless steel, DN 370, at plant/ RER/ unit', 				1, 'pcs', 60, 		'Transport, lorry 16-32t, EURO5', 552, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Drammen');
			# 39 SKIPPING THIS
            # 44
		call insert_materialInventory(@BLD, 44, 'plugs, inlet and outlet, for computer cable, at plant/ GLO/ unit', 				23, 'pcs', 30, 		'Transport, lorry 16-32t, EURO5', 552, NULL, NULL, NULL, NULL, NULL, 										'Norway', 'Oslo');
            # 49
		call insert_materialInventory(@BLD, 49, 'photovoltaic panel, multi-Si, at plant/ ROW/ m2', 									79.2, 'm2', 30, 	'Transport, lorry 16-32t, EURO5', 2636, NULL, NULL, NULL, NULL, NULL, 										'Singapore','Tuas');
        call insert_materialInventory(@BLD, 49, 'electronic component, unspecified, at plant/ GLO/ kg', 							0.75, 'kg', 30, 	'Transport, lorry 16-32t, EURO5', 1613, NULL, NULL, NULL, NULL, NULL, 										'Germany', 'Niestetal');
        call insert_materialInventory(@BLD, 49, 'electronic component, unspecified, at plant/ GLO/ kg', 							0.18, 'kg', 30, 	'Transport, lorry 16-32t, EURO5', 1613, NULL, NULL, NULL, NULL, NULL, 										'Germany', 'Niestetal');
        call insert_materialInventory(@BLD, 49, 'electronic component, unspecified, at plant/ GLO/ kg', 							0.5, 'kg', 30, 		'Transport, lorry 16-32t, EURO5', 1613, NULL, NULL, NULL, NULL, NULL, 										'Germany', 'Niestetal');
        call insert_materialInventory(@BLD, 49, 'chromium steel 18/8, at plant/ RER/ kg', 											2, 'kg', 30, 		'Transport, lorry 16-32t, EURO5', 1613, NULL, NULL, NULL, NULL, NULL, 										'Germany', 'Niestetal');
        call insert_materialInventory(@BLD, 49, 'electronic component, unspecified, at plant/ GLO/ kg', 							0.3, 'kg', 30, 		'Transport, lorry 16-32t, EURO5', 1613, NULL, NULL, NULL, NULL, NULL, 										'Germany', 'Niestetal');
        call insert_materialInventory(@BLD, 49, 'electronic component, unspecified, at plant/ GLO/ kg', 							52, 'kg', 15, 		'Transport, lorry 16-32t, EURO5', 1613, NULL, NULL, NULL, NULL, NULL, 										'Germany', 'Niestetal');
        call insert_materialInventory(@BLD, 49, 'electronic component, unspecified, at plant/ GLO/ kg', 							0.08, 'kg', 30, 	'Transport, lorry 16-32t, EURO5', 1664, NULL, NULL, NULL, NULL, NULL, 										'Germany', 'Essen');
        call insert_materialInventory(@BLD, 49, 'electronic component, unspecified, at plant/ GLO/ kg', 							0.08, 'kg', 30, 	'Transport, lorry 16-32t, EURO5', 1664, NULL, NULL, NULL, NULL, NULL, 										'Germany', 'Essen');
        call insert_materialInventory(@BLD, 49, 'cable, three-conductor cable / GLO / m', 											175, 'm', 30, 		'Transport, lorry 16-32t, EURO5', 2164, NULL, NULL, NULL, NULL, NULL, 										'Czech Republic', 'Holesov');
        call insert_materialInventory(@BLD, 49, 'cable, three-conductor cable / GLO / m', 											20, 'm', 30, 		'Transport, lorry 16-32t, EURO5', 2164, NULL, NULL, NULL, NULL, NULL, 										'Czech Republic', 'Holesov');



	-- -- -- -- -- -- -- -- -- -- -- --
	-- Insert GWP results: Option 3 --
	-- -- -- -- -- -- -- -- -- -- -- --
	-- Option 3: A combination of the two above


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