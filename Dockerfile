# syntax=docker/dockerfile:1.4
ARG BASE_IMAGE=ubuntu
FROM ${BASE_IMAGE}
WORKDIR /autograder
ENV SYSU_SOURCE_DIR=/opt/SYsU-lang
ENV SYSU_INSTALL_PREFIX=/opt/sysu
WORKDIR \$SYSU_SOURCE_DIR
COPY <<build_install.sh <<run.sh . \$SYSU_SOURCE_DIR
#!/bin/sh
rm -rf \$2
cmake -G Ninja \\
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \\
    -DCMAKE_C_COMPILER=clang \\
    -DCMAKE_CXX_COMPILER=clang++ \\
    -DCMAKE_INSTALL_PREFIX=\$2 \\
    -DCMAKE_PREFIX_PATH="$(llvm-config --cmakedir)" \\
    -DCPACK_SOURCE_IGNORE_FILES=".git/;tester/third_party/" \\
    -S \$1 \\
    -B \$2/build
cmake --build \$2/build
cmake --build \$2/build -t install
build_install.sh
#!/bin/sh
python3 -m tarfile -e /autograder/submission/*.tar.gz \$SYSU_SOURCE_DIR/submission
rm -rf \$SYSU_SOURCE_DIR/generator
cp -r \$SYSU_SOURCE_DIR/submission/*-Source/generator \$SYSU_SOURCE_DIR
rm -rf \$SYSU_SOURCE_DIR/optimizer
cp -r \$SYSU_SOURCE_DIR/submission/*-Source/optimizer \$SYSU_SOURCE_DIR
rm -rf \$SYSU_SOURCE_DIR/submission
\$SYSU_SOURCE_DIR/build_install.sh \$SYSU_SOURCE_DIR \$SYSU_INSTALL_PREFIX
mkdir -p /autograder/results
sysu-compiler \\
    --unittest=benchmark_generator_and_optimizer_1 \\
    "\$SYSU_SOURCE_DIR/**/*.sysu.c" >/autograder/results/results.json
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
mv \$SYSU_SOURCE_DIR/run.sh /autograder/run
chmod +x /autograder/run
chmod +x \$SYSU_SOURCE_DIR/build_install.sh
\$SYSU_SOURCE_DIR/build_install.sh \$SYSU_SOURCE_DIR \$SYSU_INSTALL_PREFIX
EOF
ENV PATH=${SYSU_INSTALL_PREFIX}/bin:$PATH \
    CPATH=${SYSU_INSTALL_PREFIX}/include:$CPATH \
    LIBRARY_PATH=${SYSU_INSTALL_PREFIX}/lib:$LIBRARY_PATH \
    LD_LIBRARY_PATH=${SYSU_INSTALL_PREFIX}/lib:$LD_LIBRARY_PATH
