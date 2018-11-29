SELECT * 
FROM materialinventory mi
JOIN materials m ON mi.idmaterials=m.idmaterials
JOIN buildingelements be ON be.idbuilding_elements=mi.idbuilding_elements
JOIN materialcat mc ON m.idmaterialCat=mc.idmaterialCat
JOIN levels l ON l.idlevels=be.idlevels
JOIN buildings b ON b.idbuildings=be.idbuildings;

-- show all material inventory entries in the whole database, or restrict to more specific
/* 
	Here are some restrictions:
	-- General:
		where b.building_identifier='R003';
		where l.idparent=2;
		where be.idlevels=21;
        where mc.materialCat='timber';
    
    -- Show all inventories for a building element and all its children and grandchildren for a chosen building
			where b.building_identifier='R001'
			and (l.idlevels=2
				or l.idparent=2
				or l.idparent in (21,22,23,24,25,26,27,28,29));
 */
SELECT b.building_identifier, b.building_name, be.idlevels, l.name, mc.materialCat, m.name ,m.EEf_A1A3 as EmissionFactor, mi.quantity, m.FU, quantity*density as quantityKG, mi.A1A3, mi.A4, mi.A5, mi.B4_m, mi.B4_t
FROM materialinventory mi
JOIN materials m ON mi.idmaterials=m.idmaterials
JOIN buildingelements be ON be.idbuilding_elements=mi.idbuilding_elements
JOIN materialcat mc ON m.idmaterialCat=mc.idmaterialCat
JOIN levels l ON l.idlevels=be.idlevels
JOIN buildings b ON b.idbuildings=be.idbuildings

;

