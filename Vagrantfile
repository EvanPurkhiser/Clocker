Vagrant.configure("2") do |config|

  # Use ubuntu precise32 (12.04 LTS)
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # Forward mail catcher
  config.vm.network :forwarded_port, guest: 1080, host: 1080

  # Add a virtual network interface that the host can access
  config.vm.network :private_network, ip: "192.168.2.100"

  # Sync using NFS
  # [!!] The `nfs_version` option is a MAJOR hack to add the nolock and actimeo
  # options for the NFS mount command.
  #
  # * nolock stops PHP file_put_contents from stalling when LOCK_EX is used
  # * actimeo=1 Updates file and directory attributes every 1 second
  #
  # options to the mount command executed to mount this share
  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root",
    nfs: true,
    nfs_version: "3,nolock,actimeo=1"

end
