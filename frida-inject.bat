@echo off
set TARGET_APP=xyz.easypro.httpcustom
set SCRIPT=dump-httpcustom.js

echo [*] Injecting Frida Script...
frida -U -n %TARGET_APP% -l %SCRIPT% --no-pause

pause
