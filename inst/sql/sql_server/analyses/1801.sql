-- 1801	Number of measurement occurrence records, by measurement_concept_id

--HINT DISTRIBUTE_ON_KEY(stratum_1)
select 1801 as analysis_id, 
	CAST(m.measurement_concept_id AS VARCHAR(255)) as stratum_1,
	cast(null as varchar(255))  as stratum_2,
	cast(null as varchar(255)) as stratum_3,
	cast(null as varchar(255)) as stratum_4,
	cast(null as varchar(255)) as stratum_5,
	floor((count_big(m.PERSON_ID)+99)/100)*100 as count_value
into @scratchDatabaseSchema@schemaDelim@tempAchillesPrefix_1801
from
	@cdmDatabaseSchema.measurement m
group by m.measurement_CONCEPT_ID
;
