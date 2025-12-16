using System;
using System.Text;
using System.IO;
using System.Threading.Tasks;
using System.Linq;
using UndertaleModLib.Util;

// Script by NC, reference: UTMT - TouchControlsEnabler

EnsureDataLoaded();

string UTMLPath = Path.Combine(Path.GetDirectoryName(ScriptPath), "UTML");
string mlPath = Path.Combine(Path.GetDirectoryName(ScriptPath), "obj_modloader");
string npcPath = Path.Combine(Path.GetDirectoryName(ScriptPath), "obj_moddablenpc");

UndertaleModLib.Compiler.CodeImportGroup importGroup = new(Data);

// UTML API
QueueGMLFile(Path.Combine(UTMLPath, "gml_scr_spritereplace.gml"));
QueueGMLFile(Path.Combine(UTMLPath, "gml_scr_utmlfunction.gml"));
QueueGMLFile(Path.Combine(UTMLPath, "gml_scr_utmlline.gml"));
QueueGMLFile(Path.Combine(UTMLPath, "gml_scr_utmlscript.gml"));
Data.Scripts.Add(new UndertaleScript() { Name = Data.Strings.MakeString("scr_spritereplace"), Code = Data.Code.ByName("gml_scr_spritereplace") });
Data.Scripts.Add(new UndertaleScript() { Name = Data.Strings.MakeString("scr_utmlfunction"), Code = Data.Code.ByName("gml_scr_utmlfunction") });
Data.Scripts.Add(new UndertaleScript() { Name = Data.Strings.MakeString("scr_utmlline"), Code = Data.Code.ByName("gml_scr_utmlline") });
Data.Scripts.Add(new UndertaleScript() { Name = Data.Strings.MakeString("scr_utmlscript"), Code = Data.Code.ByName("gml_scr_utmlscript") });
importGroup.Import();

// Moddable npc
QueueGMLFile(Path.Combine(npcPath, "gml_Object_obj_moddablenpc_Alarm_0.gml"));
QueueGMLFile(Path.Combine(npcPath, "gml_Object_obj_moddablenpc_Create_0.gml"));
QueueGMLFile(Path.Combine(npcPath, "gml_Object_obj_moddablenpc_PreCreate_0.gml"));
QueueGMLFile(Path.Combine(npcPath, "gml_Object_obj_moddablenpc_Step_1.gml"));
importGroup.Import();

// Mod Loader
QueueGMLFile(Path.Combine(mlPath, "gml_Object_obj_modloader_Create_0.gml"));
QueueGMLFile(Path.Combine(mlPath, "gml_Object_obj_modloader_Other_4.gml"));
importGroup.Import();
var modLoaderObj = Data.GameObjects.ByName("obj_modloader");
modLoaderObj.Persistent = true;

var obj_time = Data.GameObjects.ByName("obj_time");
if (obj_time is not null)
{
    importGroup.QueueAppend(Data.Code.ByName("gml_Object_obj_time_Create_0"),
                            "instance_create(0, 0, obj_modloader);");
    importGroup.Import();
    return;
}

void QueueGMLFile(string path)
{
    importGroup.QueueReplace(Path.GetFileNameWithoutExtension(path), File.ReadAllText(path));
}