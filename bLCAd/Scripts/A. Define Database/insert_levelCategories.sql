/*
Inserts the categorical hierarchical building element levels into the 'levels' table.
Based on the Norwegian standard "Bygningsdelstabellen".
This structure determines how results data is organized.
*/
USE bLCAd;

INSERT INTO `levels` (`idlevels`,`name`,`hierarchy`,`idparent`) VALUES 
(0,'Whole building',0,NULL),
	(2,'Envelope, foundations, and structure',1,0),

		(21,'Groundwork and foundations',2,2),
			(211,'Preparation of land',3,21),
			(212,'Building ditch',3,21),
			(213,'Ground reinforcement',3,21),
			(214,'Supporting constructions',3,21),
			(215,'Pile foundations',3,21),
			(216,'Direct foundations',3,21),
			(217,'Drainage',3,21),
			(218,'Complementaries',3,21),
			(219,'Other parts of groundwork and foundations',3,21),
	
		(22,'Superstructure',2,2),
			(221,'Frames',3,22),
			(222,'Columns',3,22),
			(223,'Beams',3,22),

		(23,'Outer walls',2,2),
			(231,'Load-bearing outer wall',3,23),
			(232,'Non-bearing outer wall',3,23),
			(233,'Glass facades',3,23),
			(234,'Windows and doors',3,23),
			(235,'Outer cladding and surface',3,23),

		(24,'Inner walls',2,2),
			(241,'Load-bearing inner walls',3,24),
			(242,'Non-bearing inner walls',3,24),
			(243,'System walls, glass walls',3,24),
			(244,'Windows and doors',3,24),
			(246,'Cladding and surface',3,24),

		(25,'Slab structure',2,2),
			(251,'Load-bearing deck',3,25),
			(252,'Floor on ground',3,25),
			(254,'Floor system',3,25),
			(255,'Floor surface',3,25),
			(257,'Ceiling system',3,25),
            
		(26,'Outer roof',2,2),
			(261,'Primary construction',3,26),
			(262,'Roof covering',3,26),
			(263,'Glass roof, roof hatches',3,26),
			(268,'Equipment and complementaries',3,26),
			(269,'Other parts of outer roof',3,26),
            
		(27,'Fixed inventory',2,2),
		(28,'Stairs and balconies',2,2),
		(29,'Other parts main building',2,2),
	
	(3,'Heating, ventilation and sanitation',1,0),
		(31,'Sanitary',2,3),
		(32,'Heating',2,3),
		(33,'Fire safety',2,3),
		(36,'Ventilation and air conditioning',2,3),
		(39,'Other sevices: Appliances',2,3),
	
	(4,'Electric power',1,0),
		(41,'Basic installation for electric power',2,4),
		(43,'Low voltage power',2,4),
		(44,'Lighting',2,4),
		(49,'Other tech.: Photovoltaic',2,4),
	
	(5,'Telecommunications and automation',1,0),
	
	(6,'Other installations',1,0),
		(69,'Other technical installations',2,6),

	(7,'Outdoors',1,0);