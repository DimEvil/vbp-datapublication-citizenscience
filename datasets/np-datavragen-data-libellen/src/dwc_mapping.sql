SELECT o.id  as occurrenceID
	, o.date as eventDate
	, o.time
	, s.name as vernacularName
	, s.scientific_name as scientificName
	, CASE 
        	WHEN st.name = 'Hybride' THEN 'hybrid'
			WHEN st.name = 'Ondersoort' THEN 'subspecies'
			WHEN st.name = 'Synoniem' THEN 'species'
			WHEN st.name = 'Soort' THEN 'species'
			WHEN st.name = 'Variëteit' THEN 'varietas'
			WHEN st.name = 'Verzamelsoort' THEN 'informal group'
			WHEN st.name = 'forma' THEN 'forma'
					ELSE 'Check needed'
					END as taxonRank
	, sg.name as species_group
	,CASE  
    WHEN sg.name = 'Algen, wieren en eencelligen' THEN 'Protista'
    WHEN sg.name = 'Bijen, wespen en mieren' THEN 'Animalia'
    WHEN sg.name = 'Dagvlinders' THEN 'Animalia'
    WHEN sg.name = 'Geleedpotigen (overig)' THEN 'Animalia'
    WHEN sg.name = 'Insecten (overig)' THEN 'Animalia'
    WHEN sg.name = 'Kevers' THEN 'Animalia'
    WHEN sg.name = 'Libellen' THEN 'Animalia'
    WHEN sg.name = 'Mossen en korstmossen' THEN 'Plantae'
    WHEN sg.name = 'Nachtvlinders en micro%' THEN 'Animalia'
    WHEN sg.name = 'Overige ongewervelden' THEN 'Animalia'
    WHEN sg.name = 'Paddenstoelen' THEN 'Fungi'
    WHEN sg.name = 'Planten' THEN 'Plantae'
    WHEN sg.name = 'Reptielen en amfibieën' THEN 'Animalia'
    WHEN sg.name = 'Sprinkhanen en krekels' THEN 'Animalia'
    WHEN sg.name = 'Verstoringen' THEN 'Unknown'
    WHEN sg.name = 'Vissen' THEN 'Animalia'
    WHEN sg.name = 'Vliegen en muggen' THEN 'Animalia'
    WHEN sg.name = 'Vogels' THEN 'Animalia'
    WHEN sg.name = 'Wantsen en cicaden' THEN 'Animalia'
    WHEN sg.name = 'Weekdieren' THEN 'Animalia'
    WHEN sg.name = 'Zoogdieren' THEN 'Animalia'
    ELSE 'Unknown'
