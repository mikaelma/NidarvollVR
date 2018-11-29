/*
Insert a material into a chosen building element for a chosen building
Do GWP calculations based on quantity etc.

TODO:
- create building element only iff not exists already

*/
USE `bLCAd`;
DROP procedure IF EXISTS `insert_materialInventory`;

DELIMITER //
CREATE  PROCEDURE `insert_materialInventory`(	in ibuilding_identifier varchar(45),
												in ilevel int(11),
												in inameMaterial varchar(200),
												
                                                in iquantity decimal(10,3), # Must be in the unit of the material
                                                in iFU enum('kg', 'm', 'm2','m3','pcs'),
                                                
                                                in iRSL tinyint(4),
                                                
                                                in inameT1 varchar(100),
												in idistance_T1 int(11), 
                                                
                                                in inameT2 varchar(100),
												in idistance_T2 int(11), 
                                                
                                                in inameT3 varchar(100),
												in idistance_T3 int(11),
                                                
                                                in iA5 decimal(20,10), # This one is uncertain, to be determined
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
		                                        in iD4 decimal(20,10),
												
                                                in ilocationproduction_country varchar(45),
												in ilocationproduction_city varchar(45)
												)

this_proc:BEGIN
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Declaring the variables to be used in the calculation --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
declare dmaterial int(11);
declare dFU enum('kg','m','m2','m3','pcs');
declare ddensity decimal(10,3);
declare dRSL tinyint(4);
declare dlifetime int(11);
declare dA1A3_mat decimal(10,3);
declare ddataType enum('Generic','Specific','na');
declare didlocationproduction int(11);

declare dbuilding_element int(11);

declare didGWP_T1 int(11);
declare didGWP_T2 int(11);
declare didGWP_T3 int(11);

declare dGWP_T1 decimal(10,5);
declare dGWP_T2 decimal(10,5);
declare dGWP_T3 decimal(10,5);

declare dB4_factor decimal(20,10);
declare dB4_m decimal(20,10);
declare dB4_t decimal(20,10);

declare dA4_T1 decimal(20,10);
declare dA4_T2 decimal(20,10);
declare dA4_T3 decimal(20,10);

declare dA1A3 decimal(20,10);
declare dA4 decimal(20,10);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Importing values into the declared variables and controlling for wrong values --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- find idmaterial based on nameMaterial
-- import other values from materials table
SELECT 	m.idmaterials, m.FU,  m.EEf_A1A3, m.density, m.RSL, m.dataType, m.idlocationproduction
INTO 	dmaterial, dFU, dA1A3_mat, ddensity, dRSL, ddataType, didlocationproduction
FROM 	materials m
WHERE 	m.name=inameMaterial;

-- overwrite RSL if it exists in materialInventory (if entered in MI it will be prioritized over value in materials)
if iRSL is not null THEN
	set dRSL=iRSL;
END IF;

-- check that the unit is the same as in the material
	# check that dFU=iFU, if it is not then abort procedure and write error message
IF dFU NOT LIKE iFU THEN
	select concat('ERROR: Inventory not added. The unit of this entry: "',inameMaterial,'" is not the same as the unit of the material.');
	LEAVE this_proc;
END IF;

-- idlocationproduction
	# if idlocationproduction_country and city are given as inputs, then they are used for the idlocationproduction
    # if they are not given then the value from materials table will be used
		# if the material dataType is 'Generic' then the idlocationproduction must be entered into the material inventory
		# if the material dataType is 'Specific' AND values are entered in material inventory then a warning message will be printed
    # NB: idlocationproduction is not used in calculations, is only used for information storage
#IF idlocationproduction_country is not NULL THEN
IF  ilocationproduction_country IS NOT NULL AND ilocationproduction_city IS NOT NULL THEN
	set didlocationproduction = (SELECT l.idlocation FROM location l WHERE l.country=ilocationproduction_country AND l.city=ilocationproduction_city);
    IF ddataType = 'Specific' THEN
		select concat('dataType for material "',inameMaterial,'" is Specific but locationproduction is overwritten since values are entered for location');
	END IF;
END IF;

-- create the building element iff it does not already exist
INSERT INTO buildingelements (idbuildings, idlevels)
	VALUES ((SELECT idbuildings FROM buildings WHERE building_identifier=ibuilding_identifier),	ilevel)
	ON DUPLICATE KEY UPDATE idlevels=ilevel;

-- find idbuilding_elements based on building and level
SELECT 	be.idbuilding_elements, b.lifetime
INTO 	dbuilding_element, dlifetime
FROM 	buildingElements be
JOIN 	buildings b ON be.idbuildings=b.idbuildings
WHERE 	b.building_identifier=ibuilding_identifier
AND 	be.idlevels=ilevel;

