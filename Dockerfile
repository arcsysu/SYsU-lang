FROM debian:11
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y \
        ninja-build cmake git python3 \
        cpp lld flex bison zlib1g-dev \
        clang libclang-dev llvm-dev \
        tar gzip && \
    apt clean
WORKDIR /autograder
COPY . SYsU-lang/
RUN echo $'#!/bin/sh \n\
cmake -G Ninja -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_INSTALL_PREFIX=/autograder/sysu -DCPACK_SOURCE_IGNORE_FILES=".git/;tester/third_party/" -S /autograder/SYsU-lang -B /autograder/sysu/build \n\
cmake --build /autograder/sysu/build -t install \n\
'>/autograder/build_install && \
    echo $'#!/bin/sh \n\
tar -C /autograder -zxvf /autograder/submission/*.tar.gz \n\
rm -rf /autograder/SYsU-lang/generator \n\
cp -r /autograder/SYsU-lang-*-Source/generator /autograder/SYsU-lang \n\
rm -rf /autograder/SYsU-lang/optimizer \n\
cp -r /autograder/SYsU-lang-*-Source/optimizer /autograder/SYsU-lang \n\
rm -rf /autograder/SYsU-lang/compiler \n\
cp -r /autograder/SYsU-lang-*-Source/compiler /autograder/SYsU-lang \n\
rm -rf /autograder/sysu \n\
/autograder/build_install \n\
mkdir -p /autograder/results \n\
sysu-compiler --unittest=benchmark_generator_and_optimizer_1 "**/*.sysu.c" >/autograder/results/results.json \n\
'>/autograder/run && \
    chmod +x /autograder/run && \
    chmod +x /autograder/build_install && \
    /autograder/build_install && \
    rm -rf /autograder/sysu/build
ENV PATH=/autograder/sysu/bin:$PATH \
    CPATH=/autograder/sysu/include:$CPATH \
    LIBRARY_PATH=/autograder/sysu/lib:$LIBRARY_PATH \
    LD_LIBRARY_PATH=/autograder/sysu/lib:$LD_LIBRARY_PATH