#!/bin/bash
source /etc/profile

backdir=/data/gitlab/data/backups
/usr/bin/docker exec -i gitlab_gitlab_1  /opt/gitlab/bin/gitlab-rake gitlab:backup:create

find $backdir -mtime +3 -type f | xargs rm -f
