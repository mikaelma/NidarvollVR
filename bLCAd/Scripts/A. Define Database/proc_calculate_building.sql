/*
This is the MAIN procedure. It will calculate emissions for the whole building after everything has been entered.
This is the only procedure that must be called to recalculate the whole building LCA.
*/

USE `bLCAd`;
DROP procedure IF EXISTS `calculate_building`;

DELIMITER //
CREATE PROCEDURE `calculate_building`( in ibuilding_identifier varchar(45) )

BEGIN

DECLARE dbuilding int(11);
SELECT idbuildings INTO dbuilding FROM buildings WHERE building_identifier=ibuilding_identifier;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- Calculate the leaf buildingElements as the sum of its materials -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
/* Select all building elements for a specified building and do the following for all
CALL calculate_leafBuildingElements(ibuilding_element);
When a materialInventory is inserted, the building element is created, therefore it exists and can be found as belonging to the building.
Iterate through the building's buildingElements and run the calculation for all in no particular order.
*/
CALL calculate_all_leafbuildingElements(dbuilding);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Calculate the parent buildingElemtents from lowest level to highest -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  --
/* Calculates all the parents of all existing building elements by calling: 
CALL calculate_parentbuildingElements(ibuilding_element);
Building elements exist if (1) material inventory was inserted or if (2) building element results was inserted.
If parent building element does not exist it will be created.
Starts with hierarchy 3, then 2, then 1.
 */
CALL calculate_all_parentbuildingElements(dbuilding,3);
CALL calculate_all_parentbuildingElements(dbuilding,2);
CALL calculate_all_parentbuildingElements(dbuilding,1);

END//
DELIMITER ;