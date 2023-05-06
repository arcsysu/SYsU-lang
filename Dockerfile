# syntax=docker/dockerfile:1.4
ARG BASE_IMAGE=debian
FROM ${BASE_IMAGE}
WORKDIR /autograder
WORKDIR /workspace
VOLUME /workspace
COPY <<build_install.sh <<run.sh . /workspace/SYsU-lang/
#!/bin/sh
rm -rf \$HOME/sysu
cmake -G Ninja \\
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \\
    -DCMAKE_C_COMPILER=clang \\
    -DCMAKE_CXX_COMPILER=clang++ \\
    -DCMAKE_INSTALL_PREFIX=\$HOME/sysu \\
    -DCMAKE_PREFIX_PATH="$(llvm-config --cmakedir)" \\
    -DCPACK_SOURCE_IGNORE_FILES=".git/;tester/third_party/" \\
    -S /workspace/SYsU-lang \\
    -B \$HOME/sysu/build
cmake --build \$HOME/sysu/build
cmake --build \$HOME/sysu/build -t install
build_install.sh
#!/bin/sh
python3 -m tarfile -e /autograder/submission/*.tar.gz /workspace/submission
rm -rf /workspace/SYsU-lang/generator
cp -r /workspace/submission/*-Source/generator /workspace/SYsU-lang
rm -rf /workspace/SYsU-lang/optimizer
cp -r /workspace/submission/*-Source/optimizer /workspace/SYsU-lang
rm -rf /workspace/submission
\$HOME/build_install
mkdir -p /autograder/results
sysu-compiler \\
    --unittest=benchmark_generator_and_optimizer_1 \\
    "/workspace/SYsU-lang/**/*.sysu.c" >/autograder/results/results.json
run.sh
RUN <<EOF
apt-get update -y
apt-get upgrade -y
apt-get install -y --no-install-recommends \
  clang llvm-dev zlib1g-dev lld flex bison \
  cmake python3 ninja-build git
apt-get autoremove -y
apt-get clean -y
rm -rf /var/lib/apt/lists/*
mv /workspace/SYsU-lang/run.sh /autograder/run
chmod +x /autograder/run
mv /workspace/SYsU-lang/build_install.sh $HOME/build_install
chmod +x $HOME/build_install
$HOME/build_install
EOF
ENV PATH=/root/sysu/bin:$PATH \
    CPATH=/root/sysu/include:$CPATH \
    LIBRARY_PATH=/root/sysu/lib:$LIBRARY_PATH \
    LD_LIBRARY_PATH=/root/sysu/lib:$LD_LIBRARY_PATH
