// Allows to make Mystcraft ink production a little less painful.
// Also allows to get 2x more ink with distilled water!
// Important! This does NOT show correctly in JEI, but works as intended.

// Note: you can pump ink straight into writing table, but ink mixer requires containers (automates just fine with them).

mods.ic2.Canner.addEnrichRecipe(<liquid:myst.ink.black> * 1000, <liquid:water> * 1000, <ore:dyeBlack> * 2);
mods.ic2.Canner.addEnrichRecipe(<liquid:myst.ink.black> * 2000, <liquid:ic2distilled_water> * 2000, <ore:dyeBlack>);
