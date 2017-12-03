# @Author: xiaolang
# @Date:   2017-12-03 23:51:49
# @Last Modified by:   xiaolang
# @Last Modified time: 2017-12-04 00:08:02
#!/bin/bash 

yum update
# 添加epel源
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum update

# 安装开发工具包
yum groupinstall 'Development Tools'
# build-essential libtool编译程序所需要的包,包含常用的一些编译组件 libevent-dev是编译memcache时需要的 
yum -y install git wget vim tmux mosh zsh 
# nginx 所用到的组件
yum -y install zlib zlib-devel openssl openssl-devel pcre-devel
# 安装oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &
wait
# 获取tmux的配置文件，并替换
wget -O .tmux.conf https://raw.githubusercontent.com/Xiaolang0/config_files/master/tmux.conf
mv .tmux.conf ~/
echo 123

# 根据输入的版本号安装php
echo " 输入准备安装的PHP版本号: "
read php_version
yum -y install php${php_version}-cgi php${php_version}-cli php${php_version}-bcmath php${php_version}-common php${php_version} php${php_version}-curl php${php_version}-fpm php${php_version}-gd php${php_version}-imap php${php_version}-json php${php_version}-mbstring php${php_version}-mcrypt php${php_version}-odbc php${php_version}-opcache php${php_version}-pgsql php${php_version}-readline php${php_version}-xml php${php_version}-xmlrpc php${php_version}-zip


# 安装memcache
read -p "是否需要安装最新版的memcached: [y/n]" is_install_memcached
if [[ $is_install_memcached == y ]]; then
    wget -O memcached-download http://memcached.org/latest
    tar -zxvf memcached-download
    cd memcached-*
    ./configure --prefix=/usr/local/memcached
    make && make test && sudo make install
    echo memcached 安装成功

else
    echo "不安装memcache，跳过"
fi
