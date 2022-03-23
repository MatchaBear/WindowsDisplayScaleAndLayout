@echo off & setlocal

mode con: cols=50 Lines=02
2>nul del/q /f %tmp%\_tmp_send_keys_.vbs"
set "_tmp_send_keys_=%tmp%\_tmp_send_keys_.vbs"
explorer ms-settings:display && ping -n 2 127.1 >nul 

:vbs_dynamic_build_150
>"%_tmp_send_keys_%" (
     echo;Set objShell=WScript.CreateObject("WScript.Shell"^)
     echo;WScript.Sleep 500 : objShell.AppActivate "Settings"
     echo;objShell.SendKeys "{TAB}{TAB}{~}{UP}{UP}{UP}{UP}"
     echo;objShell.SendKeys "{UP}{UP}{UP}{DOWN}{DOWN}"
     echo;objShell.SendKeys "{~}%%%{F4}"
    ) && cscript //nologo "%_tmp_send_keys_%"

>nul 2>&1 (
explorer ms-settings:display & ping -n 4 -4 127.1 
%_APPDIRR__%taskkill/FI "WindowTitle eq Settings*"
del/q /f "%_tmp_send_keys_%" & endlocal & goto :EOF)