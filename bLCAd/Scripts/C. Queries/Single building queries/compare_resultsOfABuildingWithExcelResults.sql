SELECT 
    b.building_identifier,
    b.building_name,
    l.hierarchy,
    be.idlevels,
    be.idbuilding_elements,
    be.A1A3 / (74121.16 - 2244.92),
    be.A4 / (6188.58 - 62.27),
    be.A5,
    be.B4_m,
    be.B4_t,
    (be.B4_m + be.B4_t) / (56066.50 - 9220.85),
    (be.A1A3 + be.A4 + (be.B4_m + be.B4_t)) / ((74121.16 + 6188.58 + 56066.50) - (2244.92 + 62.27 + 9220.85)) AS wholeBuildingFraction
FROM
    buildingelements be
        JOIN
    levels l ON l.idlevels = be.idlevels
        JOIN
    buildings b ON be.idbuildings = b.idbuildings
WHERE
    b.building_identifier = 'R001'
        AND l.hierarchy = 0;
