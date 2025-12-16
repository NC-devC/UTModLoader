s = argument[0];
s = string_replace(s, " ", "");
isRoom = 0;

if (string_pos("$myroom", s) != 0)
    isRoom = 1;

s = string_replace(s, "$myroom", room);

if (string_pos("if", s) != 0)
{
    s = string_replace(s, " ", "");
    s = string_replace(s, "if", "");
    s = string_replace(s, "(", "");
    s = string_replace(s, ")", "");
    var eq_pos = string_pos("==", s);
    var left_part, right_part;
    
    if (eq_pos > 0)
    {
        left_part = string_copy(s, 1, eq_pos - 1);
        right_part = string_copy(s, eq_pos + 2, string_length(s) - eq_pos - 1);
    }
    
    var condition;
    
    if (isRoom == 1)
        condition = left_part == asset_get_index(right_part);
    
    if (condition)
        global.inif = 2;
    else
        global.inif = 1;
}

if (global.inif > 0)
{
    if (s == "}")
        global.inif = 0;
    
    if (s != "{")
    {
        if (global.inif == 2)
            scr_utmlfunction(s);
    }
}
else if (string_pos("(", s) != 0 && string_pos("if", s) == 0)
{
    scr_utmlfunction(s);
}
