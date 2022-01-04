Linux运行
>     git clone https://github.com/steamasq1/minerProxy.git

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
查看token
>     vi config.yml 退出按ctrl➕Z
网页配置矿池
>     vpsip:18888 例如：1.8.9.2:18888
注意网页配置
>   矿池代理比如代理tcp的请输入tcp://eth.f2pool.com:6688
如果你要代理SSL ssl://asia2.ethermine.org:5555 本地端口填30000以后的.
记得在安全组打开你端口.否则矿机连不上。
抽水矿池，你要抽到哪里填哪里.ssl加密.需要就开启.不知道是啥就关闭。


Windows（下载minerProxy_web.exe)
>    双击minerProxy_web.exe
运行后目录会一个 config.yml,双击打开它.用记事本打开查看token.
在网页上输入127.0.0.1:18888 输入token后进去配置。网页配置参考Linux.一样的

tcp矿池(新建端口)是否开启ssl按钮需要关闭



鱼池
>    tcp://eth.f2pool.com:6688


币印
>    tcp://eth.ss.poolin.me:1883

         
蚂蚁
>    tcp://stratum-eth.antpool.com:8008

    
2miner
>    tcp://asia-eth.2miners.com:2020


hiveon      
>    tcp://hk-eth.hiveon.net:1444



E池        
>    tcp://asia2.ethermine.org:4444



凤池        
>    tcp://eth-sg.flexpool.io:4444          




ssl矿池




E池

>    ssl://asia2.ethermine.org:5555


凤池

>    ssl://eth-sg.flexpool.io:5555

2miner


>    ssl://asia-eth.2miners.com:12020


hiveon


>    ssl://hk-eth.hiveon.net:24443
