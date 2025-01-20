Vagrant.configure("2") do |config|
  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/focal64"
    ubuntu.vm.network "private_network", ip: "192.168.56.10"
    ubuntu.vm.hostname = "ubuntu-control"
    ubuntu.vm.provision "shell", inline: <<-SHELL
      sudo apt update
      sudo apt install -y python3-pip
      pip3 install pywinrm
    SHELL
  end

  config.vm.define "windows" do |windows|
    windows.vm.box = "gusztavvargadr/windows-server"
    windows.vm.network "private_network", ip: "192.168.56.11"
    windows.vm.hostname = "windows-iis"
    windows.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
    windows.vm.provision "shell", inline: <<-SHELL
      Install-WindowsFeature -Name Web-Server -IncludeManagementTools
    SHELL
  end
end