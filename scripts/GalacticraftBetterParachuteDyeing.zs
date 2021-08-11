// This brings two improvements: paracutes now use oredicted dyes and can be recolored

import crafttweaker.oredict.IOreDictEntry;

// Maps metadata values to dyes
val IdToDye = [
	<ore:dyeWhite>,
	<ore:dyeBlack>,
	<ore:dyeLightBlue>,
	<ore:dyeLime>,
	<ore:dyeBrown>,
	<ore:dyeBlue>,
	<ore:dyeGray>,
	<ore:dyeGreen>,
	<ore:dyeLightGray>,
	<ore:dyeMagneta>,
	<ore:dyeOrange>,
	<ore:dyePink>,
	<ore:dyePurple>,
	<ore:dyeRed>,
	<ore:dyeCyan>,
	<ore:dyeYellow>
] as IOreDictEntry[];

// Note that originally it only allows to dye white parachute. We allow to recolor it to your heart's content!
var acceptableInputs = <galacticraftcore:parachute:0>;
for metadata in 1 .. 15 {
	acceptableInputs |= <galacticraftcore:parachute>.definition.makeStack(metadata);
}

for metadata, dye in IdToDye {
	val resultingItem = <galacticraftcore:parachute>.definition.makeStack(metadata);
	recipes.removeShapeless(resultingItem, [], true); // Shouldn't break things
	recipes.addShapeless(
		"galacticraftcore_" + "parachute" + "_" + (metadata as string) + "_fix",
		resultingItem,
		[dye, acceptableInputs]
	);
} 
