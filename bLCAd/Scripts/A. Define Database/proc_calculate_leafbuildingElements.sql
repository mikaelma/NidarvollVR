/*
Calculates building elements as the sum of materialInventory entries that are connected to that building element.	
*/

USE `bLCAd`;
DROP procedure IF EXISTS `calculate_leafbuildingElements`;

DELIMITER //
CREATE  PROCEDURE `calculate_leafbuildingElements`(	in ibuilding_element int(11)
													)

BEGIN
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Declaring the variables to be used in the calculation -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
declare sumA1A3mi decimal(20,10); 
declare sumA4mi decimal(20,10);
declare sumB4_mmi decimal(20,10);
declare sumB4_tmi decimal(20,10);

declare sumA5mi decimal(20,10);
declare sumB1mi decimal(20,10);
declare sumB2mi decimal(20,10);
declare sumB3mi decimal(20,10);
declare sumB5mi decimal(20,10);
declare sumC1mi decimal(20,10);
declare sumC2mi decimal(20,10);
declare sumC3mi decimal(20,10);
declare sumC4mi decimal(20,10);
declare sumD1mi decimal(20,10);
declare sumD2mi decimal(20,10);
declare sumD3mi decimal(20,10);
declare sumD4mi decimal(20,10);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Calculate the building elemtent as the sum of its materials -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
select 	sum(mi.A1A3), sum(mi.A4), sum(mi.B4_m), sum(mi.B4_t),
		sum(mi.A5), sum(mi.B1), sum(mi.B2), sum(mi.B3), sum(mi.B5), 
		sum(mi.C1), sum(mi.C2), sum(mi.C3), sum(mi.C4), 
		sum(mi.D1), sum(mi.D2), sum(mi.D3), sum(mi.D4)
into 	sumA1A3mi, sumA4mi, sumB4_mmi, sumB4_tmi,
		sumA5mi, sumB1mi, sumB2mi, sumB3mi, sumB5mi,
		sumC1mi, sumC2mi, sumC3mi, sumC4mi,
		sumD1mi, sumD2mi, sumD3mi, sumD4mi  
from 	materialInventory mi
where 	mi.idbuilding_elements=ibuilding_element;

-- -- -- -- -- -- -- -- -- --
-- Update  building element -- 
-- -- -- -- -- -- -- -- -- --
-- inserting / updating these values into the building element
update 	buildingElements be
set 	be.A1A3 = IF(sumA1A3mi is not null, sumA1A3mi, be.A1A3),
		be.A4 = IF(sumA4mi is not null, sumA4mi, be.A4),
		be.B4_m = IF(sumB4_mmi is not null, sumB4_mmi, be.B4_m),
        be.B4_t = IF(sumB4_tmi is not null, sumB4_tmi, be.B4_t),
        
        be.A5 = IF(sumA5mi is not null, sumA5mi, be.A5),
        be.B1 = IF(sumB1mi is not null, sumB1mi, be.B1),
        be.B2 = IF(sumB2mi is not null, sumB2mi, be.B2),
        be.B3 = IF(sumB3mi is not null, sumB3mi, be.B3),
        be.B5 = IF(sumB5mi is not null, sumB5mi, be.B5),
        be.C1 = IF(sumC1mi is not null, sumC1mi, be.C1),
        be.C2 = IF(sumC2mi is not null, sumC2mi, be.C2),
        be.C3 = IF(sumC3mi is not null, sumC3mi, be.C3),
        be.C4 = IF(sumC4mi is not null, sumC4mi, be.C4),
        be.D1 = IF(sumD1mi is not null, sumD1mi, be.D1),
        be.D2 = IF(sumD2mi is not null, sumD2mi, be.D2),
        be.D3 = IF(sumD3mi is not null, sumD3mi, be.D3),
        be.D4 = IF(sumD4mi is not null, sumD4mi, be.D4)

where 	be.idbuilding_elements=ibuilding_element;


END//
DELIMITER ;