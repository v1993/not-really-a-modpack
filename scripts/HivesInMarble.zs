// Since Binnie's Mod's marble hives fail to generate, use some imagination to work it around!
// We have Project Red marble, so this isn't too much of a problem.

// It's impossible to use <ore:stoneMarble> directly, so use a loop
for marble in <ore:stoneMarble>.items {
	mods.forestry.Centrifuge.addRecipe([<extrabees:hive:3> % 5], marble, 100);
}
