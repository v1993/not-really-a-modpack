// Allow future glass to be colored by oredicted dyes

import crafttweaker.oredict.IOreDictEntry;

// Maps metadata values to dyes
val IdToDye = [
	<ore:dyeBlack>,
	<ore:dyeRed>,
	<ore:dyeGreen>,
	<ore:dyeBrown>,
	<ore:dyeBlue>,
	<ore:dyePurple>,
	<ore:dyeCyan>,
	<ore:dyeLightGray>,
	<ore:dyeGray>,
	<ore:dyePink>,
	<ore:dyeLime>,
	<ore:dyeYellow>,
	<ore:dyeLightBlue>,
	<ore:dyeMagenta>,
	<ore:dyeOrange>,
	<ore:dyeWhite>
] as IOreDictEntry[];

val uncolored = <galaxyspace:futureglass_none>;

for metadata, dye in IdToDye {
	val resultingItem = <galaxyspace:futureglass>.definition.makeStack(metadata) * 8;
	// In our case glass metadata matches vanilla dye metadata
	recipes.removeShaped(resultingItem, [[uncolored, uncolored, uncolored], [uncolored, <minecraft:dye>.definition.makeStack(metadata), uncolored], [uncolored, uncolored, uncolored]]);
	recipes.addShaped(
		"galaxyspace_" + "futureglass" + "_" + (metadata as string) + "_fix",
		resultingItem,
		[[uncolored, uncolored, uncolored], [uncolored, dye, uncolored], [uncolored, uncolored, uncolored]]
	);
} 
 
