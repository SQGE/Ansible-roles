#!/bin/bash

ansible_code=/data/ansible_code/wuxi
rsync_src=/data/ftp/ops
while true
do
  cd $ansible_code &&
  sleep 15 &&
  git pull &&
  rsync -avz $ansible_code '--exclude=.git' --delete  -e 'ssh -p 2222'  root@10.0.0.2:$rsync_src
done
