- 克隆项目

```
git clone https://github.com/Jack-Ywn/ssh-connect.git
cd ssh-connect
```

- 文件说明

```
tree
├── ip.txt                              #需要批量管理的IP地址
├── ssh_with_key_and_passphrase.sh      #被管理的SSH是基于私钥访问（私钥已配置二次验证密码）
├── ssh_with_key_no_passphrase.sh       #被管理的SSH是基于私钥访问（私钥未配置二次验证密码）
└── ssh_with_password.sh                #被管理的SSH是基于密码访问
```

- 使用项目

```shell
#修改ip.txt为实际要管理的机器（确保网络处于连通状态）
cat ip.txt 
192.168.1.100
192.168.1.101
192.168.1.102
192.168.1.103
192.168.1.104
192.168.1.105
192.168.1.106
192.168.1.107

#根据实际情况执行对于的批量管理脚本
./ssh_with_key_and_passphrase.sh 
Enter passphrase for ~/.ssh/id_rsa: #输入私钥密码
Please enter the command to execute on each server (or 'q' to quit):  

./ssh_with_key_no_passphrase.sh 
Please enter the command to execute on each server (or 'q' to quit):  

./ssh_with_password.sh 
Please enter the command to execute on each server (or 'q' to quit):  
```

- 注意事项

```shell
#使用密码管理的SSH依赖sshpass 
yum install -y sshpass 
```

