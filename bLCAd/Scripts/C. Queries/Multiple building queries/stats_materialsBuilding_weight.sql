-- shows weight statistics and groups by building
-- choose manually which building elements to include

-- NB: only buildings that have material inventories will show up here
-- NB2: Only inventories with unit kg or that can be converted to kg (have density) will be included in these statistics
SELECT 
    -- general
    b.building_identifier,
    b.building_name,
    COUNT(b.building_identifier) AS numberOfInventoryEntries,
    COUNT(b.building_identifier) - COUNT(m.density) AS numberOfEntriesExcludedFromWeight,
    COUNT(DISTINCT m.name) AS numberOfDistinctMaterials,
    COUNT(b.building_identifier) / COUNT(DISTINCT m.name) AS materialUsedAvgNbrOfTimes,
    b.storiesAB,
    b.storiesBG,
    
    -- weight 
    ROUND(SUM(mi.quantity*m.density)/1000) as Mass_tonn,
    ROUND(SUM(mi.quantity*m.density)/b.floor_area) as Mass_kg_pm2,
   
   -- factors
    AVG(RSL_mi),
    AVG(EEf_A1A3/density)
FROM
    materialinventory mi
        JOIN
    materials m ON mi.idmaterials = m.idmaterials
        JOIN
    buildingelements be ON be.idbuilding_elements = mi.idbuilding_elements
        JOIN
    materialcat mc ON m.idmaterialCat = mc.idmaterialCat
        JOIN
    levels l ON l.idlevels = be.idlevels
        JOIN
    buildings b ON b.idbuildings = be.idbuildings
-- WHERE l.idlevels not in (21,211,212,213,214,215,216,217,218,219) -- "above" ground only
-- WHERE l.idlevels in (21,211,212,213,214,215,216,217,218,219) -- "below" ground only

GROUP BY
     b.building_identifier;
    -- l.idlevels;
    -- b.building_identifier, l.idlevels;