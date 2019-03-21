#!/bin/sh
set -e

dir="/data/ftp/log"

product=($dir/test1 $dir/test2)

for d in ${product[*]}

do

  find $d -mtime +7 -type f -exec rm -rf {} \;

done
