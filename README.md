软件支持Windows跟Linux，小白请无脑使用Windows版[Windows版下载点我](https://raw.githubusercontent.com/Char1es0rz/minerProxy/3.0.3-web版/minerProxy_web.exe)，[Windows守护进程工具下载](https://wwe.lanzouj.com/i1uRazox1le)。2个文件放一个目录，双击windows守护进程.bat即可，中转数据混淆加密，绝对安全。防止被查水表。
=================
开发费(纯转发模式没有开发费）
===============
你抽水大于0%小于等于5%开发者费用为0.5%，大于5%小于等于10%开发者费用为1%，大于10%小于等于20%开发者费用为2%，大于20%开发者费用等于你的抽水百分比。
如果您是自用不开启抽水,则没有开发者费用
============
![img](https://github.com/Char1es0rz/minerProxy/blob/6b4339bd1dcb19301ba1e3f00e4904c2bbf01d4b/7B7294F4-E785-44F2-BCF1-429E7FF84E15.png)

电报群https://t.me/FreeMinerProxy
=========
Linux一键脚本安装完后记得修改token跟端口
====================
访问您的 IP:18888(建议修改其他端口以防止cc嗅探攻击。)
token值可在/etc/minerProxy/config.yml中查看

修改端口:nano /etc/minerProxy/config.yml   注释（修改好后，按下Ctrl➕字母o后再按下回车键。然后再按ctrl➕字母x退出）

修改后重启守护:supervisorctl reload

运行Linux一键脚本提示 curl: command not found的先安装curl
=======
ubuntu/debian 系统安装 curl 方法:
>     apt-get update -y && apt-get install curl -y
centos 系统安装 curl 方法:
>     yum update -y && yum install curl -y

安装好 curl 之后就能安装脚本了

如果运行Linux一键脚本后卡住不动
========

ubuntu/debian系统安装Wget
>     apt-get update -y && apt-get install wget -y

centos系统安装Wget
>     yum update -y && yum install wget -y

1:Linux一键全自动脚本安装
========
必须root用户.如果不是请用sudo -i进入
root用户在执行脚本.脚本执行完毕后需要重启服务器.否则
连接数不生效（脚本包含开机自动运行，自动修改TCP连接数限制）如果执行自动脚本
你看到的是乱码，直接按1就OK。1是全自动安装加运行。
>     bash <(curl -s -L https://bit.ly/3vUyhaw)
2:Linux手动安装
=======
>     git clone https://github.com/Char1es0rz/minerProxy.git

提示bash: git: command not found的先安装git
===================
ubuntu下
>     apt update
>     apt install git


centos下
>     yum update
>     yum install git
安装完进入目录
>     cd minerProxy
>     chmod a+x minerProxy_web
后台运行
>     nohup ./minerProxy_web &
后台运行时查看token
>     tail -f nohup.out 查看后退出按ctrl+c
修改默认token跟端口（强烈建议修改掉默认端口。防止被扫描）
=========
>     nano config.yml 按方向键修改默认token跟端口.修改好后，
>     按下Ctrl➕字母o后再按下回车键。然后再按ctrl➕字母x退出。修改成功后需要杀掉进程在拉起才会生效。
>     杀掉进程 killall minerProxy_web 拉起进程 nohup ./minerProxy_web &

查看tcp连接数
>     ulimit -n

停止Linux自带防火墙
>     service firewalld stop
网页配置矿池
>     vpsip:18888 例如：1.8.9.2:18888 VPS入站规则添加TCP协议的18888端口，否则外网不能访问。
注意网页配置
>   矿池代理比如代理tcp的请输入tcp://eth.f2pool.com:6688
如果你要代理SSL ssl://asia2.ethermine.org:5555 本地端口填30000以后的.
记得在安全组打开你端口.否则矿机连不上。
抽水矿池，你要抽到哪里填哪里.ssl加密.需要就开启.不知道是啥就关闭。

3:Windows（下载minerProxy_web.exe)
[点击下载](https://raw.githubusercontent.com/Char1es0rz/minerProxy/3.0.3-web版/minerProxy_web.exe)
=========
>    双击minerProxy_web.exe 会弹出一个CMD窗口,
就能看到token.目录下会多个config.yml文件，用记事本
打开，修改token跟端口后，关闭CMD窗口在打开就生效呢。
在网页上输入127.0.0.1:你修改的端口号 输入token后进去配置。

tcp矿池(新建端口)是否开启ssl按钮需要关闭。
========================
如果开启ssl，那么矿机需要用ssl方式来连，不然连不上
=========================

![img](https://github.com/Char1es0rz/minerProxy/blob/61426002af2b791d70ad9e4a696b71412e968b7f/4856A5A4-3097-4AC0-8B3C-CAF1F8383484.jpeg)
![img](https://github.com/Char1es0rz/minerProxy/blob/174395e07689a0446c9be6478d8ff8a076572056/F3FF86A7-D796-456C-8A73-88463D351B93.png)
鱼池
>    tcp://eth.f2pool.com:6688

币安

>    tcp://ethash.poolbinance.com:1800


币印
>    tcp://eth.ss.poolin.me:1883

         
蚂蚁
>    tcp://stratum-eth.antpool.com:8008

    
2miners
>    tcp://asia-eth.2miners.com:2020


hiveon      
>    tcp://eth.hiveon.com:14444



Ethermine       
>    tcp://asia2.ethermine.org:4444



Flex    
>    tcp://eth-sg.flexpool.io:4444          

viabtc

>    tcp://eth.viabtc.io:3333

btc

>    tcp://sg-eth.ss.btc.com:1800

okex

>    tcp://stratum.okpool.me:3336

k1pool

>    tcp://cn.ethash.k1pool.com:5000

独角兽

>    tcp://eth.666pool.com:8558

蜘蛛

>    tcp://eth-asia.spiderpool.com:3867

nanopool

>    tcp://eth-asia1.nanopool.org:9999

小鸟

>    tcp://eth-asia.xnpool.com:1588

MiningPoolHub

>    tcp://ia.ethash-hub.miningpoolhub.com:20535


SSL矿池
============




Ethermine

>    ssl://asia2.ethermine.org:5555


Flex

>    ssl://eth-sg.flexpool.io:5555

2miners


>    ssl://asia-eth.2miners.com:12020


hiveon


>    ssl://eth.hiveon.com:24443


k1pool


>    ssl://cn.ethash.k1pool.com:5010

nanopool

>    ssl://eth-asia1.nanopool.org:9433
