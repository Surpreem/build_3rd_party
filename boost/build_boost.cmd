@echo off
SETLOCAL

if "%2" == "" goto HELP

SET PLATFORM=%1
SET MSVC_VER=%2
SET CORES=4
SET TOOLSET=msvc

SET STAGE_DIR=.\lib\
SET BUILD_DIR=%TEMP%
rem SET ICU_LIB_PATH=C:\Programs\icu-59.1-vs%MSVC_VER%
rem SET ICU_DATA=%ICU_LIB_PATH%\data

if "86" == "%PLATFORM%" (
    SET BITS=32
) else (
    SET BITS=64
)

if "2017" == "%MSVC_VER%" (
    SET TOOLSET=%TOOLSET%-14.1
) else (
    SET TOOLSET=%TOOLSET%-14.0
)

SET OPTIONS=-a --reconfigure -j%CORES%
SET OPTIONS=%OPTIONS% --user-config=user-config_x%PLATFORM%.jam
SET OPTIONS=%OPTIONS% --build-dir=%BUILD_DIR% --stagedir=%STAGE_DIR%x%PLATFORM%
rem SET OPTIONS=%OPTIONS% -sICU_PATH=%ICU_LIB_PATH%
SET OPTIONS=%OPTIONS% toolset=%TOOLSET% address-model=%BITS%
SET OPTIONS=%OPTIONS% --without-mpi --build-type=complete stage

call bootstrap.bat
b2 %OPTIONS% 

robocopy /E /COPYALL "%STAGE_DIR%x%PLATFORM%\lib" "%STAGE_DIR%x%PLATFORM%"
rmdir /S /Q "%STAGE_DIR%x%PLATFORM%\lib"
del *.exe

:HELP
echo.
echo build_boost <platform> <msvc_version>
echo.
echo * platform
echo  - x64 build: 64
echo  - x86 build: 86
echo.
echo * msvc_version
echo  - VS2015: 2015
echo  - VS2017: 2017
echo.

:QUIT

ENDLOCAL
