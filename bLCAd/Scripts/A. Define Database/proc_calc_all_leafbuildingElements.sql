/*
Iterate through all buildingelements for a building and insert sum of inventories into building elements.
*/

USE `bLCAd`;
DROP procedure IF EXISTS `calculate_all_leafbuildingElements`;

DELIMITER //
CREATE PROCEDURE `calculate_all_leafbuildingElements`( in ibuilding int(11) )

BEGIN
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- Calculate the leaf buildingElements as the sum of its materials -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
DECLARE done INT DEFAULT 0;
DECLARE beID int(11);
DECLARE cur CURSOR FOR
    SELECT idbuilding_elements
    FROM buildingElements
    WHERE idbuildings=ibuilding;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN cur;

read_loop: LOOP
 
    FETCH cur INTO beID;  -- Fetch one record from CURSOR and set to some variable(If not found then done will be set to 1 by continue handler)
    IF done THEN
        LEAVE read_loop;  -- If done set to 1 then exit the loop else continue
    END IF;
 
    /* Do work */
    CALL calculate_leafBuildingElements(beID);
 
END LOOP;
CLOSE cur; -- Closing the cursor

END//
DELIMITER ;