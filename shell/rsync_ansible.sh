#!/bin/bash
ansible_code=/data/ansible_code
rsync_src=/data/ftp/ops
while true
do
        for i in $ansible_code/ansible2 $ansible_code/inventory
        do
                cd $i && git pull
                rsync -avz $ansible_code/inventory $ansible_code/ansible2 --exclude='.git' --delete  -e 'ssh -p 6868'  hswk@120.26.67.162:$rsync_src &&
                sleep 20
        done
done