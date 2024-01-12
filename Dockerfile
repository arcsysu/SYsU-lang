# syntax=docker/dockerfile:1.4
ARG BASE_IMAGE=ubuntu
FROM ${BASE_IMAGE}
WORKDIR /autograder
WORKDIR /opt/SYsU-lang
COPY <<build_install.sh <<run.sh . /opt/SYsU-lang
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
python3 -m tarfile -e /autograder/submission/*.tar.gz /opt/SYsU-lang/submission
rm -rf /opt/SYsU-lang/generator
cp -r /opt/SYsU-lang/submission/*-Source/generator /opt/SYsU-lang
rm -rf /opt/SYsU-lang/optimizer
cp -r /opt/SYsU-lang/submission/*-Source/optimizer /opt/SYsU-lang
rm -rf /opt/SYsU-lang/submission
/opt/SYsU-lang/build_install.sh /opt/SYsU-lang /opt/sysu
mkdir -p /autograder/results
sysu-compiler \\
    --unittest=benchmark_generator_and_optimizer_1 \\
    "/opt/SYsU-lang/**/*.sysu.c" >/autograder/results/results.json
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
mv /opt/SYsU-lang/run.sh /autograder/run
chmod +x /autograder/run
chmod +x /opt/SYsU-lang/build_install.sh
/opt/SYsU-lang/build_install.sh /opt/SYsU-lang /opt/sysu
EOF
ENV PATH=/opt/sysu/bin:$PATH \
    CPATH=/opt/sysu/include:$CPATH \
    LIBRARY_PATH=/opt/sysu/lib:$LIBRARY_PATH \
    LD_LIBRARY_PATH=/opt/sysu/lib:$LD_LIBRARY_PATH
