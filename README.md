Linux运行
>      git clone https://github.com/steamasq1/Minerproxy.git
安装完进入目录
>      cd Minerproxy
后台运行
>      nohup ./minerProxy_web &
查看token
>      vi config.yml 退出按ctrl➕Z
网页配置矿池
>      vpsip:18888 例如：1.8.9.2:18888
注意网页配置
>   矿池代理比如代理tcp的请输入tcp://eth.f2pool.com:6688
如果你要代理SSL ssl://asia2.ethermine.org:5555 本地端口填30000以后的.
记得在安全组打开你端口.否则矿机连不上。
抽水矿池，你要抽到哪里填哪里.ssl加密.需要就开启.不知道是啥就关闭。


Windows
>    双击minerProxy_web.exe
运行后目录会一个 config.yml,双击打开它.用记事本打开查看token.
在网页上输入127.0.0.1:18888 输入token后进去配置。网页配置参考Linux.一样的
