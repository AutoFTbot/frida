@echo off
set ADB_PATH=platform-tools\adb.exe
set FRIDA_SERVER=tools\frida-server-16.1.7-android-x86
set TARGET_APP=xyz.easypro.httpcustom
set SCRIPT=dump-httpcustom.js

echo [*] Starting ADB and Pushing Frida Server...
%ADB_PATH% start-server
%ADB_PATH% push %FRIDA_SERVER% /data/local/tmp/
%ADB_PATH% shell chmod 755 /data/local/tmp/frida-server-16.1.7-android-x86
%ADB_PATH% shell "/data/local/tmp/frida-server-16.1.7-android-x86 &"
timeout /t 3

echo [*] Injecting Frida Script...
frida -U -n %TARGET_APP% -l %SCRIPT% --no-pause > dump-output.txt

pause
