/* 
Check if result exist at a certain level for each building.
Return table. One row for every building, with columns for every building element in the database with yes/no values.

*/
SELECT b.building_identifier, 
	be0.idbuilding_elements as be0,
	be1.idbuilding_elements as be1,
	be2.idbuilding_elements as be2,
	be3.idbuilding_elements as be3
FROM buildings b
	
    LEFT JOIN buildingelements be0 on b.idbuildings=be0.idbuildings
    LEFT JOIN levels l0 on be0.idlevels=l0.idlevels
    
    LEFT OUTER JOIN buildingelements be1 on b.idbuildings=be1.idbuildings 
    LEFT OUTER JOIN levels l1 on be0.idlevels=l1.idlevels
      
    LEFT OUTER JOIN buildingelements be2 on b.idbuildings=be2.idbuildings 
	LEFT OUTER JOIN levels l2 on be0.idlevels=l2.idlevels
	
    LEFT OUTER JOIN buildingelements be3 on b.idbuildings=be3.idbuildings 
    LEFT OUTER JOIN levels l3 on be3.idlevels=l3.idlevels 
    
    WHERE l0.hierarchy=0
    AND l0.idlevels=l1.idparent
    #AND l1.idlevels=l2.idparent
    #AND l3.idlevels=l3.idparent;
    #and l1.hierarchy=1
    #and l2.hierarchy=2
    #and l3.hierarchy=3;
    