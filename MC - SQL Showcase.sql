--- DIGITAL FUTURES
--- SQL Showcase

-----------------------------------------------------------------------------------------------------------
-------- CONTENTS
-----------------------------------------------------------------------------------------------------------

/*

MC-TABLE-01		Table Creation

MC-CHECK-01		No. of rows check
MC-CHECK-02		No. of distinct rows check
MC-CHECK-03		No. of columns check
MC-CHECK-04		Total no. of NULLS check
MC-CHECK-05		Individual column no. of NULLS check

MC-QUERY-01		No. of models for each brand, most to least
MC-QUERY-02		No. of phones with batteries larger than 3000mAh
MC-QUERY-03		List of Samsung phones with display size larger than 5 inches
MC-QUERY-04		No. of phones with display refresh rate more than or equal to 60Hz and battery less than 4000mAh
MC-QUERY-05		Types of processors and no. of phones using it (models without processor spec - NULL)
MC-QUERY-06		Average display size of Apple phones
MC-QUERY-07		List of Windows OS phones with less than 1MB memory
MC-QUERY-08		No. of phones with primary storage not more than 64GB and no external storage grouped by brands
MC-QUERY-09		No. of phones using Qualcomm processor and Android OS with primary cameras having 8MP or more	
MC-QUERY-10		List. of Blackberry phones with screen resolution 480p or more

*/
-----------------------------------------------------------------------------------------------------------
-- Table Creation --
-----------------------------------------------------------------------------------------------------------
-- MC-TABLE-01 --
-- Table Creation for mc_smartphone_specs --
CREATE TABLE student.mc_smartphone_specs
	(
	phone_spec_id INT PRIMARY KEY,
	brand VARCHAR(15),
	model VARCHAR(40),
	os VARCHAR(45),
	battery INT,
	processor VARCHAR(35),
	memory DECIMAL(10,2),
	primary_storage INT,
	external_storage VARCHAR(25),
	display_size DECIMAL(10,2),
	display_resolution VARCHAR(15),
	display_refresh_rate INT,
	primary_camera INT,
	front_camera DECIMAL(10,2)
	);


-----------------------------------------------------------------------------------------------------------
-- QC Checks --
-----------------------------------------------------------------------------------------------------------
-- MC-CHECK-01 --
-- No. of rows check --
-- Source file no. of rows = 4529 --
SELECT
	count(*) AS no_of_rows
FROM
	student.mc_smartphone_specs;
	



-- MC-CHECK-02 --
-- No. of distinct rows check --
-- Source file no. of rows = 4529 --
SELECT
	count(DISTINCT phone_spec_id) AS no_of_distinct_rows
FROM
	student.mc_smartphone_specs;
	



-- MC-CHECK-03 --
-- No. of columns check --
-- Source file no. of columns = 14 --
SELECT 
	count(*) AS no_of_columns
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'mc_smartphone_specs';




-- MC-CHECK-04 --
-- Total no. of NULLS check --
-- Source file no. of columns = 9041 --
SELECT
	count (CASE WHEN phone_spec_id IS NULL THEN 1 END) +
	count (CASE WHEN brand IS NULL THEN 1 END) +
	count (CASE WHEN model IS NULL THEN 1 END) +
	count (CASE WHEN os IS NULL THEN 1 END) +
	count (CASE WHEN battery IS NULL THEN 1 END) +
	count (CASE WHEN processor IS NULL THEN 1 END) +
	count (CASE WHEN memory IS NULL THEN 1 END) +
	count (CASE WHEN primary_storage IS NULL THEN 1 END) +
	count (CASE WHEN external_storage IS NULL THEN 1 END) +
	count (CASE WHEN display_size IS NULL THEN 1 END) +
	count (CASE WHEN display_resolution IS NULL THEN 1 END) +
	count (CASE WHEN display_refresh_rate IS NULL THEN 1 END) +
	count (CASE WHEN primary_camera IS NULL THEN 1 END) +
	count (CASE WHEN front_camera IS NULL THEN 1 END) AS total_no_of_nulls
FROM
	student.mc_smartphone_specs;
	



