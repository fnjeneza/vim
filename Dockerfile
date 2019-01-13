FROM ubuntu

ARG PREFIX=/vim
ARG VERSION=8.0.0567
ARG VIM=vim-${VERSION}
ARG AR=v${VERSION}.zip

RUN apt update && \
    apt install -y \
        libtinfo-dev  \
        unzip \
        curl \
        python3-dev \
        libncurses-dev \
        build-essential
WORKDIR /tmp/build
RUN curl -fsSLo ${AR}  https://github.com/vim/vim/archive/${AR} && \
    unzip ${AR}
WORKDIR ${VIM}
RUN ./configure --prefix=${PREFIX} \
    --with-features=huge \
    --enable-python3interp=dynamic \
    --enable-cscope \
    --enable-gui=no \
    --enable-fail-if-missing
RUN make -j5
