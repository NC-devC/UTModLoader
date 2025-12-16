myinteract = 3;
global.msc = 0;
global.typer = 5;
global.facechoice = 0;
global.faceemotion = 0;

for (var i = 0; i < array_length_1d(dialogues); i += 1)
    global.msg[i] = dialogues[i];

mydialoguer = instance_create(0, 0, obj_dialoguer);
