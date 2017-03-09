# Visual Studio 프로젝트 파일에서 OpenSSL 라이브러리 이름을 변경한다.
# OpenSSL 1.1.0 (윈도우용) 부터 적용.
# libeay32.lib, ssleay32.lib -> libcrypto.lib, libssl.lib


import os
import re


dirs_using_openssl = ['Crypto', 'NetSSL_OpenSSL']
vcproject_exts = ['.vcxproj', '.vcproj']
replace_words = [('libeay32', 'libcrypto'), ('ssleay32', 'libssl')]


def search_files(current_dir, exts):
    searched_files = []

    files = os.listdir(current_dir)
    for file in files:
        file_ext = os.path.splitext(file)[-1]
        if file_ext in exts:
            searched_files.append(os.path.join(current_dir, file))

    return searched_files


def replace_in_file(file, old, new):
        with open(file) as f:
            original_txt = f.read()
            replaced_txt = re.subn(old, new, original_txt)[0]
        with open(file, 'w') as f:
            f.write(replaced_txt)


def collect_files():
    root_dir = os.getcwd()
    collected_files = []
    for directory in dirs_using_openssl:
        search_dir = os.path.join(root_dir, directory)
        files = search_files(search_dir, vcproject_exts)
        collected_files.extend(files)

    return collected_files


def replace_in_files(files):
    for file in files:
        for word in replace_words:
            replace_in_file(file, word[0], word[1])


if '__main__' == __name__:
    collected_files = collect_files()
    replace_in_files(collected_files)
