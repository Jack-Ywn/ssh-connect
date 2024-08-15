#!/bin/bash

#ssh是通过密钥文件访问并且该密钥文件配置了密码使用此脚本文件

#ip地址列表文件路径
IP_LIST="ip.txt"

#配置SSH的用户名和端口
SSH_USER="root"
SSH_PORT=22

#设置ssh连接超时时间（秒） 
SSH_TIMEOUT=1

#指定的ssh私钥文件
SSH_KEY="/root/.ssh/id_rsa"

#进入一个无限循环（直到用户输入q退出）
while true; do
    #提示用户输入要执行的命令
    read -p "Please enter the command to execute on each server (or 'q' to quit): " COMMAND

    #如果用户输入q退出循环
    if [ "$COMMAND" = "q" ]; then
        echo "Exiting..."
        break
    fi

    #循环遍历ip地址列表执行用户输入的命令
    while IFS= read -r IP_ADDRESS; do
        echo "=================================================="
        echo "Connecting to $IP_ADDRESS as $SSH_USER on port $SSH_PORT"
        echo "--------------------------------------------------"
        ssh -o ConnectTimeout=$SSH_TIMEOUT -o StrictHostKeyChecking=no -n -i "$SSH_KEY" -p "$SSH_PORT" "$SSH_USER@$IP_ADDRESS" "$COMMAND"
        echo "--------------------------------------------------"
        echo "Completed for $IP_ADDRESS"
        echo "=================================================="
        echo
    done < "$IP_LIST"
done
