#!/bin/bash
echo 'Starting tests.'
filebench -f /etc/filebench/varmail.f > /filebench-out
echo 'STARTRES'
cat /filebench-out
echo 'ENDRES'
echo 'Done with tests.'