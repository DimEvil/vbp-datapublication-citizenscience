SELECT * 
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
INNER JOIN alienplantsNP NP ON NP.scientificName = s.scientific_name

--WHERE scientificName = ''