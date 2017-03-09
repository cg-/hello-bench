#!/bin/bash
echo 'Starting tests.'

# Filebench
# filebench -f /etc/filebench/varmail.f > /filebench-out

# Iozone
iozone –RA –g 32G

# Bonnie++

# FIO
# fio /scripts/fio/seqread.fio > /fio-seqread
# fio /scripts/fio/randread.fio > /fio-randread
# fio /scripts/fio/seqwrite.fio > /fio-seqwrite
# fio /scripts/fio/randwrite.fio > /fio-randwrite

# Postmark
# postmark /scripts/postmark/small.pm
# postmark /scripts/postmark/big.pm

# Print Results (we'll have to parse this inside hello-bench)
echo 'STARTRES'

# cat /filebench-out
# cat /fio-seqread
# cat /fio-randread
# cat /fio-seqwrite
# cat /fio-randwrite

echo 'ENDRES'
echo 'Done with tests.'