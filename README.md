docker-cppcheck
===============

# はじめに
cppcheckを実施するdockerコンテナです。
jenkinsやgitlabのcppcheck用のコンテナイメージとして利用可能です。

# 使い方

## Installation

以下のようにdocker imageをpullします。

    docker pull sharaku/cppcheck


## Quick Start

    docker run -t \
         --rm \
         --volume /path/to/source:/path/to/container/data:rw \
         sharaku/cppcheck --enable=all /path/to/container/data



