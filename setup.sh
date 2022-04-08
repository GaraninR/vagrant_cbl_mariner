#!/bin/bash
dnf update -y
iptables -F && sudo iptables -X && sudo iptables -P INPUT ACCEPT && sudo iptables -P OUTPUT ACCEPT && sudo iptables -P FORWARD ACCEPT

# SSH user
useradd -m -d /home/user user
echo -e "Pa\$\$w0rd\nPa\$\$w0rd\n" | passwd user

# installing brew
mkdir /home/linuxbrew
chmod 777 -R /home/linuxbrew
yes | sudo -u vagrant /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/vagrant/.bash_profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1" >> /home/vagrant/.bash_profile
echo "alias ll='ls -la'" >> /home/vagrant/.bash_profile
echo "export PATH=/opt/microsoft/powershell/7:\$PATH" >> /home/vagrant/.bash_profile

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/user/.bash_profile
echo "export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1" >> /home/user/.bash_profile
echo "alias ll='ls -la'" >> /home/user/.bash_profile
echo "export PATH=/opt/microsoft/powershell/7:\$PATH" >> /home/user/.bash_profile

sudo -u vagrant brew update
sudo -u vagrant brew install dotnet neovim mc minikube kubectl helm

# installing docker

wget https://download.docker.com/linux/static/stable/x86_64/docker-20.10.14.tgz
tar xzvf docker-20.10.14.tgz
sudo cp docker/* /usr/bin/

echo "[Service]" >> /lib/systemd/system/docker.service
echo "ExecStart=" >> /lib/systemd/system/docker.service
echo "ExecStart=/usr/bin/dockerd -H unix://" >> /lib/systemd/system/docker.service

systemctl daemon-reload
systemctl start docker.service

groupadd docker
usermod -aG docker vagrant
usermod -aG docker user
gpasswd -a vagrant docker
gpasswd -a user docker
chmod 777 /usr/bin/docker

touch /etc/docker/daemon.json
echo '{"insecure-registries" : [ "127.0.0.1:5000" ] }' >> /etc/docker/daemon.json

sudo -u vagrant brew install docker-compose

# installing PowerShell
curl -L -o /tmp/powershell.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v7.2.1/powershell-7.2.1-linux-x64.tar.gz
mkdir -p /opt/microsoft/powershell/7
tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7
chmod 777 -R /opt/microsoft
ln 

# user preferences
touch /etc/sudoers.d/user
echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user
chmod 440 /etc/sudoers.d/user
mkdir /home/user/Projects
chown user:user -R /home/user/Projects

# clean
rm -rf /home/vagrant/docker
rm -f docker-20.10.14.tgz

chmod 777 -R /home/linuxbrew