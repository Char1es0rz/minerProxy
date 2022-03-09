#!/bin/bash
stty erase ^H

red='\e[91m'
green='\e[92m'
yellow='\e[94m'
magenta='\e[95m'
cyan='\e[96m'
none='\e[0m'

_red() { echo -e ${red}$*${none}; }
_green() { echo -e ${green}$*${none}; }
_yellow() { echo -e ${yellow}$*${none}; }
_magenta() { echo -e ${magenta}$*${none}; }
_cyan() { echo -e ${cyan}$*${none}; }

# Root
[[ $(id -u) != 0 ]] && echo -e "\n ��ʹ�� ${red}root ${none}�û����� ${yellow}~(^_^) ${none}\n" && exit 1

cmd="apt-get"

sys_bit=$(uname -m)

case $sys_bit in
'amd64' | x86_64) ;;
*)
    echo -e " 
	 ��� ${red}��װ�ű�${none} ��֧�����ϵͳ�� ${yellow}(-_-) ${none}
	��ע: ��֧�� Ubuntu 16+ / Debian 8+ / CentOS 7+ ϵͳ
	" && exit 1
    ;;
esac

if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then

    if [[ $(command -v yum) ]]; then

        cmd="yum"

    fi

else

    echo -e " 
	 ��� ${red}��װ�ű�${none} ��֧�����ϵͳ�� ${yellow}(-_-) ${none}
	��ע: ��֧�� Ubuntu 16+ / Debian 8+ / CentOS 7+ ϵͳ
	" && exit 1

fi

if [ ! -d "/etc/minerproxy/" ]; then
    mkdir /etc/minerproxy/
fi

error() {
    echo -e "\n$red �������!$none\n"
}

install_download() {
    installPath="/etc/minerproxy"
    $cmd update -y
    if [[ $cmd == "apt-get" ]]; then
        $cmd install -y lrzsz git zip unzip curl wget supervisor
        service supervisor restart
    else
        $cmd install -y epel-release
        $cmd update -y
        $cmd install -y lrzsz git zip unzip curl wget supervisor
        systemctl enable supervisord
        service supervisord restart
    fi
    [ -d ./minerproxy ] && rm -rf ./minerproxy
    git clone https://github.com/Char1es0rz/minerProxy.git

    if [[ ! -d ./minerproxy ]]; then
        echo
        echo -e "$red ��¡�ű��ֿ������...$none"
        echo
        echo -e " �볢�����а�װ Git: ${green}$cmd install -y git $none ֮���ٰ�װ�˽ű�"
        echo
        exit 1
    fi
    cp -rf ./minerproxy /etc/
    if [[ ! -d $installPath ]]; then
        echo
        echo -e "$red �����ļ�������...$none"
        echo
        echo -e " ʹ�����°汾��Ubuntu����CentOS������"
        echo
        exit 1
    fi
}

