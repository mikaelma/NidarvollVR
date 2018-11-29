-- count the number of building element entries at each hierarchy for all buildings
-- use where clause to select view for a specific hierarchy or a specific building
SELECT 
    b.building_identifier,
    b.building_name,
    l.hierarchy,
    COUNT(l.hierarchy) AS nbrOfBldElmtsAtHierarchy
FROM
    buildingelements be
        JOIN
    levels l ON l.idlevels = be.idlevels
        JOIN
    buildings b ON b.idbuildings = be.idbuildings
-- WHERE l.hierarchy=2
-- WHERE b.building_identifier='R002'
GROUP BY
    b.building_identifier, l.hierarchy
ORDER BY b.building_identifier;


-- count number of elements grouped by level
SELECT 
    be.idlevels,
    l.hierarchy,
    COUNT(l.hierarchy) AS nbrOfBldElmtsAtHierarchy
FROM
    buildingelements be
        JOIN
    levels l ON l.idlevels = be.idlevels
        JOIN
    buildings b ON b.idbuildings = be.idbuildings
-- WHERE l.hierarchy=2
-- WHERE b.building_identifier='R002'
GROUP BY
    be.idlevels
;