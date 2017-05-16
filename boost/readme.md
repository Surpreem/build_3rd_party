
# Boost C++ Libraries Build Script

부스트 라이브러리를 윈도우 환경에서 간편하게 빌드하려고 만든 스크립트이다.

빌드 설명은 아래를 참고하고 그 외 관련 내용은 다음을 참고한다.

* [라이브러리 명명 규칙](http://www.boost.org/doc/libs/1_63_0/more/getting_started/windows.html#library-naming)
* [코드에 관한 간략한 설명](https://surpreem.com/boost-%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC-%EB%B9%8C%EB%93%9C-%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8/)


## 준비물

이 스크립트로 빌드할 때 필요한 것은 다음과 같다.

* [Boost 라이브러리](http://www.boost.org/)
* Python (Boost.Python 사용하면 필요)
* Visual Studio 2017


## 빌드 방법

스크립트를 Boost 라이브러리의 루트 디렉터리에 넣는다. 부스트 파이썬을 빌드하려면 사용하는 파이썬 버전에 맞춰 user-config_x86.jam 또는 user-config_x64.jam 파일에 설정한다.

명령창을 열고 Boost 라이브러리 루트에서 build_boost.cmd를 실행한다.


## 참고

빌드한 바이너리는 `<boost-root>\lib` 디렉터리에 생성한다.
