# POCO C++ 라이브러리의 헤더와 바이너리 수집 정리


import os
import shutil


root_dir = os.getcwd()
dest_root_dir = os.path.join(os.pardir, 'poco')
components_cppunit = ['CppUnit', 'CppUnit/WinTestRunner']
lib_dir = [
    'bin',
    'lib',
    'bin64',
    'lib64',
    'PageCompiler/bin',
    'PageCompiler/File2Page/bin',
    'PageCompiler/bin64',
    'PageCompiler/File2Page/bin64']
temp_exts = ['.ilk', '.exp']
X64_TYPE = '64'


def read_components():
    with open('components') as f:
        components = f.read().splitlines()

    return components


def search_files(current_dir, exts):
    searched_files = []

    try:
        files = os.listdir(current_dir)
    except FileNotFoundError:
        pass
    else:
        for file in files:
            file_ext = os.path.splitext(file)[-1]
            if file_ext in exts:
                searched_files.append(os.path.join(current_dir, file))

    return searched_files


def delete_temp_files():
    for lib in lib_dir:
        files = search_files(os.path.join(root_dir, lib), temp_exts)
        for file in files:
            os.remove(file)


def copy_headers(components, dest_root):
    include_dir = 'include'
    for component in components:
        if component in components_cppunit:
            target_dir = poco_dir = ''
            if component == components_cppunit[1]:
                target_dir = components_cppunit[0]
        else:
            target_dir = poco_dir = 'Poco'
        src_dir = os.path.join(
            os.path.join(os.path.join(root_dir, component), include_dir), poco_dir)
        dest_dir = os.path.join(os.path.join(dest_root, include_dir), target_dir)
        os.system('robocopy /E /COPYALL {} {}'.format(src_dir, dest_dir))


def copy_library(dest_root):
    for lib in lib_dir:
        src_dir = os.path.join(root_dir, lib)
        if X64_TYPE in lib:
            platform = 'x64'
        else:
            platform = 'x86'
        dest_dir = os.path.join(os.path.join(dest_root, 'lib'), platform)
        # 복사할 디렉터리가 존재하면 copytree는 예외를 발생하므로 동일한 목적지에 여러번 복사할 수 없다.
        if not os.path.exists(dest_dir):
            os.makedirs(os.path.abspath(dest_dir))
        try:
            src_files = os.listdir(src_dir)
        except FileNotFoundError:
            pass
        else:
            for file in src_files:
                shutil.copy2(os.path.join(src_dir, file), dest_dir)


def copy_files(components, dest_root):
    if os.path.exists(dest_root):
        shutil.rmtree(dest_root, ignore_errors=True)

    copy_headers(components, dest_root)
    copy_library(dest_root)


if '__main__' == __name__:
    components = []
    components = read_components()
    delete_temp_files()
    copy_files(components, dest_root_dir)
