@echo off
REM === Setting Manual Di Sini ===
set ADB_PATH=C:\platform-tools\adb.exe
set FRIDA_SERVER_PATH=C:\frida\frida-server-16.1.7-android-x86
set FRIDA_SERVER_NAME=frida-server-16.1.7-android-x86
set TARGET_APP=com.evozi.httpcustom
set FRIDA_SCRIPT=C:\frida\dump-httpcustom.js

echo [*] --- [Starting ADB Server] ---
%ADB_PATH% start-server

echo [*] --- [Pushing Frida Server] ---
%ADB_PATH% push %FRIDA_SERVER_PATH% /data/local/tmp/

echo [*] --- [Setting Permission] ---
%ADB_PATH% shell chmod 755 /data/local/tmp/%FRIDA_SERVER_NAME%

echo [*] --- [Launching Frida Server] ---
%ADB_PATH% shell "/data/local/tmp/%FRIDA_SERVER_NAME% &"
timeout /t 3

echo [*] --- [Testing Frida Connection] ---
frida-ps -U

echo [*] --- [Injecting Frida Script into Target App] ---
frida -U -n %TARGET_APP% -l %FRIDA_SCRIPT% --no-pause

echo.
echo [*] --- [Frida Process Complete] ---
pause
