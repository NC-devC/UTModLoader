modsList = [];
var filename = "Mods/modsList.txt";
var file = file_text_open_read(filename);
i = 0;

if (file != -1)
{
    while (!file_text_eof(file))
    {
        var line = file_text_read_string(file);
        modsList[i] = line;
        i += 1;
        file_text_readln(file);
    }
    
    file_text_close(file);
}

global.inif = 0;
global.latestsprite = 1;

for (i = 0; i < array_length_1d(modsList); i++)
{
    global.currentmod = modsList[i];
    scr_utmlscript(external_call(external_define("Mods/" + modsList[i] + "/" + modsList[i] + ".dll", "OnGameInit", dll_cdecl, ty_string, 0)));
}
