@echo off & setlocal

%_APPDIRR__%taskkill/FI "WindowTitle eq Settings*"
%_APPDIRR__%taskkill/FI "WindowTitle eq Settings*"
%_APPDIRR__%taskkill/FI "WindowTitle eq Settings*"

mode con: cols=50 Lines=02
2>nul del/q /f %tmp%\_tmp_send_keys_.vbs"
set "_tmp_send_keys_=%tmp%\_tmp_send_keys_.vbs"
explorer ms-settings:display && ping -n 2 127.1 >nul 

:vbs_dynamic_build_100
2>nul del/q /f "%_tmp_send_keys_%" & >"%_tmp_send_keys_%" ^
    (
     echo;Set objShell=WScript.CreateObject("WScript.Shell"^)
     echo;WScript.Sleep 500 : objShell.AppActivate "Settings"
     echo;objShell.SendKeys "{TAB}"
	 echo;WScript.Sleep 500
     echo;objShell.SendKeys "{TAB}"
	 echo;WScript.Sleep 500
     echo;objShell.SendKeys "{TAB}"
	 echo;WScript.Sleep 500
     echo;objShell.SendKeys "{TAB}"
	 echo;WScript.Sleep 500
     echo;objShell.SendKeys "{TAB}"
	 echo;WScript.Sleep 500
     echo;objShell.SendKeys " "
	 echo;WScript.Sleep 500
     echo;objShell.SendKeys "{UP}"
	 echo;WScript.Sleep 500
	 echo;objShell.SendKeys "{UP}"
	 echo;WScript.Sleep 500
	 echo;objShell.SendKeys "{UP}"
	 echo;WScript.Sleep 500
	 echo;objShell.SendKeys "{DOWN}"
	 echo;WScript.Sleep 500
     echo;objShell.SendKeys " "
	 echo;WScript.Sleep 500
    ) && cscript //nologo "%_tmp_send_keys_%"

>nul 2>&1 (
explorer ms-settings:display & ping -n 4 -4 127.1 
%_APPDIRR__%taskkill/FI "WindowTitle eq Settings*"
del/q /f "%_tmp_send_keys_%" & endlocal & goto :EOF)