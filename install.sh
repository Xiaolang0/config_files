# @Author: xiaolang
# @Date:   2017-10-02 00:06:57
# @Last Modified by:   xiaolang
# @Last Modified time: 2017-12-04 00:07:25
#!/bin/bash 


# 在debian系统下，初始化服务器


# 第一步
apt update

# 安装tmux git wget vim tmux mosh zsh
apt -y install tmux git wget vim tmux mosh zsh
wait

# 安装oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" &
wait

# 获取tmux的配置文件，并替换
wget -O .tmux.conf https://raw.githubusercontent.com/Xiaolang0/config_files/master/tmux.conf
mv .tmux.conf ~/

# 安装docker
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

sudo echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

