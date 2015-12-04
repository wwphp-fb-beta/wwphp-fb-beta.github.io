$bootstrap = <<SCRIPT
echo "installing ..." && \
sudo apt-get update && \
sudo apt-get -y install build-essential git curl nodejs
SCRIPT

Vagrant.configure(2) do |config|

  config.vm.box = "debian/jessie64"
  config.vm.network "private_network", type: "dhcp"
  config.vm.provision :shell,
    :inline => $bootstrap,
    :name => "Packages"
  config.vm.provision :shell,
    :path => ".bash-scripts/install-rvm.sh",
    :args => "stable",
    :name => "rvm"
  config.vm.provision :shell,
    :path => ".bash-scripts/install-ruby.sh",
    :args => "2.1.0 github-pages",
    :name => "Ruby and Gems"

  config.ssh.forward_agent = true
end
