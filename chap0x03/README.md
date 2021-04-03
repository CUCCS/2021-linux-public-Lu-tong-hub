# Linux第三章实验报告 Systemd入门

## 软件环境：Virtualbox、Ubuntu 20.04 Server 64bit、宿主机Windows10系统

## 实验步骤
* 在asciinema注册一个账号，并根据官方提供的指令在本地安装配置好asciinema

* 确保本地已经完成asciinema auth，并在asciinema成功关联了本地账号和在线账号
  
* 在命令行中远程连接虚拟机并进行相应操作

### 一、Systemd入门教程--命令篇

* 系统管理

3.2--3.5

[![asciicast](https://asciinema.org/a/2uTKzJWdAfxxlQ62FDATfXKDE.svg)](https://asciinema.org/a/2uTKzJWdAfxxlQ62FDATfXKDE)

3.6

[![asciicast](https://asciinema.org/a/7dgO6YuHFG0JSY5ZxBo3L2yMI.svg)](https://asciinema.org/a/7dgO6YuHFG0JSY5ZxBo3L2yMI)

* Unit

4.1--4.2

[![asciicast](https://asciinema.org/a/bdzts6Cy3KVcjD8klQtPwrOyl.svg)](https://asciinema.org/a/bdzts6Cy3KVcjD8klQtPwrOyl)

4.3--4.4

[![asciicast](https://asciinema.org/a/vYXgsxqRgloFyji1ngT5cJL3y.svg)](https://asciinema.org/a/vYXgsxqRgloFyji1ngT5cJL3y)

* Unit的配置文件

[![asciicast](https://asciinema.org/a/WqObtjU16K23ZCt6cqnCFWKbw.svg)](https://asciinema.org/a/WqObtjU16K23ZCt6cqnCFWKbw)

* Target

[![asciicast](https://asciinema.org/a/vzRw5p3bE9HEHIDahsYjbGb5R.svg)](https://asciinema.org/a/vzRw5p3bE9HEHIDahsYjbGb5R)

* 日志管理

[![asciicast](https://asciinema.org/a/wGnywDJoR3Xnd2h2JOx9zw7UH.svg)](https://asciinema.org/a/wGnywDJoR3Xnd2h2JOx9zw7UH)


### 二、Systemd入门教程--实战篇
* 开机启动
* 启动服务
* 停止服务
* 读懂配置文件
* Unit区块：启动顺序与依赖关系
* Service区块：启动行为
* Install区块
* Target的配置文件
* 修改配置文件后重启

[![asciicast](https://asciinema.org/a/WHHmdsO9LizZLpEKLsJe8pwqL.svg)](https://asciinema.org/a/WHHmdsO9LizZLpEKLsJe8pwqL)

## 自查清单
* 如何添加一个用户并使其具备sudo执行程序的权限？

* 答:adduser username #添加用户名；username ALL=(ALL) ALL #此句为添加sudo权限语句

* 如何将一个用户添加到一个用户组？

* 答：usermod -a -G <group> <username> 
  
* 如何查看当前系统的分区表和文件系统详细信息？
  
* 答：sudo fdisk -l 查看分区表；df -h 查看磁盘占用的空间；使用df -T 查看挂载的文件系统类型

* 如何实现开机自动挂载Virtualbox的共享目录分区？
* sudo mkdir /mnt/share
  sudo mount -t vboxsf gongxiang/mnt/share

* 基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？

* lvextend  -L [+] xG PATH
* lvreduce  -L [-] xG PATH

* 如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？
* ExecStartPost指定在启动执行ExecStart的命令后的收尾工作，可以有多个；ExecStopPost指定在ExecStop命令执行后的收尾工作，也可以有多个。因此，要设置：
  ExecStartPost=网络连通时运行的指定脚本的路径
  ExecStopPost =网络断开时运行的指定脚本的路径

* 如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死？
* 配置文件内容
[Service]
Restart=always
systemctl start [进程名]


### 问题
* 在执行设置时区的时候会出现报错，因为系统默认同步了时间，所以需要执行set-ntp no语句，关闭同步时间，然后再继续设置即可
* 有的语句要执行完整，否则会出现'too few arguments'的报错，如systemctl cat语句，后面要加Unit名
* 网页上的有些进程在自己的电脑中没有，需要更换自己拥有的Unit，或者install所需的Unit