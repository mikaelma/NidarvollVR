-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Workflow for inserting a new building / updating a building entry --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
/* 
Example building 1.
Example of using Option 1 for data entry.
Data used are results for ZEB Living Lab.

*/
USE bLCAd;


-- -- -- -- -- -- -- -- --
-- Define building name --
-- -- -- -- -- -- -- -- --
-- Define the building_identifier that will be used to reference the building (composed of a letter for the typology and a three digit number)
SET @BLD='R001';

-- -- -- -- -- -- --
-- Insert building --
-- -- -- -- -- -- --
-- First insert building
/* TEMPLATE: call insert_building(@BLD,
	'Name', 'Main data type: EPD/Ecoinvent/Mixed', 'Study type: published research/unpublished research/industry/certification',study_year,
	Lifetime, floor area, heated volume, area_footprint, area roof, area wall, area windows and doors, heatloss number, GWP B6, stories above ground, stories below ground,
	'comments', 'typology', 'construction type', 'city', 'built status', 'energy ambition level'); */

call insert_building(@BLD, 
	'ZEB Living Lab - results only', 'Ecoinvent', 'published research', 9999,
	60, 102, 319, NULL, 119, 207, 25, NULL, NULL, 1, 0,
	'This is an example for entering results into the building elements',
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
	call insert_GWP_BE(@BLD, 21, 	4263.58,	1747.21,	426.35811,	2.5896E-14, NULL);
    call insert_GWP_BE(@BLD, 22, 	3079.65,	562.99,	307.964621,	0, NULL);
    call insert_GWP_BE(@BLD, 23, 	17684.98,	1226.17,	1768.50	,11611.31, NULL);
    call insert_GWP_BE(@BLD, 24, 	2222.35,	64.51	,222.234722,	44.97992774, NULL);
    call insert_GWP_BE(@BLD, 25, 	3404.53	,335.79	,340.452769	,644.427409, NULL);
    call insert_GWP_BE(@BLD, 26, 	10799.29,	400.94,	1079.929111,	5910.157043, NULL);
    call insert_GWP_BE(@BLD, 27, 	1197.85	,48.30	,119.78451,	1246.14074, NULL);
    call insert_GWP_BE(@BLD, 28, 	10308.06,	1266.11	,1030.8056,	6179.302, NULL);
    call insert_GWP_BE(@BLD, 31, 	99.73	,6.39	,9.9732	,71.56554295, NULL);
    call insert_GWP_BE(@BLD, 32, 	1630.52	,90.22	,163.0518736,	2484.359479, NULL);
    call insert_GWP_BE(@BLD, 36, 	550.91	,7.35	,55.091	,-1.1241E-15, NULL);
    call insert_GWP_BE(@BLD, 39, 	2244.92	,62.27	,224.4923738,	9220.847631, NULL);
    call insert_GWP_BE(@BLD, 44, 	7.544	,2.805816,	0.7544,	10.349816, NULL);
    call insert_GWP_BE(@BLD, 49, 	16625.59634, 389.3426145	,1662.559634,	18643.0568, NULL);


	-- -- -- -- -- -- -- -- -- -- -- --
	-- Insert GWP results: Option 2 --
	-- -- -- -- -- -- -- -- -- -- -- --
	/* Option 2: Inserting materials and then material inventories
	This option has the highest level of detail, it actually recalculates the whole LCA and contains all information
	*/	
		-- Insert material categories if they are not already in the database
		
		-- Insert location if it is not already in the database
		
		-- Insert materials if they are not already in the database
		# TEMPLATE: call insert_material('triple-glazed window, norway', 'Specific', 'EPD', 'Norway', 2016, 'pcs', NULL, 4, 40, 'This has the unit pcs, lets see if that works', 'windows', 'Norway', 'Oslo');


		-- Insert transport emission factors if they are not already in the database
		# TEMPLATE: INSERT INTO GWP_transport (mode, name, GWP_pertkm) VALUES ('', '', ), ('', '', ), ('', '', );

		-- Insert materials into the inventory of the building, connected to a certain building element
		# TEMPLATE: call insert_materialInventory(@BLD, level, 'name_material', quantity, 'FU', 'nameT1', T1dist, 'nameT2', T2dist, 'nameT3', T3dist, A5);


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