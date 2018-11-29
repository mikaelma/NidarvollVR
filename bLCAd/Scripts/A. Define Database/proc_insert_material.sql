/*
Insert new material
*/
USE `bLCAd`;
DROP procedure IF EXISTS `insert_material`;

DELIMITER //
CREATE  PROCEDURE `insert_material`(	in iname varchar(200),
										in idataType enum('Generic','Specific','na'),
                                        in isourceType enum('EPD','PEP','Custom','Ecoinvent','Klimatre', 'EMPA','Other','na'),
                                        in idataYear year(4),
                                        in iFU enum('kg','m','m2','m3','pcs'),
                                        in idensity decimal(10,3),
                                        in iEEf_A1A3 decimal(10,3),
                                        in iRSL tinyint(4),
                                        in icomments varchar(200),
                                        in imaterialCat varchar(45),
                                        in ilocationproduction_country varchar(45),
                                        in ilocationproduction_city varchar(45)
									)

BEGIN
-- -- -- -- -- -- -- 
-- Insert values --
-- -- -- -- -- -- -- 
INSERT INTO materials (name, dataType, sourceType, dataYear, FU, density, EEf_A1A3, RSL, comments, idmaterialCat, idlocationproduction)
VALUES (iname,idataType,isourceType,idataYear,iFU,idensity,iEEf_A1A3,iRSL,icomments,
		(SELECT mc.idmaterialCat FROM materialCat mc WHERE mc.materialCat=imaterialCat),
        (SELECT l.idlocation FROM location l WHERE l.country=ilocationproduction_country AND l.city=ilocationproduction_city)
        );

END//
DELIMITER ;