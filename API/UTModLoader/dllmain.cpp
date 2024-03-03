// dllmain.cpp : Определяет точку входа для приложения DLL.
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

extern "C" {
    func double Test()
    {
        return 1;
    }

    func string GetGamePath()
    {
        return "Idk how to get this but will fix later";
    }
}