-- find idGWP_transport 1/2/3 based on inameT 1/2/3
SELECT gwt.idGWP_transport INTO didGWP_T1 FROM gwp_transport gwt WHERE gwt.name=inameT1;
	-- check if transport name exist
	IF didGWP_T1 is NULL and idistance_T1 is not NULL THEN
		select concat('ERROR: Inventory not added. The transport name: "',inameT1,'" does not exist, and there is a distance entered for this transport.');
		LEAVE this_proc;
	END IF;
SELECT gwt.idGWP_transport INTO didGWP_T2 FROM gwp_transport gwt WHERE gwt.name=inameT2;
	-- check if transport name exist
	IF didGWP_T2 is NULL and idistance_T2 is not NULL THEN
		select concat('ERROR: Inventory not added. The transport name: "',inameT2,'" does not exist, and there is a distance entered for this transport.');
		LEAVE this_proc;
	END IF;
SELECT gwt.idGWP_transport INTO didGWP_T3 FROM gwp_transport gwt WHERE gwt.name=inameT3;
	-- check if transport name exist
	IF didGWP_T3 is NULL and idistance_T3 is not NULL THEN
		select concat('ERROR: Inventory not added. The transport name: "',inameT3,'" does not exist, and there is a distance entered for this transport.');
		LEAVE this_proc;
	END IF;


-- -- -- -- -- -- -- -- -- -- --
-- Calculate emission values --
-- -- -- -- -- -- -- -- -- -- --
-- calculate A1A3 --
-- -- -- -- -- --  --
SET dA1A3 = dA1A3_mat * iquantity;

-- calculate A4 --
-- -- -- -- -- --
# If there is a value in the transport 1/2/3 id, then select the emission factor from the GWP_transport table
# and calculate the transport 1/2/3 as emission factor [GWP/(t*km)] * 1/1000 [t/kg] * distance [km] * quantity [unit] * density [kg/unit] = [GWP]
IF coalesce(didGWP_T1,0) > 0 THEN
	SELECT gwt.GWPper_tkm into dGWP_T1
	FROM  gwp_transport gwt
	WHERE gwt.idGWP_transport = didGWP_T1;
	SET dA4_T1 = dGWP_T1 * idistance_T1* iquantity * ddensity * 0.001;
END IF;
IF coalesce(didGWP_T2,0) > 0 THEN
	SELECT gwt.GWPper_tkm into dGWP_T2
	FROM  gwp_transport gwt
	WHERE gwt.idGWP_transport = didGWP_T2;
	SET dA4_T2 = dGWP_T2 * idistance_T2* iquantity * ddensity * 0.001;
END IF;
IF coalesce(didGWP_T3,0) > 0 THEN
	SELECT gwt.GWPper_tkm into dGWP_T3
	FROM  gwp_transport gwt
	WHERE gwt.idGWP_transport = didGWP_T3;
	SET dA4_T3 = dGWP_T3 * idistance_T3* iquantity * ddensity * 0.001;
END IF;

SET dA4 = (coalesce(dA4_T1,0) + coalesce(dA4_T2,0) + coalesce(dA4_T3,0));

-- calculate B4 --
-- -- -- -- -- -- 
# Calculating it if the material life is shorter than the building life. If is is equal to or larger then it is set to zero, and if does not exist then it is set to NULL.
IF dRSL < dlifetime THEN
	set dB4_factor = 	dlifetime/dRSL -1 ;
	set dB4_m = 		dA1A3 * dB4_factor;
	
	set dB4_t = dA4 * dB4_factor;
ELSEIF dRSL = NULL THEN
	set dB4_m = NULL;
    set dB4_t = NULL;
ELSE
	set dB4_m = 0;
    set dB4_t = 0;
END IF;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Insert material in inventory with calculated emission values --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
INSERT INTO materialInventory (	idbuilding_elements, idmaterials, quantity, RSL_mi,
								idGWP_transport1, transport1_distance,
                                idGWP_transport2, transport2_distance,
								idGWP_transport3, transport3_distance,
								A1A3, A4, A5, B4_m, B4_t,

								B1,B2,B3,B5,C1,C2,C3,C4,D1,D2,D3,D4,

                                idlocationproduction
                                )
VALUES (						dbuilding_element, dmaterial, iquantity, iRSL,
								didGWP_T1, idistance_T1,
								didGWP_T2, idistance_T2,
								didGWP_T3, idistance_T3,
								dA1A3, dA4, iA5, dB4_m, dB4_t,

								iB1,iB2,iB3,iB5,iC1,iC2,iC3,iC4,iD1,iD2,iD3,iD4,

                                didlocationproduction
								);


END//
DELIMITER ;