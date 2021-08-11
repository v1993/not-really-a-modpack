// Binnie's botany is a little wonky when it comes to sul(f/ph)ur. This script fixes it!
// All sulphur types work correctly when right-clicked on soil, so we only need to fix crafting.

// TODO: fix 4 soil + sulphur dust crafting
// It's rather tricky (or very tedious) to do

// Make tiny sulphur powder craftable

recipes.addShapeless("botany_small_sulphur_powder", <botany:misc:3> * 4, [<ore:dustSulfur>]);
