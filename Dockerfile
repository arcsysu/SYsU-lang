# syntax=docker/dockerfile:1.4
FROM debian:11
RUN <<EOF
apt update -y
apt upgrade -y
apt install -y \
    ninja-build cmake git python3 \
    cpp lld flex bison zlib1g-dev \
    clang libclang-dev llvm-dev \
    tar gzip
apt clean -y
EOF
WORKDIR /autograder
COPY <<build_install <<run . /autograder/SYsU-lang/
#!/bin/sh
cmake -G Ninja \\
    -DCMAKE_C_COMPILER=clang \\
    -DCMAKE_CXX_COMPILER=clang++ \\
    -DCMAKE_INSTALL_PREFIX=/autograder/sysu \\
    -DCPACK_SOURCE_IGNORE_FILES=".git/;tester/third_party/" \\
    -S /autograder/SYsU-lang \\
    -B /autograder/sysu/build
cmake --build /autograder/sysu/build -t install
build_install
#!/bin/sh
tar -C /autograder -zxvf /autograder/submission/*.tar.gz
rm -rf /autograder/SYsU-lang/generator
cp -r /autograder/SYsU-lang-*-Source/generator /autograder/SYsU-lang
rm -rf /autograder/SYsU-lang/optimizer
cp -r /autograder/SYsU-lang-*-Source/optimizer /autograder/SYsU-lang
rm -rf /autograder/SYsU-lang/compiler
cp -r /autograder/SYsU-lang-*-Source/compiler /autograder/SYsU-lang
rm -rf /autograder/sysu
/autograder/build_install
mkdir -p /autograder/results
sysu-compiler \
    --unittest=benchmark_generator_and_optimizer_1 \
    "**/*.sysu.c" >/autograder/results/results.json
run
RUN <<EOF
mv /autograder/SYsU-lang/run /autograder/run
chmod +x /autograder/run
mv /autograder/SYsU-lang/build_install /autograder/build_install
chmod +x /autograder/build_install
/autograder/build_install
EOF
ENV PATH=/autograder/sysu/bin:$PATH \
    CPATH=/autograder/sysu/include:$CPATH \
    LIBRARY_PATH=/autograder/sysu/lib:$LIBRARY_PATH \
    LD_LIBRARY_PATH=/autograder/sysu/lib:$LD_LIBRARY_PATH
