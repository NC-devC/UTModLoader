// dllmain.cpp : Определяет точку входа для приложения DLL.
#include "pch.h"
#include <windows.h>
#include <string>
#include <iostream>

#define func extern "C" __declspec(dllexport)
#define string std::string

bool inited = false;

// API

//

func string OnGameInit() {
	inited = true;
    return "gamestart";
}

func string OnRoomStart() {
    
    return "roomstart";
    
}