# SOME TESTING GOING ON HERE
#-----------------------------

/*gonna try and select the child*/
select
	b.building_identifier,
	l1.idlevels, l1.name, be1.A1A3 as a1a3lvl1, 
	l2.idlevels, l2.name, be2.A1A3 as a1a3lvl2,
	l3.idlevels,l3.name, be3.A1A3 as a1a3lvl3
from levels l2
left join levels l1 on l2.idparent=l1.idlevels
left join levels l3 on l2.idlevels=l3.idparent
left join buildingelements be1 on be1.idlevels=l1.idlevels
left join buildingelements be2 on be2.idlevels=l2.idlevels
left join buildingelements be3 on be3.idlevels=l3.idlevels
left join buildings b on be1.idbuildings = b.idbuildings
	where b.building_identifier='R002'
	and l1.hierarchy=1;