FROM ubuntu

MAINTAINER Cole Grim version: 1

# Apt Stuff
RUN apt-get update
RUN apt-get install -y build-essential automake cmake wget tar libtool bison flex git postmark

# Traces
RUN mkdir /traces
WORKDIR /traces
# todo: download traces we want to run...

# Filebench Setup
RUN mkdir /src
WORKDIR /src
RUN wget https://github.com/filebench/filebench/archive/1.5-alpha3.tar.gz
RUN tar -zxvf 1.5-alpha3.tar.gz

WORKDIR /src/filebench-1.5-alpha3
RUN libtoolize && aclocal && autoheader && automake --add-missing && autoconf
RUN ./configure && make && make install
RUN mkdir /etc/filebench
ADD workloads/ /etc/filebench

# Iozone
WORKDIR /src

RUN wget http://www.iozone.org/src/current/iozone3_465.tar
RUN tar -xvf iozone3_465.tar
WORKDIR /src/iozone3_465/src/current
RUN make linux-AMD64
RUN mv iozone /usr/bin/iozone

# Bonnie++
WORKDIR /src
RUN wget http://www.coker.com.au/bonnie++/bonnie++-1.03e.tgz
RUN tar -zxvf bonnie++-1.03e.tgz
WORKDIR /src/bonnie++-1.03e
RUN ./configure && make && make install

# FIO
WORKDIR /src
RUN git clone http://git.kernel.dk/fio.git
WORKDIR /src/fio
RUN ./configure && make && make install

# Cleanup
RUN rm -rf /src

# Add scripts
RUN mkdir /scripts
WORKDIR /scripts
ADD run.sh /scripts/run.sh
ADD fio/ /scripts/fio
ADD postmark/ /scripts/postmark

RUN chmod +x /scripts/run.sh

WORKDIR /