FROM alpine:3.7

RUN apk add --update \
  git \
  llvm-dev \
  llvm-static \
  clang-dev \
  clang-static \
  cmake \
  flex-dev \
  bison \
  luajit-dev \
  build-base \
  iperf \
  linux-headers \
  elfutils-dev \
  zlib-dev \
  python-dev

RUN ln -s /usr/lib/cmake/llvm5/ /usr/lib/cmake/llvm; \
    ln -s /usr/include/llvm5/llvm-c/ /usr/include/llvm-c; \
    ln -s /usr/include/llvm5/llvm/ /usr/include/llvm

# vi /bcc/src/cc/ns_guard.h
# vi /bcc/tests/cc/test_c_api.cc

RUN git clone https://github.com/iovisor/bcc.git

ADD patch1.patch /bcc
ADD patch2.patch /bcc
RUN cd /bcc; git apply patch1.patch
RUN cd /bcc; git apply patch2.patch

WORKDIR /bcc/build

RUN cmake .. -DCMAKE_INSTALL_PREFIX=/usr
