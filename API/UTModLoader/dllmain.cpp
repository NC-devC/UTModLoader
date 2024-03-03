#include "pch.h"
#include <stdlib.h>
#include <iostream>
#include <windows.h>

using namespace std;
#define func __declspec(dllexport)

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
                     )
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}

class ModPackage
{
    string author;
    string name;
    string description;
    string version;
    int versioncode;
};

extern "C" {
    func double Test()
    {
        return 1;
    }

    func string InitMod(string name)
    {
        return "None";
    }

    func string GetGamePath()
    {
        char buffer[MAX_PATH];
        GetModuleFileNameA(NULL, buffer, sizeof(buffer));
        string path(buffer);
        size_t pos = path.find_last_of("\\/");
        string result = path.substr(0, pos);
        return result;
    }

    func string GetModsPath()
    {
        string result = GetGamePath() + "\\Mods\\";
        return result;
    }
    
    func double MsgBox(string log)
    {
        MessageBoxA(NULL, log.c_str(), "Game Path", MB_OK);
        return 1;
    }
}
