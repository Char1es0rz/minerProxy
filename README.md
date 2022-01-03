# Minerproxy
linux运行
git clone https://github.com/steamasq1/Minerproxy.git
安装完成后输入 cd Minerproxy 按回车键
在输入 nohup ./minerProxy_web & 按回车键.这样就是后台运行呢。
查看token vi config.yml 按i后用上下左右键选到token那里直接把token改掉.在按ESC键，在按shift➕：后输入wq!按回车.这样就保存呢
现在需要杀掉minerProxy_web进程.你修改的token才会生效.用命令killall minerPrxoy_web 多按几下回车键后在输入nohup ./minerProxy_web & 多按几下回车键后
去你VPs安全组添加18888端口.然后用网页访问你VPS IP➕端口访问配置矿池.
例如你VPs IP为1.8.2.4 哪你在网页输入1.8.2.4:18888
打开后会提示你输入token.输入你修改的token后就能配置矿池呢

