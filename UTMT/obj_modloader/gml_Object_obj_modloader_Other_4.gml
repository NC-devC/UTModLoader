for (i = 0; i < array_length_1d(modsList); i++)
{
    global.currentmod = modsList[i];
    func = external_define("Mods/" + modsList[i] + "/" + modsList[i] + ".dll", "OnRoomStart", dll_cdecl, ty_string, 0);
    scr_utmlscript(external_call(func));
}
