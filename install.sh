# @Author: xiaolang
# @Date:   2017-10-02 00:06:57
# @Last Modified by:   xiaolang
# @Last Modified time: 2017-10-02 00:08:16
#!/bin/bash 

apt update
apt -y upgrade
apt -y install git wget vim tmux mosh zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
wget -O .tmux.conf https://raw.githubusercontent.com/Xiaolang0/config_files/master/tmux.conf
mv .tmux.conf ~/