start_write_config() {
    echo
    echo "������ɣ������ػ�"
    echo
    chmod a+x $installPath/minerProxy_web
    if [ -d "/etc/supervisor/conf/" ]; then
        rm /etc/supervisor/conf/MinerProxy.conf -f
        echo "[program:MinerProxy]" >>/etc/supervisor/conf/MinerProxy.conf
        echo "command=${installPath}/minerProxy_web" >>/etc/supervisor/conf/MinerProxy.conf
        echo "directory=${installPath}/" >>/etc/supervisor/conf/MinerProxy.conf
        echo "autostart=true" >>/etc/supervisor/conf/MinerProxy.conf
        echo "autorestart=true" >>/etc/supervisor/conf/MinerProxy.conf
    elif [ -d "/etc/supervisor/conf.d/" ]; then
        rm /etc/supervisor/conf.d/MinerProxy.conf -f
        echo "[program:MinerProxy]" >>/etc/supervisor/conf.d/MinerProxy.conf
        echo "command=${installPath}/minerProxy_web" >>/etc/supervisor/conf.d/MinerProxy.conf
        echo "directory=${installPath}/" >>/etc/supervisor/conf.d/MinerProxy.conf
        echo "autostart=true" >>/etc/supervisor/conf.d/MinerProxy.conf
        echo "autorestart=true" >>/etc/supervisor/conf.d/MinerProxy.conf
    elif [ -d "/etc/supervisord.d/" ]; then
        rm /etc/supervisord.d/MinerProxy.ini -f
        echo "[program:MinerProxy]" >>/etc/supervisord.d/MinerProxy.ini
        echo "command=${installPath}/minerProxy_web" >>/etc/supervisord.d/MinerProxy.ini
        echo "directory=${installPath}/" >>/etc/supervisord.d/MinerProxy.ini
        echo "autostart=true" >>/etc/supervisord.d/MinerProxy.ini
        echo "autorestart=true" >>/etc/supervisord.d/MinerProxy.ini
    else
        echo
        echo "----------------------------------------------------------------"
        echo
        echo " Supervisor��װĿ¼û�ˣ���װʧ��"
        echo
        exit 1
    fi

    if [[ $cmd == "apt-get" ]]; then
        ufw disable
    else
        systemctl stop firewalld
    fi

    changeLimit="n"
    if [ $(grep -c "root soft nofile" /etc/security/limits.conf) -eq '0' ]; then
        echo "root soft nofile 60000" >>/etc/security/limits.conf
        changeLimit="y"
    fi
    if [ $(grep -c "root hard nofile" /etc/security/limits.conf) -eq '0' ]; then
        echo "root hard nofile 60000" >>/etc/security/limits.conf
        changeLimit="y"
    fi

    clear
    echo
    echo "----------------------------------------------------------------"
    echo
    if [[ "$changeLimit" = "y" ]]; then
        echo "ϵͳ�����������Ѿ����ˣ������һ�����б�������Ҫ����!"
        echo
    fi
    supervisorctl reload
    echo "��������ǽ�˿�18888�Ѿ����ţ�������޷����ӣ��뵽�Ʒ����̿���̨������ȫ�飬���ж�Ӧ�Ķ˿�"
    echo "���Է��ʱ���IP:18888"
    echo
    echo "��װ���...�ػ�ģʽ����־����Ҫ��־������nohup ./minerProxy_web &��ʽ����"
    echo
    echo "���������ļ���/etc/minerproxy/config.yml����ҳ�˿��޸ĵ�¼����token"
    echo
    echo "[*---------]"
    sleep 1
    echo "[**--------]"
    sleep 1
    echo "[***-------]"
    sleep 1
    echo "[****------]"
    sleep 1
    echo "[*****-----]"
    sleep 1
    echo "[******----]"
    echo
    cat /etc/minerproxy/config.yml
    echo "----------------------------------------------------------------"
}

uninstall() {
    clear
    if [ -d "/etc/supervisor/conf/" ]; then
        rm /etc/supervisor/conf/MinerProxy.conf -f
    elif [ -d "/etc/supervisor/conf.d/" ]; then
        rm /etc/supervisor/conf.d/MinerProxy.conf -f
    elif [ -d "/etc/supervisord.d/" ]; then
        rm /etc/supervisord.d/MinerProxy.ini -f
    fi
    supervisorctl reload
    echo -e "$yellow �ѹر�������${none}"
}

clear
while :; do
    echo
    echo "-------- MinerProxy һ����װ�ű� by:MinerProxy--------"
    echo "github���ص�ַ:https://github.com/Char1es0rz/minerProxy"
    echo "�ٷ��籨Ⱥ:https://t.me/FreeMinerProxy "
    echo
    echo " 1. ��װMinerProxy"
    echo
    echo " 2. ж��MinerProxy"
    echo
    read -p "$(echo -e "��ѡ�� [${magenta}1-2$none]:")" choose
    case $choose in
    1)
        install_download
        start_write_config
        break
        ;;
    2)
        uninstall
        break
        ;;
    *)
        error
        ;;
    esac
done