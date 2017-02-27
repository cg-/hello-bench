FROM ubuntu

MAINTAINER Cole Grim version: 1

RUN apt-get update
RUN apt-get install -y build-essential automake cmake wget tar libtool bison flex

RUN mkdir /src
WORKDIR /src
#RUN wget https://github.com/filebench/filebench/archive/1.4.9.1.tar.gz
RUN wget https://github.com/filebench/filebench/archive/1.5-alpha3.tar.gz
RUN tar -zxvf 1.5-alpha3.tar.gz

WORKDIR /src/filebench-1.5-alpha3
RUN libtoolize && aclocal && autoheader && automake --add-missing && autoconf
RUN ./configure && make && make install
RUN mkdir /etc/filebench
ADD workloads/ /etc/filebench
ADD run.sh /sbin/run.sh
RUN chmod +x /sbin/run.sh

WORKDIR /