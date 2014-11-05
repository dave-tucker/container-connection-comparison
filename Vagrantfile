VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "linux" do |linux|
    linux.vm.box = "trustyx64"
    linux.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
    linux.vm.hostname = "linuxbridge"
    linux.vm.provider :virtualbox do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
  end

  config.vm.define "ovs" do |ovs|
    ovs.vm.box = "trustyx64"
    ovs.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
    ovs.vm.hostname = "ovs"
    ovs.vm.provider :virtualbox do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
  end

  config.vm.define "macvlan" do |macvlan|
    macvlan.vm.box = "trustyx64"
    macvlan.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box"
    macvlan.vm.hostname = "macvlan"
    macvlan.vm.provider :virtualbox do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
  end

end
