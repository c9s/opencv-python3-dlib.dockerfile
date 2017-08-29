FROM yoanlin/opencv-python3:avx

MAINTAINER Yo-An Lin <yoanlin93@gmail.com>

ARG USER=davisking
ARG REPO=dlib
ARG VERSION=master

WORKDIR /

RUN wget https://github.com/$USER/$REPO/archive/$VERSION.tar.gz \
    && tar xvf $VERSION.tar.gz -C / \
    && (cd /$REPO-$VERSION \
        && python setup.py install \
                --yes DLIB_NO_GUI_SUPPORT \
                --yes USE_AVX_INSTRUCTIONS \
                --compiler-flags "-O3 -Wall") \
    && rm -rf /$VERSION.tar.gz /$REPO-$VERSION