END AS kingdom

	, o.number as individualCount
	, o.sex as sex
	, ls.name as lifeStage
	--, a.name as behaviour
	/**Behaviour**/
	,CASE  
    WHEN a.name = '(kleur)ringdragend' THEN 'color-ringed'
    WHEN a.name = '(nabij) nest / burcht' THEN 'near nest / burrow'
    WHEN a.name = 'aangeplant' THEN 'planted'
    WHEN a.name = 'aangespoeld' THEN 'washed ashore'
    WHEN a.name = 'aangevoerd' THEN 'introduced'
    WHEN a.name = 'adult in broedbiotoop' THEN 'adult in breeding habitat'
    WHEN a.name = 'alarmerend' THEN 'alarming'
    WHEN a.name = 'baltsend / zingend' THEN 'displaying / singing'
    WHEN a.name = 'baltsend paar (ook paring)' THEN 'displaying pair (including mating)'
    WHEN a.name = 'bezet nest' THEN 'occupied nest'
    WHEN a.name = 'bezet nest met eieren' THEN 'occupied nest with eggs'
    WHEN a.name = 'bezet nest met jongen' THEN 'occupied nest with young'
    WHEN a.name = 'dood' THEN 'dead'
    WHEN a.name = 'eileggend' THEN 'egg-laying'
    WHEN a.name = 'foeragerend' THEN 'foraging'
    WHEN a.name = 'geparasiteerd' THEN 'parasitized'
    WHEN a.name = 'in copula' THEN 'in copulation'
    WHEN a.name = 'in kolonie anders' THEN 'in colony (other)'
    WHEN a.name = 'in kolonie in bomen' THEN 'in colony in trees'
    WHEN a.name = 'in kolonie op gebouw' THEN 'in colony on building'
    WHEN a.name = 'ingezaaid' THEN 'sown'
    WHEN a.name = 'jagend' THEN 'hunting'
    WHEN a.name = 'langstrekkend noord' THEN 'migrating north'
    WHEN a.name = 'langstrekkend zuid' THEN 'migrating south'
    WHEN a.name = 'levend dier' THEN 'live animal'
    WHEN a.name = 'natuurlijk' THEN 'natural'
    WHEN a.name = 'nest' THEN 'nest'
    WHEN a.name = 'nestbouw' THEN 'nest building'
    WHEN a.name = 'nestindicerend gedrag' THEN 'nest-indicating behavior'
    WHEN a.name = 'onbekend' THEN 'unknown'
    WHEN a.name = 'op licht' THEN 'on light'
    WHEN a.name = 'op windmolen' THEN 'on wind turbine'
    WHEN a.name = 'opvliegend' THEN 'taking off'
    WHEN a.name = 'overvliegend' THEN 'flying over'
    WHEN a.name = 'overvliegend noord' THEN 'flying over north'
    WHEN a.name = 'overvliegend noordoost' THEN 'flying over northeast'
    WHEN a.name = 'overvliegend noordwest' THEN 'flying over northwest'
    WHEN a.name = 'overvliegend oost' THEN 'flying over east'
    WHEN a.name = 'overvliegend west' THEN 'flying over west'
    WHEN a.name = 'overvliegend zuid' THEN 'flying over south'
    WHEN a.name = 'overvliegend zuidoost' THEN 'flying over southeast'
    WHEN a.name = 'overvliegend zuidwest' THEN 'flying over southwest'
    WHEN a.name = 'overwinterend' THEN 'wintering'
    WHEN a.name = 'paaiend' THEN 'spawning'
    WHEN a.name = 'paar in broedbiotoop' THEN 'pair in breeding habitat'
    WHEN a.name = 'pas uitgevlogen/dons jongen' THEN 'recently fledged/downy young'
    WHEN a.name = 'pleisterend' THEN 'roosting'
    WHEN a.name = 'prooi (dood)' THEN 'prey (dead)'
    WHEN a.name = 'recent gebruikt nest' THEN 'recently used nest'
    WHEN a.name = 'roepend' THEN 'calling'
    WHEN a.name = 'rustend' THEN 'resting'
    WHEN a.name = 'slaapplaats' THEN 'roosting site'
    WHEN a.name = 'slachtoffer raambotsing' THEN 'collision victim'
    WHEN a.name = 'slachtoffer verdrinking' THEN 'drowning victim'
    WHEN a.name = 'slachtoffer verkeer' THEN 'traffic victim'
    WHEN a.name = 'spinselnest' THEN 'web nest'
    WHEN a.name = 'tandem' THEN 'tandem'
    WHEN a.name = 'ter plaatse' THEN 'on site'
    WHEN a.name = 'territoriaal' THEN 'territorial'
    WHEN a.name = 'transport voedsel of ontlasting' THEN 'transporting food or feces'
    WHEN a.name = 'vangst door kat' THEN 'caught by cat'
    WHEN a.name = 'vastgesteld territorium' THEN 'confirmed territory'
    WHEN a.name = 'vernietigd nest' THEN 'destroyed nest'
    WHEN a.name = 'verplaatsend richting noord' THEN 'moving north'
    WHEN a.name = 'verplaatsend richting oost' THEN 'moving east'
    WHEN a.name = 'verplaatsend richting west' THEN 'moving west'
    WHEN a.name = 'verplaatst van locatie' THEN 'relocated'
    WHEN a.name = 'vervellend' THEN 'molting'
    WHEN a.name = 'verwilderd' THEN 'feral'
    WHEN a.name = 'vliegend' THEN 'flying'
    WHEN a.name = 'vluchtend' THEN 'fleeing'
    WHEN a.name = 'vondst (dood)' THEN 'found (dead)'
    WHEN a.name = 'waarschijnlijke nestplaats' THEN 'probable nesting site'
    WHEN a.name = 'winterslaap' THEN 'hibernating'
    WHEN a.name = 'ziek/gewond' THEN 'sick/injured'
    WHEN a.name = 'zogend' THEN 'nursing'
    WHEN a.name = 'zonnend' THEN 'basking'
    WHEN a.name = 'zwemmend' THEN 'swimming'
    ELSE a.name
	END as behaviour
	
	,CASE  
    WHEN om.name = '(e)dna barcoding' THEN 'eDNA barcoding'
    WHEN om.name = 'Led emmer' THEN 'LED bucket'
    WHEN om.name = 'Nest(kast)' THEN 'Nest (box)'
    WHEN om.name = 'andere sporen' THEN 'other traces'
    WHEN om.name = 'andere val' THEN 'other trap'
    WHEN om.name = 'batdetector' THEN 'bat detector'
    WHEN om.name = 'binnenshuis' THEN 'indoors'
    WHEN om.name = 'bodemstaal' THEN 'soil sample'
    WHEN om.name = 'bodemval' THEN 'soil trap'
    WHEN om.name = 'dood exemplaar in collectie' THEN 'dead specimen in collection'
    WHEN om.name = 'fossiel' THEN 'fossil'
    WHEN om.name = 'fuik' THEN 'fish trap'
    WHEN om.name = 'gehoord' THEN 'heard'
    WHEN om.name = 'genitaal onderzocht' THEN 'genital examination'
    WHEN om.name = 'gevangen' THEN 'captured'
    WHEN om.name = 'gezien' THEN 'seen'
    WHEN om.name = 'gezien en gehoord' THEN 'seen and heard'
    WHEN om.name = 'handvangst' THEN 'hand capture'
    WHEN om.name = 'handvangst en in collectie' THEN 'hand capture and in collection'
    WHEN om.name = 'handvangst en losgelaten' THEN 'hand capture and released'
    WHEN om.name = 'in braakbal' THEN 'in pellet'
    WHEN om.name = 'in herbarium' THEN 'in herbarium'
    WHEN om.name = 'in val' THEN 'in trap'
    WHEN om.name = 'kleurval' THEN 'color trap'
    WHEN om.name = 'klopnet' THEN 'beating net'
    WHEN om.name = 'klopscherm' THEN 'beating sheet'
    WHEN om.name = 'lichtval' THEN 'light trap'
    WHEN om.name = 'malaiseval' THEN 'malaise trap'
    WHEN om.name = 'met fotoval' THEN 'camera trap'
    WHEN om.name = 'micr. onderzocht, materiaal aanw.' THEN 'microscopically examined, material present'
    WHEN om.name = 'microscopisch onderzocht' THEN 'microscopically examined'
    WHEN om.name = 'onbekend' THEN 'unknown'
    WHEN om.name = 'op feromonen' THEN 'on pheromones'
    WHEN om.name = 'op geluidsrecorder' THEN 'on sound recorder'
    WHEN om.name = 'op laken' THEN 'on sheet'
    WHEN om.name = 'op smeer' THEN 'on bait'
    WHEN om.name = 'op voederplaats' THEN 'at feeding site'
    WHEN om.name = 'opgekweekt' THEN 'reared'
    WHEN om.name = 'prenten' THEN 'tracks'
    WHEN om.name = 'reptielenplaat' THEN 'reptile sheet'
    WHEN om.name = 'schepnet' THEN 'dip net'
    WHEN om.name = 'sleepnet' THEN 'drag net'
    WHEN om.name = 'sporen' THEN 'traces'
    WHEN om.name = 'translocatie' THEN 'translocation'
    WHEN om.name = 'uitgekweekt en losgelaten' THEN 'reared and released'
    WHEN om.name = 'uitwerpselen' THEN 'feces'
    WHEN om.name = 'vangst (electrisch)' THEN 'capture (electric fishing)'
    WHEN om.name = 'vangst (fuik)' THEN 'capture (fish trap)'
    WHEN om.name = 'vangst (hengel)' THEN 'capture (fishing rod)'
    WHEN om.name = 'veldwaarneming' THEN 'field observation'
    WHEN om.name = 'verlaten nest' THEN 'abandoned nest'
    WHEN om.name = 'verwijderd' THEN 'removed'
    WHEN om.name = 'verzameld (in collectie)' THEN 'collected (in collection)'
    WHEN om.name = 'vraatsporen' THEN 'feeding traces'
    WHEN om.name = 'warmtekijker' THEN 'thermal camera'
    WHEN om.name = 'zichtwaarneming met zoeklicht' THEN 'visual observation with searchlight'
    WHEN om.name = 'zichtwaarneming zaklamp' THEN 'visual observation with flashlight'
    ELSE om.name 
