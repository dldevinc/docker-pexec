FROM alpine as builder
ARG VERSION=1.0rc8


RUN apk --update add \
    autoconf \
    automake \
    build-base \
	tar \
	texinfo

WORKDIR /src
ADD https://ftp.gnu.org/gnu/pexec/pexec-${VERSION}.tar.gz ./
RUN tar -xzf pexec-${VERSION}.tar.gz
RUN cd /src/pexec-${VERSION} && \
	autoreconf -fiv && \
	./configure && \
	make && \
	make install


FROM alpine
COPY --from=builder /usr/local/bin /usr/local/bin

ENTRYPOINT ["pexec"]
