FROM quay.io/coreos/cross-compiler:base

ENV CROSS_TRIPLE i686-linux-android
ENV CROSS_ROOT /usr/${CROSS_TRIPLE}
ENV PATH ${PATH}:${CROSS_ROOT}/bin
ENV LD_LIBRARY_PATH ${CROSS_ROOT}/lib:${LD_LIBRARY_PATH}
ENV PKG_CONFIG_PATH ${CROSS_ROOT}/lib/pkgconfig:${PKG_CONFIG_PATH}

RUN mkdir -p /build && \
    cd /build && \
    wget -nv http://dl.google.com/android/ndk/android-ndk-r10e-linux-x86_64.bin && \
    cd /build && \
    chmod +x android-ndk-r10e-linux-x86_64.bin && \
    ./android-ndk-r10e-linux-x86_64.bin 1>log 2>err && \
    cd /build/android-ndk-r10e && \
    /bin/bash ./build/tools/make-standalone-toolchain.sh --toolchain=x86-4.9 --platform=android-21 --install-dir=${CROSS_ROOT} && \
    cd / && \
    rm -rf /build

RUN cd ${CROSS_ROOT}/bin && \
    ln -s ${CROSS_TRIPLE}-gcc ${CROSS_TRIPLE}-cc
