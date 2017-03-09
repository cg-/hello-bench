#!/bin/bash
sudo apt-get update
sudo apt-get install -y build-essential automake cmake wget tar libtool bison flex git postmark

mkdir ~/.hello-bench
cd ~/.hello-bench
cp workloads ~/.hello-bench/workloads

mkdir ~/.hello-bench/scripts
cp run.sh ~/.hello-bench/scripts/run.sh
cp fio/ ~/.hello-bench/scripts/fio
cp postmark/ ~/.hello-bench/scripts/postmark
chmod +x ~/.hello-bench/scripts/run.sh

mkdir ~/.hello-bench/traces
# todo: download traces we want to run...

# Filebench Setup
mkdir ~/.hello-bench/src
cd ~/.hello-bench/src
wget https://github.com/filebench/filebench/archive/1.5-alpha3.tar.gz
tar -zxvf 1.5-alpha3.tar.gz

cd ~/.hello-bench/src/filebench-1.5-alpha3
libtoolize && aclocal && autoheader && automake --add-missing && autoconf
./configure && make && sudo make install
sudo mkdir /etc/filebench
sudo mv ~/.hello-bench/workloads/* /etc/filebench
rm -rf ~/.hello-bench/workloads

# Iozone
cd ~/.hello-bench/src

wget http://www.iozone.org/src/current/iozone3_465.tar
tar -xvf iozone3_465.tar
cd ~/.hello-bench/src/iozone3_465/src/current
make linux-AMD64
sudo mv iozone /usr/bin/iozone

# Bonnie++
cd ~/.hello-bench/src
wget http://www.coker.com.au/bonnie++/bonnie++-1.03e.tgz
tar -zxvf bonnie++-1.03e.tgz
cd ~/.hello-bench/src/bonnie++-1.03e
./configure && make && sudo make install

# FIO
cd ~/.hello-bench/src
git clone http://git.kernel.dk/fio.git
cd ~/.hello-bench/src/fio
./configure && make && sudo make install

# Cleanup
rm -rf ~/.hello-bench/src

