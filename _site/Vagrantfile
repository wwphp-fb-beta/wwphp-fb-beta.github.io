$bootstrap = <<SCRIPT
echo "installing ..." && \
sudo apt-get update && \
sudo apt-get -y install build-essential git curl nodejs
SCRIPT

Vagrant::Config.run do |config|

  config.vm.box = "hashicorp/precise64"
  config.vm.forward_port 8124, 8124
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
