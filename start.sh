#!/bin/bash

cur_dir=`pwd`

ps -ef|grep 'risk_server' | grep -v 'grep' | awk '{print $2}' | xargs kill -9

## 启动管理后台(调试用，不要用于生产)
nohup python3 ${cur_dir}/www/manage.py runserver &

# 使用uwsgi启动后台
#command="uwsgi --master --vacuum --processes 10 --socket 127.0.0.1:8000 --chdir ${cur_dir}/www --max-requests 5000 --module wsgi:application --logto ${cur_dir}/www/risk-control.log --pidfile ${cur_dir}/www/risk-control.pid"
#nohup $command &

# 启动拦截日志持久化进程
nohup python3 ${cur_dir}/www/manage.py persistence_hit_log &

## 启动风控服务
nohup python3 ${cur_dir}/risk_server.py &

