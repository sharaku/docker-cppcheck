FROM alpine

MAINTAINER sharaku

RUN \
        apk add --no-cache -t .required_apks git make g++ pcre-dev && \
        git clone https://github.com/danmar/cppcheck.git /opt/cppcheck && \
        cd /opt/cppcheck && \
        git checkout -b 1.89 refs/tags/1.89 && \
        make install FILESDIR=/usr/share/cppcheck CFGDIR=/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG --static" && \
        strip /usr/bin/cppcheck && \
        rm -rf /opt/cppcheck && \
        apk del .required_apks
