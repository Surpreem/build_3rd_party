@echo off

SETLOCAL
if "%1" == "" goto HELP

for /f "usebackq tokens=*" %%i in (`vswhere -latest -products * -requires Microsoft.VisualStudio.Workload.NativeDesktop -property installationPath`) do (
    set InstallDir=%%i
)

call "%InstallDir%\Common7\Tools\VsDevCmd.bat" -arch=x64 -host_arch=x64
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
echo  - Framework = gtest, gmock (default: gtest)
echo  - Configuration = Debug, Release (default: Debug)
echo.

:QUIT
