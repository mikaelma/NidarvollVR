-- count the number of building material inventory entries at each building element for all buildings
-- use where clause to select view for a specific hierarchy or a specific building
SELECT 
    b.building_identifier,
    b.building_name,
    l.hierarchy,
    be.idlevels,
    COUNT(mi.idmaterialInventory) AS nbrOfInventoriesInBuildingElement
FROM
    buildingelements be
        JOIN
    levels l ON l.idlevels = be.idlevels
        JOIN
    buildings b ON b.idbuildings = be.idbuildings
        JOIN
    materialinventory mi ON mi.idbuilding_elements = be.idbuilding_elements
GROUP BY b.building_identifier , be.idlevels
ORDER BY b.building_identifier;