# syntax=docker/dockerfile:1.4
FROM debian:11
WORKDIR /autograder
WORKDIR /workspace
VOLUME /workspace
COPY <<build_install.sh <<run.sh . /workspace/SYsU-lang/
#!/bin/sh
rm -rf /workspace/sysu
cmake -G Ninja \\
    -DCMAKE_C_COMPILER=clang \\
    -DCMAKE_CXX_COMPILER=clang++ \\
    -DCMAKE_INSTALL_PREFIX=/workspace/sysu \\
    -DCPACK_SOURCE_IGNORE_FILES=".git/;tester/third_party/" \\
    -S /workspace/SYsU-lang \\
    -B /workspace/sysu/build
cmake --build /workspace/sysu/build
cmake --build /workspace/sysu/build -t install
build_install.sh
#!/bin/sh
python3 -m tarfile -e /autograder/submission/*.tar.gz /workspace/submission
rm -rf /workspace/SYsU-lang/generator
cp -r /workspace/submission/*-Source/generator /workspace/SYsU-lang
rm -rf /workspace/SYsU-lang/optimizer
cp -r /workspace/submission/*-Source/optimizer /workspace/SYsU-lang
rm -rf /workspace/submission
/workspace/build_install
mkdir -p /autograder/results
sysu-compiler \\
    --unittest=benchmark_generator_and_optimizer_1 \\
    --unittest-skip-filesize -1 \\
    "/workspace/SYsU-lang/**/*.sysu.c" >/autograder/results/results.json
run.sh
RUN <<EOF
apt update -y
apt upgrade -y
apt install --no-install-recommends -y \
    clang libclang-dev llvm-dev \
    zlib1g-dev lld flex bison \
    ninja-build cmake python3 git
apt clean -y
mv /workspace/SYsU-lang/run.sh /autograder/run
chmod +x /autograder/run
mv /workspace/SYsU-lang/build_install.sh /workspace/build_install
chmod +x /workspace/build_install
/workspace/build_install
EOF
ENV PATH=/workspace/sysu/bin:$PATH \
    CPATH=/workspace/sysu/include:$CPATH \
    LIBRARY_PATH=/workspace/sysu/lib:$LIBRARY_PATH \
    LD_LIBRARY_PATH=/workspace/sysu/lib:$LD_LIBRARY_PATH
