# syntax=docker/dockerfile:1.4
FROM debian:11
WORKDIR /autograder
WORKDIR /root
COPY <<build_install.sh <<run.sh . /root/SYsU-lang/
#!/bin/sh
rm -rf /root/sysu
cmake -G Ninja \\
    -DCMAKE_C_COMPILER=clang \\
    -DCMAKE_CXX_COMPILER=clang++ \\
    -DCMAKE_INSTALL_PREFIX=/root/sysu \\
    -DCPACK_SOURCE_IGNORE_FILES=".git/;tester/third_party/" \\
    -S /root/SYsU-lang \\
    -B /root/sysu/build
cmake --build /root/sysu/build
cmake --build /root/sysu/build -t install
build_install.sh
#!/bin/sh
python3 -m tarfile -e /autograder/submission/*.tar.gz /autograder/submission
rm -rf /root/SYsU-lang/generator
cp -r /autograder/submission/SYsU-lang-*-Source/generator /root/SYsU-lang
rm -rf /root/SYsU-lang/optimizer
cp -r /autograder/submission/SYsU-lang-*-Source/optimizer /root/SYsU-lang
rm -rf /autograder/submission/SYsU-lang-*-Source
/root/build_install
mkdir -p /autograder/results
sysu-compiler \\
    --unittest=benchmark_generator_and_optimizer_1 \\
    --unittest-skip-filesize -1 \\
    "/root/SYsU-lang/**/*.sysu.c" >/autograder/results/results.json
run.sh
RUN <<EOF
apt update -y
apt upgrade -y
apt install -y \
    clang libclang-dev llvm-dev \
    zlib1g-dev lld flex bison \
    ninja-build cmake python3 git
apt clean -y
mv /root/SYsU-lang/run.sh /autograder/run
chmod +x /autograder/run
mv /root/SYsU-lang/build_install.sh /root/build_install
chmod +x /root/build_install
/root/build_install
EOF
ENV PATH=/root/sysu/bin:$PATH \
    CPATH=/root/sysu/include:$CPATH \
    LIBRARY_PATH=/root/sysu/lib:$LIBRARY_PATH \
    LD_LIBRARY_PATH=/root/sysu/lib:$LD_LIBRARY_PATH
