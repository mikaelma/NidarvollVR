/*
Calculates all parents of all buildingElements that already exist, bottom-up.
Does this for a specified building.
Choose hierarchy 3 first, then 2 then 1.

If building element exist at this level, create parent (if not already exists) and then calculate parent. 

This procedure is inefficient, because it recalculates the parent multiple times. But that doesnt matter much for this application.
*/

USE `bLCAd`;
DROP procedure IF EXISTS `calculate_all_parentbuildingElements`;

DELIMITER //
CREATE PROCEDURE `calculate_all_parentbuildingElements`( 	in ibuilding int(11),
															in ihierarchy tinyint(4))

BEGIN
-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Calculate the parent buildingElemtents -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
declare dparentID int(11);
declare didparent int(11);

DECLARE done INT DEFAULT 0;
DECLARE beID int(11);
DECLARE cur CURSOR FOR
    SELECT be.idbuilding_elements
    FROM buildingElements be
    JOIN levels l on be.idlevels=l.idlevels
    WHERE be.idbuildings=ibuilding
    AND l.hierarchy=ihierarchy; -- choosing all existing building elements for a hierarchy and building

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
OPEN cur;

read_loop: LOOP

    FETCH cur INTO beID;  -- Fetch one record from CURSOR and set to some variable(If not found then done will be set to 1 by continue handler)
    IF done THEN
        LEAVE read_loop;  -- If done set to 1 then exit the loop else continue
    END IF;
 
 
-- need this separete begin/end with c"ontinue handler for not found" so that loop will continue and not terminate prematurely
begin 
	declare continue handler for not found begin end;
    /* Do work */
    -- select parent idlevel
    select  l.idparent
    into didparent
	from buildingElements ch
	join levels l on ch.idlevels=l.idlevels
	where ch.idbuilding_elements = beID;
    
-- BEGIN COMMENT: This chunk can probably be replaced by an INSERT ... ON DUPLICATE ENTRY UPDATE ...
    -- select parent ID for building element, NULL if does not exist
    set dparentID=NULL; -- reseting to NULL for new beID before check
    
    select pa.idbuilding_elements
    into dparentID
	from buildingElements pa
	join levels l on pa.idlevels=l.idparent
	join buildingElements ch on ch.idlevels=l.idlevels
	where ch.idbuilding_elements = beID
    and pa.idbuildings=ibuilding;

    -- create parent if not exists, calculate parent
    IF dparentID is null THEN
		
		INSERT INTO buildingElements (idbuildings, idlevels)
        VALUES (ibuilding, didparent);
        
        select pa.idbuilding_elements
		into dparentID
		from buildingElements pa
		join levels l on pa.idlevels=l.idparent
		join buildingElements ch on ch.idlevels=l.idlevels
		where ch.idbuilding_elements = beID
		and pa.idbuildings=ibuilding;
        
        CALL calculate_parentBuildingElements(dparentID);
    
	ELSE
		CALL calculate_parentBuildingElements(dparentID);
    END IF;
end;
-- END COMMENT.
    
END LOOP read_loop;
CLOSE cur; -- Closing the cursor

END//
DELIMITER ;