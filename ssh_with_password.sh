#!/bin/bash

#ssh是通过密码访问

#ip地址列表文件路径
IP_LIST="ip.txt"

#配置ssh的用户名、端口、密码
SSH_USER="root"
SSH_PORT=22
SSH_PASSWORD="1" 

#设置ssh连接超时时间（秒） 
SSH_TIMEOUT=1  

#进入一个无限循环（直到用户输入q退出）
while true; do
    #提示用户输入要执行的命令
    read -p "Please enter the command to execute on each server (or 'q' to quit): " COMMAND

    #如果用户输入q退出循环
    if [ "$COMMAND" = "q" ]; then
        echo "Exiting..."
        exit 0
    fi

    #循环遍历ip地址列表执行用户输入的命令
    for IP_ADDRESS in `cat $IP_LIST`
    do
        echo "=================================================="
        echo "Connecting to $IP_ADDRESS as $SSH_USER on port $SSH_PORT"
        echo "--------------------------------------------------"
        sshpass -p$SSH_PASSWORD ssh -o ConnectTimeout=$SSH_TIMEOUT -o StrictHostKeyChecking=no -p $SSH_PORT $SSH_USER@$IP_ADDRESS "$COMMAND"
        echo "--------------------------------------------------"
        echo "Completed for $IP_ADDRESS"
        echo "=================================================="
        echo
    done
done
