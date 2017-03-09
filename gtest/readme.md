# Google Test Framework Build Script

구글 테스트 프레임워크인 Google Test와 Google Mock을 윈도우 환경에서 간편하게 빌드하려고 만든 스크립트이다.

빌드 설명은 아래를 참고하고 그 외 관련 내용은 다음을 참고한다.

* [라이브러리 명명 규칙](https://surpreem.com/%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC-%EB%AA%85%EB%AA%85-%EA%B7%9C%EC%B9%99-%EC%A0%95%EB%A6%AC/)
* [코드에 관한 간략한 설명](https://surpreem.com/%EA%B5%AC%EA%B8%80-%ED%85%8C%EC%8A%A4%ED%8A%B8-%ED%94%84%EB%A0%88%EC%9E%84%EC%9B%8C%ED%81%AC-%EB%B9%8C%EB%93%9C-%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8/)


## 준비물

이 스크립트로 빌드할 때 필요한 것은 다음과 같다.

* [Google Test](https://github.com/google/googletest)
* [CMake](https://cmake.org/)
* Visual Studio 2015


## 빌드 방법

빌드 스크립트에는 build와 gframe-build 두 가지가 있다. 편의성에 따라 약간 차이가 있을 뿐 하는 일에는 차이가 없으므로 둘 중 하나만 사용하면 된다.

구글 테스트 소스 코드의 루트 디렉터리를 `<gtest-root>`라고 하면 사용하는 스크립트에 따라 해당 디렉터리를 다음 위치에 복사한다.

* gframe-build

    `<gtest-root>\googletest` 또는 `<gtest-root>\googlemock`에 각각 복사한다.

* build

    `<gtest-root>`에 복사한다.


### 빌드 명령

* gtest

    build_x86 /t:Build /p:Configuration=Debug

    build_x86 /t:Build /p:Configuration=Release

    build_x64 /t:Build /p:Configuration=Debug

    build_x64 /t:Build /p:Configuration=Release

* gmock

    build_x86 /t:Build /p:Framework=gmock;Configuration=Debug

    build_x86 /t:Build /p:Framework=gmock;Configuration=Release

    build_x64 /t:Build /p:Framework=gmock;Configuration=Debug

    build_x64 /t:Build /p:Framework=gmock;Configuration=Release


## 주의

한국어 윈도우에서는 현재 코드 페이지(cp949)로 표현하지 못하는 문자가 `<gtest-root>\googletest\include\gtest\internal\gtest-internal.h` 파일에 있다는 경고(C4819)를 발생하며 빌드를 실패한다.

경고 수준을 변경할 수도 있지만 해당 파일 인코딩을 UTF-8 with BOM으로 변경 후 빌드하면 된다.
