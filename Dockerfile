# syntax=docker/dockerfile:1.4
ARG BASE_IMAGE=ubuntu:noble
FROM ${BASE_IMAGE}
WORKDIR /root/SYsU-lang
COPY <<build_install.sh <<run.sh . /root/SYsU-lang
#!/bin/sh
rm -rf \$2
cmake -G Ninja \\
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \\
    -DCMAKE_C_COMPILER=clang \\
    -DCMAKE_CXX_COMPILER=clang++ \\
    -DCMAKE_CXX_STANDARD=17 \\
    -DCMAKE_INSTALL_PREFIX=\$2 \\
    -DCMAKE_PREFIX_PATH="$(llvm-config --cmakedir)" \\
    -DCPACK_SOURCE_IGNORE_FILES=".git/;tester/third_party/" \\
    -S \$1 \\
    -B \$2/build
cmake --build \$2/build -j
cmake --build \$2/build -t install
build_install.sh
#!/bin/sh
python3 -m tarfile -e /autograder/submission/*.tar.gz /root/SYsU-lang/submission
rm -rf /root/SYsU-lang/generator
cp -r /root/SYsU-lang/submission/*-Source/generator /root/SYsU-lang
rm -rf /root/SYsU-lang/rootimizer
cp -r /root/SYsU-lang/submission/*-Source/rootimizer /root/SYsU-lang
rm -rf /root/SYsU-lang/submission
/root/SYsU-lang/build_install.sh /root/SYsU-lang /root/sysu
sysu-compiler \\
    --unittest=benchmark_generator_and_optimizer_1 \\
    "/root/SYsU-lang/**/*.sysu.c" >/autograder/results/results.json
run.sh
RUN <<EOF
apt-get update -y
apt-get upgrade -y
apt-get install -y --no-install-recommends \
  libantlr4-runtime-dev default-jre-headless pkg-config uuid-dev flex bison \
  clang llvm-dev zlib1g-dev libzstd-dev lld python3 cmake ninja-build git
apt-get autoremove -y
apt-get clean -y
rm -rf /var/lib/apt/lists/*
mkdir -p /autograder/results
mv /root/SYsU-lang/run.sh /autograder/run
chmod +x /autograder/run
chmod +x /root/SYsU-lang/build_install.sh
/root/SYsU-lang/build_install.sh /root/SYsU-lang /root/sysu
EOF
ENV PATH=/root/sysu/bin:$PATH \
    CPATH=/root/sysu/include:$CPATH \
    LIBRARY_PATH=/root/sysu/lib:$LIBRARY_PATH \
    LD_LIBRARY_PATH=/root/sysu/lib:$LD_LIBRARY_PATH
