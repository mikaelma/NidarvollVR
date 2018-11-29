-- shows some statistics about data used in the calculations and groups by building
-- can be changed to view stats by building element by just changing the grouping to group by be.idlevels (and displaying the levels as well)
-- or group by both of the above
-- NB: only buildings that have material inventories will show up here
SELECT 
    b.building_identifier,
    b.building_name,
    COUNT(b.building_identifier) AS numberOfInventoryEntries,
    COUNT(DISTINCT m.name) AS numberOfDistinctMaterials,
    COUNT(b.building_identifier) / COUNT(DISTINCT m.name) AS materialUsedAvgNbrOfTimes,
    SUM(mi.quantity*m.density)/1000 as Mass_tonn,
    AVG(m.dataYear),
    MIN(m.dataYear),
    MAX(m.dataYear),
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
GROUP BY
     b.building_identifier;
    -- l.idlevels;
    -- b.building_identifier, l.idlevels;