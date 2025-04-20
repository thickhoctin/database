SELECT *
FROM parts
LIMIT 10;

ALTER TABLE parts
ALTER COLUMN code SET NOT NULL;

ALTER TABLE parts
ADD UNIQUE (code);

UPDATE parts
SET description = 'None Available'
WHERE description IS NULL;

CREATE TABLE part_descriptions (
    id int PRIMARY KEY, 
    description text
);
INSERT INTO part_descriptions VALUES (1, '5V resistor'), (2, '3V resistor');

UPDATE parts
SET description = part_descriptions.description
from part_descriptions
where part_descriptions.id = parts.id
and parts.description IS NULL;

ALTER TABLE parts
ALTER COLUMN description SET NOT NULL;

ALTER TABLE reorder_options
ALTER COLUMN price_usd SET NOT NULL;

ALTER TABLE reorder_options
ALTER COLUMN quantity SET NOT NULL;

ALTER TABLE reorder_options
ADD CHECK (price_usd > 0 AND quantity > 0);

ALTER TABLE reorder_options
ADD CHECK (price_usd/quantity > 0.02 AND price_usd/quantity < 25);

ALTER TABLE parts
ADD PRIMARY KEY (id);

ALTER TABLE reorder_options
ADD FOREIGN KEY (part_id) REFERENCES parts (id);

ALTER TABLE locations 
ADD CHECK (qty > 0); 

ALTER TABLE locations
ADD UNIQUE (part_id , location);

ALTER TABLE locations
ADD FOREIGN KEY (part_id) REFERENCES parts (id);














