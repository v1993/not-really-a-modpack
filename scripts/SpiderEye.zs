// Spider eye compensation (see also: config/ic2/macerator.ini)

mods.jei.JEI.addDescription(<minecraft:spider_eye>, "Due to nearly total extintion of spiders in known universe synthetic alternatives have found wider use.");

var grinPowder = <ic2:crop_res:3>;

recipes.addShapeless("botany_weed_killer_from_grin_pwder", <botany:misc:7> * 4, [grinPowder,<minecraft:wheat_seeds>,<minecraft:wheat_seeds>,<minecraft:wheat_seeds>]);
mods.forestry.Carpenter.addRecipe(<minecraft:spider_eye>, [[<ore:slimeball>], [null, grinPowder], [null, null, <minecraft:stick>]], 30, <liquid:water> * 1000);
mods.forestry.Carpenter.addRecipe(<minecraft:spider_eye>, [[<ore:slimeball>], [null, <minecraft:stick>]], 30, <liquid:poison> * 50); 
mods.forestry.Carpenter.addRecipe(grinPowder*4, [[<ore:sand>]], 30, <liquid:poison> * 200); 
