
# YAML-CPP Build Script

C++용 YAML 파서인 YAML-CPP를 윈도우 환경에서 간편하게 빌드하려고 만든 스크립트이다.

빌드 설명은 아래를 참고하고 그 외 관련 내용은 다음을 참고한다.

* [라이브러리 명명 규칙](https://surpreem.com/%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC-%EB%AA%85%EB%AA%85-%EA%B7%9C%EC%B9%99-%EC%A0%95%EB%A6%AC/)


## 준비물

이 스크립트로 빌드할 때 필요한 것은 다음과 같다.

* [CMake](https://cmake.org/)
* Visual Studio 2015


## 빌드 방법

Yaml-cpp 소스 코드의 루트 디렉터리를 `<yaml-cpp-root>`라고 하면 스크립트를 담고 있는 디렉터리를 루트 아래에 둔다.


### 빌드 명령

build_x86 /t:Build /p:Configuration=Debug

build_x86 /t:Build /p:Configuration=Release

build_x64 /t:Build /p:Configuration=Debug

build_x64 /t:Build /p:Configuration=Release
