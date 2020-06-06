@ECHO OFF
echo *----------------------------*
echo  Mod Installer v0.0.2a
echo  Created by Larvey
echo *----------------------------*
cd %UserProfile%\Desktop
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a-%%b)
set mydir="oldmods-%mydate%-%mytime%"
pause
echo *** MAKE SURE THE MODS ZIP IS ON YOUR DESKTOP! ***
set /p zipfilename=What is the name of the zip file? (etc: mods.zip) :
IF NOT EXIST %zipfilename% (
echo Zip File does not exist... canceling...
goto ending
)
IF NOT EXIST %appdata%\.minecraft\mods (
echo Mods folder missing, Creating Mods Folder....
mkdir %appdata%\.minecraft\mods
) ELSE (
  echo Mods folder already exits, checking if mods are inside....
  IF EXIST %appdata%\.minecraft\mods\*.jar* (
    echo There are mods inside... Moving them to new folder....
    mkdir %appdata%\.minecraft\%mydir%
    move %appdata%\.minecraft\mods\*.jar %appdata%\.minecraft\%mydir%\
  ) ELSE (
    echo Mods folder is empty.
  )
)
echo Preparing to install new mods.
pause
PowerShell Expand-Archive -Path  "%zipfilename%" -DestinationPath "%appdata%\.minecraft\mods"
echo Mod Installation Complete. Thanks for using my Mod Installer!
goto ending
:ending
pause
