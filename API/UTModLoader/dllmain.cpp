// dllmain.cpp : Определяет точку входа для приложения DLL.
#include "pch.h"
#include <stdlib.h>
#include <iostream>
#include <fstream>
using namespace std;
#define func extern "C" __declspec(dllexport)

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

func double TestFunction() {
    ofstream file("C:\\Users\\DELL\\Desktop\\test.txt");
    if (file.is_open()) {
        file << "Функция TestFunction выполнена успешно!";
        file.close();
        return 1;
    }
    else {
        return 0;
    }
    return 1;
}
