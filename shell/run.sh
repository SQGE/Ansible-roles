#!/bin/bash


JARFILE=`ls -t *.jar | head -1`

usage() {
    echo "Usage: sh 执行脚本.sh [start|stop|restart|status|debug]"
    exit 1
}
#检查程序是否在运行
is_exist(){
  pid=`ps -ef|grep $JARFILE|grep -v grep|awk '{print $2}' `
  #如果不存在返回1，存在返回0     
  if [ -z "${pid}" ]; then
   return 1
  else
    return 0
  fi
}

#启动方法
start(){
  is_exist
  if [ $? -eq "0" ]; then
    echo "${JARFILE} is already running. pid=${pid} ."
  else
    nohup java -jar $JARFILE  > /dev/null 2>&1 &
  fi
}

#debug前台输出
debug(){
  is_exist
  if [ $? -eq "0" ]; then
    echo "${JARFILE} is already running. pid=${pid} ."
  else
    nohup java -jar $JARFILE 
  fi
}


#停止方法
stop(){
  is_exist
  if [ $? -eq "0" ]; then
    kill -9 $pid
  else
    echo "${JARFILE} is not running"
  fi  
}

#输出运行状态
status(){
  is_exist
  if [ $? -eq "0" ]; then
    echo "${JARFILE} is running. Pid is ${pid}"
  else
    echo "${JARFILE} is NOT running."
  fi
}

#重启
restart(){
  stop
  start
}

#根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
  "start")
    start
    ;;
  "stop")
    stop
    ;;
  "status")
    status
    ;;
  "debug")
    debug
    ;;
  "restart")
    restart
    ;;
  *)
    usage
    ;;
esac