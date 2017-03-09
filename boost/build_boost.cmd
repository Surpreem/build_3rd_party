@echo off
SETLOCAL

SET STAGE_DIR=.\lib\
SET BUILD_DIR=%TEMP%


call bootstrap.bat
b2 -j4 -a --reconfigure --stagedir=%STAGE_DIR%x64 --build-dir=%BUILD_DIR% --without-mpi --user-config=user-config_x64.jam toolset=msvc-14.0 address-model=64 variant=debug,release link=shared threading=multi runtime-link=shared stage > build_log_x64.txt

FIND /I "error" build_log_x64.txt > build_errors_x64.txt
FIND /I "warning" build_log_x64.txt > build_warnings_x64.txt

call bootstrap.bat
b2 -j4 -a --reconfigure --stagedir=%STAGE_DIR%x86 --build-dir=%BUILD_DIR% --without-mpi --user-config=user-config_x86.jam toolset=msvc-14.0 variant=debug,release link=shared threading=multi runtime-link=shared stage > build_log_x86.txt

FIND /I "error" build_log_x86.txt > build_errors_x86.txt
FIND /I "warning" build_log_x86.txt > build_warnings_x86.txt

move /y %STAGE_DIR%x64\lib\* %STAGE_DIR%x64
move /y %STAGE_DIR%x86\lib\* %STAGE_DIR%x86
rd /s/q %STAGE_DIR%x64\lib
rd /s/q %STAGE_DIR%x86\lib
del *.exe

ENDLOCAL
