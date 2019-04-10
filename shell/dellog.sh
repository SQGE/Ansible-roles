#!/bin/bash

#一行流
# find -type f -size +500 -print0 | xargs -0 -I{} sh -c 'echo > {}'
#清除restapi生成的不规则日志

dir=/data/ftp/log
ls -l $dir | while read i;
do

cd $dir

size=`echo $i | awk '{print $5}'`
file=`echo $i | awk '{print $9}'`

#大于500m,单位字节
if [ $size -gt 524288000 ] ;
then

echo >$file

fi
done
