电报群https://t.me/+muk7Laxwh404ODM1

>后缀带exe的是Windows版.小白请无脑使用Windows版。不带的是Linux版.

Linux运行
>     git clone https://github.com/Char1es0rz/minerProxy.git

提示bash: git: command not found的先安装git

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
后台运行时查看
>     tail -f nohup.out 查看后退出按ctrl+c
查看token
>     vi config.yml 退出按ctrl➕Z
临时修改tcp连接数
>     ulimit -n 10240
网页配置矿池
>     vpsip:18888 例如：1.8.9.2:18888 VPS入站规则添加TCP协议的18888端口，否则外网不能访问。
注意网页配置
>   矿池代理比如代理tcp的请输入tcp://eth.f2pool.com:6688
如果你要代理SSL ssl://asia2.ethermine.org:5555 本地端口填30000以后的.
记得在安全组打开你端口.否则矿机连不上。
抽水矿池，你要抽到哪里填哪里.ssl加密.需要就开启.不知道是啥就关闭。

Linux开机自启

>     apt install supervisor -y
>     cd /etc/supervisor/conf.d/ 
>     nano minerProxy.conf

>     [program:minerProxy]
>     command=nohup ./minerProxy_web &
>     directory=/root/minerProxy
>     autostart=true
>     autorestart=true
>     user=root

>     ctrl+字母o  保存 按下回车键
>     ctrl+字母z  退出

>     supervisorctl reload  刷新配置，不然不生效

Windows（下载minerProxy_web.exe)
>    双击minerProxy_web.exe
运行后目录会多一个个 config.yml,双击打开它.用记事本打开查看token.
在网页上输入127.0.0.1:18888 输入token后进去配置。

tcp矿池(新建端口)是否开启ssl按钮需要关闭。
如果开启ssl，那么矿机需要用ssl方式来连，不然连不上。

![img](https://github.com/Char1es0rz/minerProxy/blob/8920df43314d377045dd3dfd678af822f439ea62/0AA73154-62BE-44EF-A359-248317C2802C.png)
![img](https://github.com/Char1es0rz/minerProxy/blob/174395e07689a0446c9be6478d8ff8a076572056/F3FF86A7-D796-456C-8A73-88463D351B93.png)
鱼池
>    tcp://eth.f2pool.com:6688


币印
>    tcp://eth.ss.poolin.me:1883

         
蚂蚁
>    tcp://stratum-eth.antpool.com:8008

    
2miner
>    tcp://asia-eth.2miners.com:2020


hiveon      
>    tcp://hk-eth.hiveon.net:14444



E池        
>    tcp://asia2.ethermine.org:4444



凤池        
>    tcp://eth-sg.flexpool.io:4444          

viabtc

>    tcp://eth.viabtc.io:3333

btc

>    tcp://sg-eth.ss.btc.com:1800

okex

>    tcp://stratum.okpool.me:3336

k1pool

>    tcp://cn.ethash.k1pool.com:5000


ssl矿池




E池

>    ssl://asia2.ethermine.org:5555


凤池

>    ssl://eth-sg.flexpool.io:5555

2miner


>    ssl://asia-eth.2miners.com:12020


hiveon


>    ssl://hk-eth.hiveon.net:24443


k1pool


>    ssl://cn.ethash.k1pool.com:5010
