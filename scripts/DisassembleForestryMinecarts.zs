// Railcraft allows to disassemble railcarts with content into parts.
// This allows to do it for forestry's hive minecarts.

recipes.addShapeless("beehouse_cart_disassembly", <forestry:bee_house>, [<forestry:cart.beehouse:0>.transformReplace(<minecraft:minecart>)]);
recipes.addShapeless("apiary_cart_disassembly", <forestry:apiary>, [<forestry:cart.beehouse:1>.transformReplace(<minecraft:minecart>)]);

mods.jei.JEI.addDescription(<forestry:cart.beehouse:*>, "Disassembles into parts just fine. Yes, you'll get your minecart back. Make sure to remove the wax though.");
