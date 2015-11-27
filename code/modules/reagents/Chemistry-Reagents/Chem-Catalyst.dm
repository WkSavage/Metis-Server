
//THIS ARE SPECIAL CHEMICALS THAT WILL CAUSE REACTIONS THAT WILL BE NEEDED FOR HIGH LVL MEDS

//PRETTY FUN HUH?//
#define REMCHEM 0.35

/datum/reagent/react_a
	name = "Catalytic Reagent H2C10P1"
	id = "react_a"
	description = "This is a useful building block in organic chemistry."
	reagent_state = LIQUID
	color = "#525050"

/datum/chemical_reaction/react_a
	name = "Catalytic Reagent H2C10P1"
	id = "react_a"
	result = "react_a"
	required_reagents = list("hydrogen" = 1, "carbon" = 1, "phoron" = 1)
	result_amount = 3

/datum/reagent/react_b
	name = "Catalytic Reagent C7o5P1"
	id = "react_b"
	description = "This is a useful building block in organic chemistry."
	reagent_state = LIQUID
	color = "#525050"

/datum/chemical_reaction/react_b
	name = "Catalytic Reagent C7o5P1"
	id = "react_b"
	result = "react_b"
	required_reagents = list("carbon" = 1, "oxygen" = 1, "phoron" = 1)
	result_amount = 3


/datum/reagent/react_c
	name = "Catalytic Reagent N1H2P1"
	id = "react_c"
	description = "This is a useful building block in organic chemistry."
	reagent_state = LIQUID
	color = "#525050"

/datum/chemical_reaction/react_c
	name = "Catalytic Reagent N1H2P1"
	id = "react_c"
	result = "react_c"
	required_reagents = list("nitrogen" = 1, "hydrogen" = 1, "phoron" = 1)
	result_amount = 3