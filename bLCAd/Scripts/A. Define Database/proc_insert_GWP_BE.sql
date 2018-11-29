/*
Insert emission values into a chosen building element for a chosen building or update values if already exists
*/
USE `bLCAd`;
DROP procedure IF EXISTS `insert_GWP_BE`;

DELIMITER //
CREATE  PROCEDURE `insert_GWP_BE`(	in ibuilding_identifier varchar(45),
										in ilevel int(11),
                                        in iA1A3 decimal(20,10),
                                        in iA4 decimal(20,10),
                                        in iB4_m decimal(20,10),
                                        in iB4_t decimal(20,10),

                                        in iA5 decimal(20,10),
                                        in iB1 decimal(20,10),
                                        in iB2 decimal(20,10),
                                        in iB3 decimal(20,10),
                                        in iB5 decimal(20,10),
                                        in iC1 decimal(20,10),
                                        in iC2 decimal(20,10),
                                        in iC3 decimal(20,10),
                                        in iC4 decimal(20,10),
                                        in iD1 decimal(20,10),
                                        in iD2 decimal(20,10),
                                        in iD3 decimal(20,10),
                                        in iD4 decimal(20,10)
									)

BEGIN
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Insert building element with emission values --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
INSERT INTO buildingelements (idbuildings, idlevels, A1A3, A4, A5, B4_m, B4_t,
                                                        B1,B2,B3,B5,
                                                        C1,C2,C3,C4,
                                                        D1,D2,D3,D4)
	VALUES (
				(
                SELECT idbuildings FROM buildings WHERE building_identifier=
                /*identifier*/ ibuilding_identifier
                ),
				/*idlevels*/	ilevel,
                
                /*A1A3*/ 		iA1A3,
                /*A4*/ 			iA4,
                /*A5*/ 			iA5,
                /*B4*/ 			iB4_m, iB4_t,
                                iB1,iB2,iB3,iB5,
                                iC1,iC2,iC3,iC4,
                                iD1,iD2,iD3,iD4
            )
	ON DUPLICATE KEY UPDATE A1A3=iA1A3, A4=iA4, A5=iA5, B4_m=iB4_m, B4_t=iB4_t,
                            B1=iB1,B2=iB2,B3=iB3,B5=iB5,
                            C1=iC1,C2=iC2,C3=iC3,C4=iC4,
                            D1=iD1,D2=iD2,D3=iD3,D4=iD4 ;

END//
DELIMITER ;