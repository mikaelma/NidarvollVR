-- count # material inventory entries for each country that have a location in MI
-- as well as # distinct cities
select b.building_identifier, loc.country, count(loc.city) as nbrOfMIentries, count(distinct loc.city) as nrbOfDistinctCities
from location loc
join materialinventory mi on mi.idlocationproduction=loc.idlocation
join buildingelements be on mi.idbuilding_elements=be.idbuilding_elements
join buildings b on b.idbuildings=be.idbuildings
where building_identifier='R002'
group by country;

-- count # distinct countries
select b.building_identifier, count(distinct loc.country) as nrbOfDistinctCountries
from location loc
join materialinventory mi on mi.idlocationproduction=loc.idlocation
join buildingelements be on mi.idbuilding_elements=be.idbuilding_elements
join buildings b on b.idbuildings=be.idbuildings
where building_identifier='R002';