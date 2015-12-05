$bootstrap = <<SCRIPT
echo "installing essentials, nodejs and npm ..." && \
sudo apt-get update && \
sudo apt-get -y install build-essential git curl nodejs npm software-properties-common && \
sudo ln -s /usr/bin/nodejs /usr/bin/node
SCRIPT

$php = <<SCRIPT
echo "installing PHP ..." && \
sudo add-apt-repository "deb http://packages.dotdeb.org jessie all" && \
sudo apt-get update && apt-get install -y --force-yes php7.0 php7.0-cli
SCRIPT

$bower = <<SCRIPT
echo "installing bower ..." && \
sudo npm install -g bower
SCRIPT

Vagrant.configure(2) do |config|

  config.vm.box = "debian/jessie64"
  config.vm.network "private_network", type: "dhcp"
  config.vm.provision "bootstrap", type: "shell",
    :inline => $bootstrap,
    :name => "Packages"
  config.vm.provision "rvm", type: "shell",
    :path => ".bash-scripts/install-rvm.sh",
    :args => "stable",
    :name => "rvm"
  config.vm.provision "ruby", type: "shell",
    :path => ".bash-scripts/install-ruby.sh",
    :args => "2.1.0 github-pages",
    :name => "Ruby and Gems"
  config.vm.provision "php", type: "shell",
    :inline => $php,
    :name => "php"
  config.vm.provision "bower", type: "shell",
    :inline => $bower,
    :name => "bower"

  config.ssh.forward_agent = true
end
