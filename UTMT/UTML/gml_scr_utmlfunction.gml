var s = argument[0];

if (string_pos("instance_create", s) > 0)
{
    s = string_replace_all(s, "instance_create(", "");
    s = string_replace_all(s, ")", "");
    s = string_replace_all(s, " ", "");
    var count = 1;
    
    for (var i = 1; i <= string_length(s); i++)
    {
        if (string_char_at(s, i) == ",")
            count++;
    }
    
    var result = array_create(count);
    var index = 0;
    var current = "";
    var len = string_length(s);
    
    for (var i = 1; i <= len; i++)
    {
        var ch = string_char_at(s, i);
        
        if (ch == ",")
        {
            result[index] = real(current);
            index++;
            current = "";
        }
        else
        {
            current += ch;
        }
    }
    
    if (current != "")
        result[index] = real(current);
    
    instance_create(result[0], result[1], result[2]);
}

if (string_pos("createnpc", s) > 0)
{
    s = string_replace_all(s, "createnpc(", "");
    s = string_replace_all(s, ")", "");
    s = string_replace_all(s, " ", "");
    var count = 1;
    
    for (var i = 1; i <= string_length(s); i++)
    {
        if (string_char_at(s, i) == ",")
            count++;
    }
    
    var result = array_create(count);
    var index = 0;
    var current = "";
    var len = string_length(s);
    
    for (var i = 1; i <= len; i++)
    {
        var ch = string_char_at(s, i);
        
        if (ch == ",")
        {
            result[index] = current;
            index++;
            current = "";
        }
        else
        {
            current += ch;
        }
    }
    
    if (current != "")
        result[index] = current;
    
    npc = instance_create(result[0], result[1], obj_moddablenpc);
    global.latestnpc = npc;
    
    with (npc)
    {
        modid = global.currentmod;
        dialpath = result[2];
        var filename = "Mods/" + modid + "/dialogues/" + dialpath + ".txt";
        var file = file_text_open_read(filename);
        var i = 0;
        
        if (file != -1)
        {
            while (!file_text_eof(file))
            {
                var line = file_text_read_string(file);
                dialogues[i] = line;
                i += 1;
                file_text_readln(file);
            }
            
            file_text_close(file);
        }
        
        if (result[3] == "$latestsprite")
            sprite_index = global.latestsprite;
        else
            sprite_index = asset_get_index(result[3]);
    }
}

if (string_pos("npc_setsize", s) > 0)
{
    s = string_replace_all(s, "npc_setsize(", "");
    s = string_replace_all(s, ")", "");
    s = string_replace_all(s, " ", "");
    var count = 1;
    
    for (var i = 1; i <= string_length(s); i++)
    {
        if (string_char_at(s, i) == ",")
            count++;
    }
    
    var result = array_create(count);
    var index = 0;
    var current = "";
    var len = string_length(s);
    
    for (var i = 1; i <= len; i++)
    {
        var ch = string_char_at(s, i);
        
        if (ch == ",")
        {
            result[index] = real(current);
            index++;
            current = "";
        }
        else
        {
            current += ch;
        }
    }
    
    if (current != "")
        result[index] = real(current);
    
    with (global.latestnpc)
    {
        image_xscale = result[0];
        image_yscale = result[1];
    }
}

if (string_pos("sprite_replace", s) > 0)
{
    s = string_replace_all(s, "sprite_replace(", "");
    s = string_replace_all(s, ")", "");
    s = string_replace_all(s, " ", "");
    var count = 1;
    
    for (var i = 1; i <= string_length(s); i++)
    {
        if (string_char_at(s, i) == ",")
            count++;
    }
    
    var result = array_create(count);
    var index = 0;
    var current = "";
    var len = string_length(s);
    
    for (var i = 1; i <= len; i++)
    {
        var ch = string_char_at(s, i);
        
        if (ch == ",")
        {
            result[index] = current;
            index++;
            current = "";
        }
        else
        {
            current += ch;
        }
    }
    
    if (current != "")
        result[index] = current;
    
    scr_spritereplace(result[0], global.currentmod, result[1], result[2]);
}

if (string_pos("sprite_add", s) > 0)
{
    s = string_replace_all(s, "sprite_add(", "");
    s = string_replace_all(s, ")", "");
    s = string_replace_all(s, " ", "");
    var count = 1;
    
    for (var i = 1; i <= string_length(s); i++)
    {
        if (string_char_at(s, i) == ",")
            count++;
    }
    
    var result = array_create(count);
    var index = 0;
    var current = "";
    var len = string_length(s);
    
    for (var i = 1; i <= len; i++)
    {
        var ch = string_char_at(s, i);
        
        if (ch == ",")
        {
            result[index] = current;
            index++;
            current = "";
        }
        else
        {
            current += ch;
        }
    }
    
    if (current != "")
        result[index] = current;
    
    var filename = "Mods/" + global.currentmod + "/sprites/" + result[1] + ".png";
    global.latestsprite = sprite_add(filename, 1, false, false, 0, 0);
}
