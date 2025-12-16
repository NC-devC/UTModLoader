var sprite = argument[0];
var modid = argument[1];
var spritepath = argument[2];
var subcount = argument[3];
var filename = "Mods/" + modid + "/sprites/" + spritepath + ".png";

if (asset_get_index(sprite))
    sprite_replace(asset_get_index(sprite), filename, 1, false, false, 0, 0);
