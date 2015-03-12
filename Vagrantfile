Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.synced_folder ".", "/home/vagrant/goboot"
  config.vm.provision "shell",
    inline: "apt-get install -y gcc gccgo nasm make"
end
