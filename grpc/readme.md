
# gRPC C++ Library Build Script

gRPC C++ 라이브러리를 윈도우 환경에서 간편하게 빌드하려고 만든 스크립트이다.


## 준비물

이 스크립트로 빌드할 때 필요한 것은 다음과 같다.

* [gRPC](http://www.grpc.io/)
* [CMake](https://cmake.org/)
* Visual Studio 2015


## 빌드 방법

빌드 스크립트가 있는 디렉터리를 적당한 곳에 받은 후 다음 순서대로 실행하면 된다.

1. clone.cmd
2. build_x64.cmd 또는 build_x86.cmd

빌드 후 바이너리는 빌드 스크립트가 있는 디렉터리 안에 모아 준다.

### 빌드 명령

* 다음 명령을 사용하면 된다. 초기화는 `/t:Clean`을 사용한다.

    build_x86 /t:Build /p:Configuration=Debug

    build_x86 /t:Build /p:Configuration=Release

    build_x64 /t:Build /p:Configuration=Debug

    build_x64 /t:Build /p:Configuration=Release

