FROM ubuntu:14.04

WORKDIR /app
RUN apt-get --yes --force-yes update 
RUN apt-get --yes --force-yes install build-essential libpcre3 libpcre3-dev libssl-dev git-core make curl libssl-dev libssl-dev
RUN mkdir -p /usr/src
RUN cd /usr/src && curl "https://codeload.github.com/alibaba/tengine/tar.gz/tengine-2.1.2" -o tengine-2.1.2.tar.gz
RUN cd /usr/src && tar xf tengine-2.1.2.tar.gz
COPY patch.patch /usr/src/tengine-tengine-2.1.2
RUN cat /usr/src/tengine-tengine-2.1.2/src/http/modules/ngx_http_upstream_dynamic_module.c
RUN cd /usr/src/tengine-tengine-2.1.2 && patch -p1 < patch.patch
RUN cd /usr/src/tengine-tengine-2.1.2 && ./configure --with-debug --with-cc-opt="-D NGX_HAVE_CASELESS_FILESYSTEM=0" --prefix=/opt/nginx && make && make install

