:: Zurücksetzen von Outlook-Profilen ab Version 2003
:: Autor: Alexander Karls, pegasus GmbH, Stand 01.10.18

@echo off

echo Vorhandene Outlook-Profile werden geloescht. Bitte mit erhöhten Rechten starten, falls notwendig!
pause

:: Default Profiles löschen 
:: Office 2003
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\11.0\Outlook" /v "DefaultProfile" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\11.0\Outlook\Profiles" /v "DefaultProfile" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\11.0\Outlook\Profiles" /f

:: Office 2007
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Outlook" /v "DefaultProfile" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Outlook\Profiles" /v "DefaultProfile" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Outlook\Profiles" /f

:: Office 2010
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Outlook" /v "DefaultProfile" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Outlook\Profiles" /v "DefaultProfile" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Outlook\Profiles" /f

:: Office 2013
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook" /v "DefaultProfile" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\Profiles" /v "DefaultProfile" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\Profiles" /f

:: Office 2016
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook" /v "DefaultProfile" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Profiles" /v "DefaultProfile" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Profiles" /f

:: Windows DefaultProfile
reg delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles" /v "DefaultProfile" /f
reg delete "HKEY_USERS\S-1-5-21-219420007-2090875171-1169685880-5631\Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles" /v "DefaultProfile" /f

:: User Profil 
reg delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles" /f
reg delete "HKEY_USERS\S-1-5-21-219420007-2090875171-1169685880-5631\Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles" /f

:: Outlook-Einstellungen zurücksetzen
:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:64BIT
echo 64-bit Betriebssystem gefunden...
"C:\Program Files\Microsoft Office\Office11\OUTLOOK.EXE" /resetnavpane
"C:\Program Files\Microsoft Office\Office12\OUTLOOK.EXE" /resetnavpane
"C:\Program Files\Microsoft Office\Office14\OUTLOOK.EXE" /resetnavpane
"C:\Program Files\Microsoft Office\Office15\OUTLOOK.EXE" /resetnavpane
"C:\Program Files\Microsoft Office\Office16\OUTLOOK.EXE" /resetnavpane
GOTO END

:32BIT
echo 32-bit Betriebssystem gefunden...
"C:\Program Files (x86)\Microsoft Office\Office11\OUTLOOK.EXE" /resetnavpane
"C:\Program Files (x86)\Microsoft Office\Office12\OUTLOOK.EXE" /resetnavpane
"C:\Program Files (x86)\Microsoft Office\Office14\OUTLOOK.EXE" /resetnavpane
"C:\Program Files (x86)\Microsoft Office\Office15\OUTLOOK.EXE" /resetnavpane
"C:\Program Files (x86)\Microsoft Office\Office16\OUTLOOK.EXE" /resetnavpane
GOTO END

:END
echo Standardeinstellungen wiederhergestellt, Outlook bitte neu starten
pause
