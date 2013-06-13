# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "OMS-Storm"
  config.vm.box_url = "./veewee/OMS-Storm.box"
  
  config.vm.define :zookeeper do |zookeeper_config|
	# TODO: this isn't openning up for communication on 2181 to the rest of the cluster
    zookeeper_config.vm.network :private_network, ip: "172.24.0.1"
    zookeeper_config.vm.hostname = "zookeeper"
	
	zookeeper_config.vm.provision :shell, :path => "zookeeper/init.sh"
	zookeeper_config.vm.provision :shell, :path => "zookeeper/start.sh"
  end
  
  config.vm.define :nimbus do |nimbus_config|
	nimbus_config.vm.network :forwarded_port, guest: 8080, host: 8081
	nimbus_config.vm.network :private_network, ip: "172.24.0.11"
    nimbus_config.vm.hostname = "nimbus"
	
	nimbus_config.vm.provision :shell, :path => "storm/init.sh"
	nimbus_config.vm.provision :shell, :path => "nimbus/init.sh"
	nimbus_config.vm.provision :shell, :path => "nimbus/start.sh"
  end
  
  config.vm.define :supervisor1 do |super_config|
	super_config.vm.network :private_network, ip: "172.24.0.21"
    super_config.vm.hostname = "supervisor1"
	
	# super_config.vm.synced_folder "../data", "/vagrant_data"
	
	super_config.vm.provision :shell, :path => "storm/init.sh"
	super_config.vm.provision :shell, :path => "supervisor/init.sh"
	super_config.vm.provision :shell, :path => "supervisor/start.sh"
  end
  
  # config.vm.define :supervisor2 do |super_config|
	# super_config.vm.network :private_network, ip: "172.24.0.22"
    # super_config.vm.hostname = "supervisor2"
	
	# super_config.vm.provision :shell, :path => "storm/init.sh"
	# super_config.vm.provision :shell, :path => "supervisor/init.sh"
	# super_config.vm.provision :shell, :path => "supervisor/start.sh"
  # end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
end
