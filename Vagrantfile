Vagrant.configure("2") do |config|

	config.vm.define "scriptbox" do |scriptbox|
		scriptbox.vm.box = "jacobw/fedora35-arm64"
		scriptbox.vm.network "private_network", ip: "192.168.10.12"
#		scriptbox.vm.network "public_network"
		scriptbox.vm.provider "virtualbox" do |vb|
			vb.memory = "1024"
		end
	end

	config.vm.define "web01" do |web01|
		web01.vm.box = "jacobw/fedora35-arm64"
		web01.vm.network "private_network", ip: "192.168.10.13"
#		web01.vm.network "public_network"
	end

	config.vm.define "web02" do |web02|
		web02.vm.box = "jacobw/fedora35-arm64"
		web02.vm.network "private_network", ip: "192.168.10.14"
#		web02.vm.network "public_network"
	end

  # config.vm.provision "shell", inline: <<-SHELL
  # SHELL

end
