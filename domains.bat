@echo off
set appcmdfile=c:\Windows\System32\inetsrv\appcmd.exe
for /f "tokens=1,2,3,4,5 delims=||" %%a in (domains.txt) do (
echo %%~a   %%~b   %%~c  %%~d  %%~e  ok
md "%%~a\%%~b"
%appcmdfile%  add site /name:%%~b /bindings:"http://%%~b:80,http://%%~c.%%~b:80,http://%%~d.%%~b:80,http://%%~e.%%~b:80" /physicalpath:%%~a\%%~b
)
pause