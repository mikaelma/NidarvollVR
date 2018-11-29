/*
Calculates building elements as the sum of child entries of that building element.
*/

USE `bLCAd`;
DROP procedure IF EXISTS `calculate_parentbuildingElements`;

DELIMITER //
CREATE  PROCEDURE `calculate_parentbuildingElements`(	in ibuilding_element int(11)
                                                    )

BEGIN
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Declaring the variables to be used in the calculation -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
declare sumA1A3ch decimal(20,10);
declare sumA4ch decimal(20,10);
declare sumB4_mch decimal(20,10);
declare sumB4_tch decimal(20,10);

declare sumA5ch decimal(20,10);
declare sumB1ch decimal(20,10);
declare sumB2ch decimal(20,10);
declare sumB3ch decimal(20,10);
declare sumB5ch decimal(20,10);
declare sumC1ch decimal(20,10);
declare sumC2ch decimal(20,10);
declare sumC3ch decimal(20,10);
declare sumC4ch decimal(20,10);
declare sumD1ch decimal(20,10);
declare sumD2ch decimal(20,10);
declare sumD3ch decimal(20,10);
declare sumD4ch decimal(20,10);

declare ibuilding int(11);
declare ilevels int(11);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Importing values into the declared variables -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
select 	idbuildings, idlevels 
into 	ibuilding, ilevels
from 	buildingelements
where 	idbuilding_elements=ibuilding_element;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Calculate the parent as sum of children -- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
select 	sum(be.A1A3), sum(be.A4), sum(be.B4_m), sum(be.B4_t),
        sum(be.A5), sum(be.B1), sum(be.B2), sum(be.B3), sum(be.B5),
        sum(be.C1), sum(be.C2), sum(be.C3), sum(be.C4),
        sum(be.D1), sum(be.D2), sum(be.D3), sum(be.D4)
into 	sumA1A3ch, sumA4ch, sumB4_mch, sumB4_tch,
		sumA5ch, sumB1ch, sumB2ch, sumB3ch, sumB5ch,
		sumC1ch, sumC2ch, sumC3ch, sumC4ch,
		sumD1ch, sumD2ch, sumD3ch, sumD4ch
from 	buildingElements be
join 	levels l on be.idlevels=l.idlevels
where 	l.idparent=ilevels
and 	be.idbuildings=ibuilding;

-- -- -- -- -- -- --
-- Update  parent -- 
-- -- -- -- -- -- --
-- inserting / updating these values into the building element

UPDATE 	buildingElements be
SET 	be.A1A3 = IF(sumA1A3ch is not null, sumA1A3ch, be.A1A3),
		be.A4 = IF(sumA4ch is not null, sumA4ch, be.A4),
		be.B4_m = IF(sumB4_mch is not null, sumB4_mch, be.B4_m),
        be.B4_t = IF(sumB4_tch is not null, sumB4_tch, be.B4_t),

        be.A5 = IF(sumA5ch is not null, sumA5ch, be.A5),
        be.B1 = IF(sumB1ch is not null, sumB1ch, be.B1),
        be.B2 = IF(sumB2ch is not null, sumB2ch, be.B2),
        be.B3 = IF(sumB3ch is not null, sumB3ch, be.B3),
        be.B5 = IF(sumB5ch is not null, sumB5ch, be.B5),
        be.C1 = IF(sumC1ch is not null, sumC1ch, be.C1),
        be.C2 = IF(sumC2ch is not null, sumC2ch, be.C2),
        be.C3 = IF(sumC3ch is not null, sumC3ch, be.C3),
        be.C4 = IF(sumC4ch is not null, sumC4ch, be.C4),
        be.D1 = IF(sumD1ch is not null, sumD1ch, be.D1),
        be.D2 = IF(sumD2ch is not null, sumD2ch, be.D2),
        be.D3 = IF(sumD3ch is not null, sumD3ch, be.D3),
        be.D4 = IF(sumD4ch is not null, sumD4ch, be.D4)

WHERE 	be.idbuilding_elements=ibuilding_element;

END//
DELIMITER ;