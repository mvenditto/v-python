# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/impish64"
	
	config.vm.provider "virtualbox" do |vb|
		vb.cpus = 8
    vb.memory = "8192"
  end
	
	config.vm.provision "shell", inline: <<-SHELL
		 apt update -y
		 apt install -y unzip \ 
				build-essential gcc gdb \
				python3.9 python3.9-dbg python3-dev python-dev
				
     wget https://github.com/vlang/v/releases/latest/download/v_linux.zip
		 unzip v_linux.zip
		 sudo chmod -R 777 /home/vagrant/v/
		 echo "export PATH=$PATH:/home/vagrant/v/" >> /home/vagrant/.bashrc 
  SHELL
	
end
