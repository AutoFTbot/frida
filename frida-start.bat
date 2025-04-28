@echo off
set ADB_PATH=platform-tools\adb.exe
set FRIDA_SERVER=tools\frida-server-16.1.7-android-x86

echo [*] Starting ADB...
%ADB_PATH% start-server

echo [*] Pushing frida-server...
%ADB_PATH% push %FRIDA_SERVER% /data/local/tmp/
%ADB_PATH% shell chmod 755 /data/local/tmp/frida-server-16.1.7-android-x86

echo [*] Launching frida-server...
%ADB_PATH% shell "/data/local/tmp/frida-server-16.1.7-android-x86 &"

pause