END AS samplingProtocol
	, om.name as method
	, l.name as locality
	--, o.point
	--, rtrim(rtrim(rtrim(rtrim(substr(o.point, INSTR(o.point, '[') + 2, 38), '}')), ']'))
	, ROUND (substr(rtrim(rtrim(rtrim(rtrim(substr(o.point, INSTR(o.point, '[') + 2, 38), '}')), ']')), instr(rtrim(rtrim(rtrim(rtrim(substr(o.point, INSTR(o.point, '[') + 2, 38), '}')), ']')), ',' )+2, 50), 5 ) AS decimalLatitude
	, ROUND (substr( rtrim(rtrim(rtrim(rtrim(substr(o.point, INSTR(o.point, '[') + 2, 38), '}')), ']')), 0, length(rtrim(rtrim(rtrim(rtrim(substr(o.point, INSTR(o.point, '[') + 2, 38), '}')), ']'))) - (length(substr(rtrim(rtrim(rtrim(rtrim(substr(o.point, INSTR(o.point, '[') + 2, 38), '}')), ']')), instr(rtrim(rtrim(rtrim(rtrim(substr(o.point, INSTR(o.point, '[') + 2, 38), '}')), ']')), ',' )+3, 50))+2)), 5) AS decimalLongitude
	, o.notes
	, vs.name as identificationVerificationStatus
	, o.is_certain
	, o.is_escape
	, o.embargo_date
	, o.external_reference
	, 'https://waarnemingen.be/observation/' || o.id || '/' as [references]
	, u.name as recordedBy
	, u.name as indentifiedBy
	, cv.name as stateProvince
FROM observation o
INNER JOIN user u ON u.id = o.user
INNER JOIN species s ON s.id = o.species
LEFT JOIN species_group sg ON sg.id = s."group"
LEFT JOIN species_type st ON st.id = s.type
LEFT JOIN life_stage ls ON ls.id = o.life_stage
LEFT JOIN activity a ON a.id = o.activity
LEFT JOIN observation_method om ON om.id = o.method
LEFT JOIN observation_type ot ON ot.id = o.type
LEFT JOIN location l ON l.id = o.location
LEFT JOIN validation_status vs ON vs.id = o.validation_status
LEFT JOIN country_division cv ON cv.id = o.country_division
--WHERE u.name in ('Steven De Saeger','Robin Guelinckx','Remar Erens','Dirk Hennebel','Adinda De Bruyn','Indra Jacobs','M. Kumpen','Frank Van Oost','Dhaluin, Pieter')
--and sg.name in ('Planten', 'Mossen en korstmossen')
--WHERE st.name = 'Synoniem'
--WHERE sg.name = 'Verstoringen'
--WHERE u.name = 'Roosmarijn Steeman'
AND o.id is not '312316574'
-- 
-- 

