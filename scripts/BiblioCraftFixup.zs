// Make BuildCraft recepies have better integration with other mods.
// Replaces hardcoded references with oredicted values.

import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;

// Use generic wood instead of hardcoded enumerations where applicable. No more vanilla wood needed!
// Also removes need to craft framing boards when generic wood is acceptable.

recipes.removeByRecipeName("bibliocraft:framingsheet");
recipes.addShapeless("bibliocraft_framingsheet_fix", <bibliocraft:framingsheet>*2, [<ore:plankWood>, <bibliocraft:framingsaw>.reuse()]);

recipes.removeByRecipeName("bibliocraft:framingsaw");
recipes.addShaped("bibliocraft_framingsaw_fix", <bibliocraft:framingsaw>, [[<minecraft:iron_ingot>, <minecraft:iron_ingot>, null], [null, <minecraft:iron_ingot>, <ore:plankWood> | <bibliocraft:framingsheet>], [null, null, <ore:plankWood> | <bibliocraft:framingsheet>]]);

recipes.removeByRecipeName("bibliocraft:framingsaw");
recipes.addShaped("bibliocraft_bibliochase_fix", <bibliocraft:bibliochase>, [[null, <ore:slabWood> | <bibliocraft:framingboard>, null], [<ore:slabWood> | <bibliocraft:framingboard>, <minecraft:iron_ingot>, <ore:slabWood> | <bibliocraft:framingboard>], [null, <ore:slabWood> | <bibliocraft:framingboard>, null]]);

// Use oredicted dyes for crafting

recipes.removeByRecipeName("bibliocraft:stockroomcatalog");
recipes.addShaped("bibliocraft_stockroomcatalog_fix", <bibliocraft:stockroomcatalog>, [[<minecraft:paper>, <ore:dyeGreen>, <minecraft:paper>], [<minecraft:paper>, <minecraft:writable_book>, <minecraft:paper>], [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]]);

recipes.removeByRecipeName("bibliocraft:tape");
recipes.addShaped("bibliocraft_tape_fix", <bibliocraft:tape>, [[<minecraft:string>, <minecraft:string>, <minecraft:string>], [<minecraft:string>, <ore:dyeYellow>, <minecraft:string>], [<minecraft:string>, <minecraft:string>, <minecraft:string>]]);

recipes.removeByRecipeName("bibliocraft:reading_glasses");
recipes.addShaped("bibliocraft_reading_glasses_fix", <bibliocraft:biblioglasses>, [[<minecraft:glass_pane>, <minecraft:iron_ingot>, <minecraft:glass_pane>], [<ore:dyeBlack>, null, <ore:dyeBlack>]]);

recipes.removeByRecipeName("bibliocraft:reading_glasses");
recipes.addShapeless("bibliocraft_tinted_glasses_fix", <bibliocraft:biblioglasses:1>, [<bibliocraft:biblioglasses>, <ore:dyeGray>]);

// Use oredicted dyes for coloring lamps, lanterns, typewriters and sword pedestals

// Items that are affected
val ColorableItems = {
	lamp_gold:      <bibliocraft:lampgold>,
	lamp_iron:      <bibliocraft:lampiron>,
	lantern_gold:   <bibliocraft:lanterngold>,
	lantern_iron:   <bibliocraft:lanterniron>,
	typewriter:     <bibliocraft:typewriter>,
	sword_pedestal: <bibliocraft:swordpedestal>
} as IItemStack[string];

// Maps metadata values to dyes
val IdToDye = [
	<ore:dyeWhite>,
	<ore:dyeLightGray>,
	<ore:dyeGray>,
	<ore:dyeBlack>,
	<ore:dyeRed>,
	<ore:dyeOrange>,
	<ore:dyeYellow>,
	<ore:dyeLime>,
	<ore:dyeGreen>,
	<ore:dyeCyan>,
	<ore:dyeLightBlue>,
	<ore:dyeBlue>,
	<ore:dyePurple>,
	<ore:dyeMagenta>,
	<ore:dyePink>,
	<ore:dyeBrown>
] as IOreDictEntry[];

for itemName, item in ColorableItems {
	var acceptableInputs = item;
	for metadata in 1 .. 15 {
		acceptableInputs |= item.definition.makeStack(metadata);
	}

	for metadata, dye in IdToDye {
		val resultingItem = item.definition.makeStack(metadata);
		recipes.removeShapeless(resultingItem, [], true); // Shouldn't break things
		recipes.addShapeless(
			"bibliocraft_" + itemName + "_" + (metadata as string) + "_fix",
			resultingItem,
			[dye, acceptableInputs]
		);
	}
}