-- MC-CHECK-05 --
-- Individual column no. of NULLS check --
-- Source file no. of columns = 0,0,0,18,169,1429,472,717,367,233,82,4221,99,1234 --
SELECT
	count (CASE WHEN phone_spec_id IS NULL THEN 1 END) AS no_of_nulls,
	count (CASE WHEN brand IS NULL THEN 1 END) AS no_of_nulls,
	count (CASE WHEN model IS NULL THEN 1 END) AS no_of_nulls,
	count (CASE WHEN os IS NULL THEN 1 END) AS no_of_nulls,
	count (CASE WHEN battery IS NULL THEN 1 END) AS no_of_nulls,
	count (CASE WHEN processor IS NULL THEN 1 END) AS no_of_nulls,
	count (CASE WHEN memory IS NULL THEN 1 END) AS no_of_nulls,
	count (CASE WHEN primary_storage IS NULL THEN 1 END) AS no_of_nulls,
	count (CASE WHEN external_storage IS NULL THEN 1 END) AS no_of_nulls,
	count (CASE WHEN display_size IS NULL THEN 1 END) AS no_of_nulls,
	count (CASE WHEN display_resolution IS NULL THEN 1 END) AS no_of_nulls,
	count (CASE WHEN display_refresh_rate IS NULL THEN 1 END) AS no_of_nulls,
	count (CASE WHEN primary_camera IS NULL THEN 1 END) AS no_of_nulls,
	count (CASE WHEN front_camera IS NULL THEN 1 END) AS no_of_nulls
FROM
	student.mc_smartphone_specs;


-----------------------------------------------------------------------------------------------------------
-- SQL Queries --
-----------------------------------------------------------------------------------------------------------
-- MC-QUERY-01 --
-- No. of models for each brand, most to least --
SELECT
	brand,
	count(model) AS no_of_models
FROM
	student.mc_smartphone_specs
GROUP BY
	brand
ORDER BY 
	count(model) DESC;




-- MC-QUERY-02 --
-- No. of phones with batteries larger than 3000mAh --
SELECT
	count(model) AS no_of_phones
FROM
	student.mc_smartphone_specs
WHERE
	battery > 3000;




-- MC-QUERY-03 --		
-- List of Samsung phones with display size larger than 5 inches --
SELECT
	brand,
	model,
	display_size
FROM
	student.mc_smartphone_specs
WHERE
	lower(brand) = 'samsung' AND display_size > 5;
	



-- MC-QUERY-04 --
-- No. of phones with display refresh rate more than or equal to 60Hz and battery less than 4000mAh --
SELECT
	count(model) AS no_of_phones
FROM
	student.mc_smartphone_specs
WHERE
	display_refresh_rate >= 60 AND battery < 4000;
	



-- MC-QUERY-05 --
-- Types of processors and no. of phones using it (models without processor spec - NULL) --
SELECT
	processor,
	count(model) AS no_of_phones
FROM
	student.mc_smartphone_specs
GROUP BY
	processor
ORDER BY
	count(model) DESC;




-- MC-QUERY-06 --
-- Average display size of Apple phones --
SELECT
	brand,
	avg(display_size)::decimal(10,2)
FROM
	student.mc_smartphone_specs
WHERE
	lower(brand) = 'apple'
GROUP BY
	brand;




-- MC-QUERY-07 --
-- List of Windows OS phones with less than 1MB memory --
SELECT
	brand,
	model,
	os,
	memory
FROM
	student.mc_smartphone_specs
WHERE
	lower(os) LIKE '%windows%' AND memory < 1
ORDER BY
	memory DESC;
	



-- MC-QUERY-08 --
-- No. of phones with primary storage not more than 64GB and no external storage grouped by brands --
SELECT
	brand,
	count(model) AS no_of_phones,
	primary_storage,
	external_storage
FROM
	student.mc_smartphone_specs
WHERE
	primary_storage <= 64 AND lower(external_storage) LIKE ('%not%')
GROUP BY
	primary_storage,
	external_storage,
	brand
ORDER BY
	count(model) DESC;




-- MC-QUERY-09 --
-- No. of phones using Qualcomm processor and Android OS with primary cameras having 8MP or more--
SELECT
	processor,
	os,
	primary_camera,
	count(model) AS no_of_phones
FROM
	student.mc_smartphone_specs
WHERE
	lower(processor) LIKE '%qualcomm%' AND lower(os) LIKE '%android%'
GROUP BY
	processor,
	os,
	primary_camera
HAVING
	primary_camera >= 8;




-- MC-QUERY-10 --
-- List. of Blackberry phones with screen resolution 480p or more --
SELECT
	brand,
	model,
	display_resolution
FROM
	student.mc_smartphone_specs
WHERE
	lower(os) LIKE '%blackberry%' AND RIGHT(lower(display_resolution),4)::INT >= 480;
	
