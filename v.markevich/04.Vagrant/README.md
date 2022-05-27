# 04.Vagrant homework

### Requirements:
* install Vagrant and VirtualBox

* Create Vargrantfile with:

* Debian. Latest
* CentOS. Latest
* shell provisioning for both VMs:
* install packages: vim, git, wget, curl
* deploy nginx server on each host with your custom index file

### Vagrant File Debian
```
Vagrant.configure("2") do |config|
 
config.vm.define "Debian11" do |debian|
 
  debian.vm.box = "debian/bullseye64"
  debian.vm.network "forwarded_port", guest: 80, host: 8088
  debian.vm.network "private_network", ip: "192.168.50.35" 
  debian.vm.provider "virtualbox" do |vb|
    vb.gui = false
	vb.memory = "1024"
	vb.cpus = "1"
end
  debian.vm.provision "file", source: "index.html", destination: "~/"
  debian.vm.provision "shell", inline: <<-SHELL
  apt update  
  apt-get install vim git  wget curl nginx -y
  sudo mv index.html /var/www/html/index.html
  sudo systemctl restart nginx
  echo "done!"
SHELL
end 
end
```
### Vagrant File CentOS
```
Vagrant.configure("2") do |config|
 
config.vm.define "centos8" do |centos|
 
  centos.vm.box = "centos/8"
  centos.vm.network "forwarded_port", guest: 80, host: 8089
  centos.vm.network "private_network", ip: "192.168.50.36" 
  centos.vm.provider "virtualbox" do |vb|
    vb.gui = false
	vb.memory = "1024"
	vb.cpus = "1"
end
  centos.vm.provision "file", source: "index.html", destination: "~/"
  centos.vm.provision "shell", inline: <<-SHELL
  cd /etc/yum.repos.d/
  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
  yum update -y 
  yum install vim git  wget curl nginx -y
  sudo mv /home/vagrant/index.html /usr/share/nginx/html/index.html
  sudo setsebool -P httpd_read_user_content 1
  sudo systemctl restart nginx
  echo "done!"
SHELL
end 
end

```