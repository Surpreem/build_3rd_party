@echo off
rem https://github.com/plasticbox/grpc-windows
SETLOCAL

pushd %~dp0

echo ### git clone ###
git clone -b v1.1.4 https://github.com/grpc/grpc ..\grpc_src
cd ..\grpc_src
git submodule update --init

echo ### 3rd party : update protobuf ###
cd third_party\protobuf
git checkout v3.2.0

popd
pushd %~dp0

echo ### Modify props: disable C4267, C4819
powershell -executionpolicy bypass -file edit_props.ps1

echo ## Install nuget packages
cd ..\grpc_src\vsprojects
powershell -executionpolicy bypass -Command Invoke-WebRequest https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -OutFile .\nuget.exe
nuget.exe restore grpc.sln

popd

ENDLOCAL
