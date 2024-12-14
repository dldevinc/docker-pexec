FROM alpine as builder
ARG VERSION=1.0rc8


RUN apk --update add \
    autoconf \
    automake \
    g++ \
    make \
    texinfo \
    texlive-dvi

WORKDIR /src

RUN wget -qO pexec-${VERSION}.tar.gz https://ftp.gnu.org/gnu/pexec/pexec-${VERSION}.tar.gz . \
  && tar -xzf pexec-${VERSION}.tar.gz \
  && cd /src/pexec-${VERSION} \
  && autoreconf -fiv \
  && mkdir /pexec \
  && ./configure --prefix=/pexec \
  && make \
  && make install


FROM alpine
COPY --from=builder /pexec/bin/pexec /opt/pexec
ENV PATH="$PATH:/opt/pexec/bin"
