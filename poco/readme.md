
# POCO C++ Libraries Build Script

POCO C++ 라이브러리를 윈도우 환경에서 간편하게 빌드하려고 만든 스크립트이다.

* [코드에 관한 간략한 설명](https://surpreem.com/poco-c-%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC-%EB%B9%8C%EB%93%9C-%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8/)


## 준비물

이 스크립트로 빌드할 때 필요한 것은 다음과 같다.

* [POCO](https://pocoproject.org)
* [OpenSSL](https://slproweb.com/products/Win32OpenSSL.html) (선택)
* [MySql](https://dev.mysql.com/downloads/mysql/) (선택)
* Visual Studio 2015
* Python (추가 스크립트 사용할 때만 필요)


## 빌드 방법

빌드 스크립트를 POCO C++ 라이브러리의 루트 디렉터리에 넣고 실행하면 된다.

POCO 라이브러리에는 기본판(Basic Edition)과 완전판(Complete Edition)이 있다. 완전판을 빌드할 때는 OpenSSL과 MySql이 필요하며,각각에 대한 경로는 build_vs140_x86.cmd 또는 build_vs140_x64.cmd 파일을 수정한다.


## 참고

### replace_library.py

OpenSSL 1.1.0 이상을 사용한다면 빌드하기 전에 실행한다. 바뀐 라이브러리 이름에 맞춰 Visual Studio 프로젝트를 수정해 준다.

### collect_library.py

빌드 후 실제 필요한 헤더와 라이브러리를 POCO 라이브러리 루트의 바로 상위에 `poco` 디렉터리를 만든 후 모아준다.
