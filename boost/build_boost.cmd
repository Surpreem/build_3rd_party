@echo off
SETLOCAL

SET STAGE_DIR=.\lib\
SET BUILD_DIR=%TEMP%


call bootstrap.bat
b2 -j4 -a --reconfigure --stagedir=%STAGE_DIR%x64 --build-dir=%BUILD_DIR% --without-mpi --user-config=user-config_x64.jam toolset=msvc-14.0 address-model=64 --build-type=complete stage

call bootstrap.bat
b2 -j4 -a --reconfigure --stagedir=%STAGE_DIR%x86 --build-dir=%BUILD_DIR% --without-mpi --user-config=user-config_x86.jam toolset=msvc-14.0 address-model=32 --build-type=complete stage

robocopy /E /COPYALL "%STAGE_DIR%x64\lib" "%STAGE_DIR%x64"
robocopy /E /COPYALL "%STAGE_DIR%x86\lib" "%STAGE_DIR%x86"
rmdir /S /Q "%STAGE_DIR%x64\lib"
rmdir /S /Q "%STAGE_DIR%x86\lib"
del *.exe

ENDLOCAL
