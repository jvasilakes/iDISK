// Cypher query to create the iDISK schema as a Neo4j graph


// ===== CONCEPTS and ATTRIBUTES =====

// Dietary supplement ingredient
CREATE (i:SDSI {preferred_name: "Preferred Name",
		synonym: "Synonym",
		scientific_name: "Scientific Name",
		source_material: "Source Material",
		umls_semantic_type: "UMLS Semantic Type",
		ingredient_category: "Ingredient Category",
		background: "Background",
		safety: "Safety",
		mechanism_of_action: "Mechanism of Action",
		links_to: "umls.quickumls.sdsi"})

// Dietary supplement product
CREATE (p:DSP {preferred_name: "Preferred Name",
	       langual_type: "LanguaL Product Type"})

// Pharmacological drug
CREATE (r:PD {preferred_name: "Preferred Name",
	      umls_semantic_type: "UMLS Semantic Type",
	      links_to: "umls.quickumls.pd"})

// Disease
CREATE (d:DIS {preferred_name: "Preferred Name",
	       umls_semantic_type: "UMLS Semantic Type",
	       links_to: "umls.quickumls.dis"})

// Therapeutic class
CREATE (t:TC {preferred_name: "Preferred Name",
	      umls_semantic_type: "UMLS Semantic Type",
	      links_to: "umls.quickumls.tc"})

// System organ class
CREATE (c:SOC {preferred_name: "Preferred Name",
	       umls_semantic_type: "UMLS Semantic Type",
	       links_to: "meddra.rulebased"})

// Signs / Symptoms
CREATE (s:SS {preferred_name: "Preferred Name",
	      umls_semantic_type: "UMLS Semantic Type",
	      links_to: "umls.quickumls.ss"})


// ===== RELATIONSHIPS =====

// Ingredient of
CREATE (p) -[:HAS_INGREDIENT]-> (i)

// Interacts with
CREATE (i) -[:INTERACTS_WITH {rating: "Rating", severity: "Severity"}]-> (r)

// Effects
CREATE (i) -[:IS_EFFECTIVE_FOR {rating: "Rating"}]-> (d)

// Has therapeutic class
CREATE (i) -[:HAS_THERAPEUTIC_CLASS]-> (t)

// Adverse effect on
CREATE (i) -[:HAS_ADVERSE_EFFECT_ON]-> (c)

// Has adverse reaction
CREATE (i) -[:HAS_ADVERSE_REACTION]-> (s)
