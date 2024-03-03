// dllmain.cpp : Определяет точку входа для приложения DLL.
#include "pch.h"
#include <stdlib.h>
#include <iostream>
#include <fstream>
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
    func double TestFunction()
    {
        return 1;
    }
}
