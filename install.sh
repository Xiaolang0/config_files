# @Author: xiaolang
# @Date:   2017-10-02 00:06:57
# @Last Modified by:   panghongteng
# @Last Modified time: 2017-10-19 11:09:18
#!/bin/bash 

apt update
# 安装最新版的php仓库地址
apt -y install python-software-properties software-properties-common
LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
apt update
apt -y upgrade

# build-essential编译程序所需要的包 libevent-dev是编译memcache时需要的 
apt -y install git wget vim tmux mosh zsh build-essential libevent-dev
# 安装oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &
# 获取tmux的配置文件，并替换
wget -O .tmux.conf https://raw.githubusercontent.com/Xiaolang0/config_files/master/tmux.conf
mv .tmux.conf ~/

# 根据输入的版本号安装php
echo " 输入准备安装的PHP版本号: "
read php_version
apt -y install php${php_version}-cgi php${php_version}-cli php${php_version}-bcmath php${php_version}-common php${php_version} php${php_version}-curl php${php_version}-fpm php${php_version}-gd php${php_version}-imap php${php_version}-json php${php_version}-mbstring php${php_version}-mcrypt php${php_version}-odbc php${php_version}-opcache php${php_version}-pgsql php${php_version}-readline php${php_version}-xml php${php_version}-xmlrpc php${php_version}-zip


# 安装memcache
read -p "是否需要安装最新版的memcached: [y/n]" is_install_memcached
if [[ $is_install_memcached == y ]]; then
    wget -O memcached-download wget http://memcached.org/latest
    tar -zxvf memcached-download
    mv memcached-* memcached-src
    cd memcached-src
    ./configure --prefix=/usr/local/memcached
    make && make test && sudo make install
    echo memcached 安装成功

else
    echo "不安装memcache，跳过"
fi
