var s = argument[0];
var filename = "Mods/" + modsList[i] + "/scripts/" + s + ".utml";
var file = file_text_open_read(filename);

if (file != -1)
{
    while (!file_text_eof(file))
    {
        var line = file_text_read_string(file);
        scr_utmlline(line);
        file_text_readln(file);
    }
    
    file_text_close(file);
}
