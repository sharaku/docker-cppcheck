FROM alpine

MAINTAINER sharaku

RUN \
        apk add --no-cache -t .required_apks git make g++ pcre-dev && \
        mkdir -p /usr/src /src && cd /usr/src && \
        git clone https://github.com/danmar/cppcheck.git && \
        git checkout refs/tags/1.89 && \
        cd cppcheck && \
        make install FILESDIR=/usr/share/cppcheck CFGDIR=/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG --static" && \
        strip /usr/bin/cppcheck && \
        rm -rf /usr/src && \
        apk del .required_apks
