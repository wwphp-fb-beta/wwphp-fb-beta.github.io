$bootstrap = <<SCRIPT
echo "installing essentials, nodejs and npm ..." && \
sudo apt-get update && \
sudo apt-get -y install build-essential git curl nodejs npm software-properties-common
SCRIPT

$php = <<SCRIPT
echo "installing PHP ..." && \
sudo add-apt-repository "deb http://packages.dotdeb.org jessie all" && \
sudo apt-get update && apt-get install -y --force-yes php7.0 php7.0-cli
SCRIPT

$bower = <<SCRIPT
echo "installing gulp and bower ..."

if [ ! -e /usr/bin/node ];
  then sudo ln -s /usr/bin/nodejs /usr/bin/node
fi

sudo npm install -g bower gulp
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
  config.vm.provision "gulp and bower", type: "shell",
    :inline => $bower,
    :name => "gulp and bower"

  config.ssh.forward_agent = true
end
