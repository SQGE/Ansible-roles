#!/bin/bash

dir=/data/ftp/logs
find $dir -mtime +7 -type f -exec rm -rf {} \;