-- 405	Number of condition occurrence records, by condition_concept_id by condition_type_concept_id

--HINT DISTRIBUTE_ON_KEY(stratum_1)
select 405 as analysis_id, 
	CAST(co1.condition_CONCEPT_ID AS VARCHAR(255)) as stratum_1,
	CAST(co1.condition_type_concept_id AS VARCHAR(255)) as stratum_2,
	cast(null as varchar(255)) as stratum_3,
	cast(null as varchar(255)) as stratum_4, cast(null as varchar(255)) as stratum_5,
	floor((count_big(co1.PERSON_ID)+99)/100)*100 as count_value
into @scratchDatabaseSchema@schemaDelim@tempAchillesPrefix_405
from
	@cdmDatabaseSchema.condition_occurrence co1
group by co1.condition_CONCEPT_ID,	
	co1.condition_type_concept_id
;
