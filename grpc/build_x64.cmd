@echo off

SETLOCAL
if "%1" == "" goto HELP
call "%VS140COMNTOOLS%\..\..\vc\vcvarsall.bat" x64
msbuild msbuild.xml /p:Platform=x64 %*
ENDLOCAL
exit /b %ERRORLEVEL%

:HELP
echo.
echo build_x64 [/t:^<target^>] [/p:^<parameter=value^>]
echo.
echo * target list
echo  - Clean: Clean projects
echo  - Build: Build projects
echo.
echo * parameter list (name = values)
echo  - Configuration = Debug, Release (default: Debug)
echo.

:QUIT
