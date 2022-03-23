FROM debian:11
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y \
    ninja-build cmake git python3 \
    cpp lld flex bison zlib1g-dev \
    clang libclang-dev llvm-dev \
    tar gzip
WORKDIR /autograder
RUN git clone --recursive https://github.com/arcsysu/SYsU-lang /autograder/SYsU-lang
COPY run /autograder/run