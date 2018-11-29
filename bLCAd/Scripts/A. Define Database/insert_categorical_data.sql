/* Insert values into the categorical tables.
This totals insertions into 7/8 categorical tables.
The last (level categories) are inserted in another script. */

USE bLCAd;

-- The tables in the buildings layer

INSERT INTO builtstatus (built_status) VALUES ("built"), ("planned"), ("concept"), ('na');

INSERT INTO typology (typology) VALUES ("residential"),("office"),("school"),('kindergarden'),('university'),('swimming hall');

INSERT INTO constructiontype (construction_type) VALUES ("timber"), ("concrete"), ("steel"), ('na');

INSERT INTO energyambitionlevel (energy_ambition_level) VALUES ("TEK10"), ("ZEB-O"), ("ZEB-OM"), ("ZEB-COM"), ('Passive House'),('na');

INSERT INTO location (country, city) VALUES 
('na', 'na'),
('Norway', 'na'), 
('Norway', 'Oslo'), 
('Norway', 'Trondheim'),
('Norway','Gardermoen'),
('Norway','Vennesla'),
('Norway','Fredrikstad'),
('Norway','Askim'),
('Norway','Gjoevik'),
('Norway', 'Porsgrunn'),
('Norway', 'Larvik'),
('Norway', 'Skien'),
('Norway', 'Hokksund'),
('Norway', 'Drammen'),
('Norway', 'Moelv'),
('Norway', 'Brevik'),
('Norway', 'Flesberg'),
('Norway', 'Hurdal'),

('Finland', 'na'),
('Germany', 'na'),
('Germany', 'Niestetal'),
('Germany', 'Essen'),
('Germany', 'Ulm'),
('Germany', 'Cologne'),
('Germany', 'Heiligengrabe'),
('Belgium', 'Brussels'),
('United Kingdom', 'Sheffield'),
('Spain','Laudio'),
('Poland', 'Wolsztyn'),
('Turkey','Can'),
('Sweden', 'Nybro'),
('Poland', 'na'),
('Czech Republic', 'Holesov'),
('Singapore','Tuas'),

('Europe','Central'),
('Europe','na'),
('Global', 'na');
-- The materials layer
INSERT INTO materialcat (materialcat) VALUES 
	# Raw materials
	("concrete"), ('cement'), ("timber"),("steel"),("iron"),('copper'),('stone'),('zink'),('rock'),('asphalt'),("plastics"),('granite'),('linoleum'),('aluminium'),('ceramic'),('glass'), ('argon'), ('bitumen'), ('plaster'), ('brick'), ('paint'),('gypsum'),('vinyl'),('rubber'),('textile'),('paraffin'),
	# Building part type
	("windows"),("doors"),("electronics"),("insulation"),("photovoltaics"),('vapour/wind barrier'), ('roofing felt'), ('flooring'),('carpet'), ('technical installations'), ('PV panel'), ('ST panel'), ('heat pump'),('hot water tank'),
    ('tbd');

-- The LCA inventory layer
INSERT INTO GWP_transport (mode, name, GWPper_tkm) VALUES
('sea','Transport, transoceanic freight ship',0.0115),
('road','Transport, lorry 16-32t, EURO3',0.17),
('road','Transport, lorry 16-32t, EURO5',0.17),
('rail','Transport, freight, rail',0.0394),

('sea','AV: Skip',0.01072),
('road','AV: Lastebil',0.04860),
('road','AV: Betongbil',0.07594);

