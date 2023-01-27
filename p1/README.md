# P1

## Requirements

### Vagrant host only

Check if an host-only network already exists :

```sh
$ vboxmanage list hostonlyifs
Name:            vboxnet0
...
```

If not, create a new one, configue it with the correct IP and netmask and disable DHCP :

```zsh
$ vboxmanage hostonlyif create
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
Interface 'vboxnet1' was successfully created
$ vboxmanage hostonlyif ipconfig vboxnet1 --ip 192.168.42.1 --netmask 255.255.255.0
$ vboxmanage dhcpserver modify --ifname IF_NAME --disable
```

### vagrant-vbguest

`vagrant-vbguest` is a `Vagrant` plugin which automatically installs the host's VirtualBox Guest Additions on the guest system.

This plugin is used because the kernel of `centos/8` Vagrant box need to be upgraded.

See [issue #367](https://github.com/dotless-de/vagrant-vbguest/issues/367) and [PR #373](https://github.com/dotless-de/vagrant-vbguest/pull/373) for more information.

## Setup

Launch the project with:

```
vagrant up
```

You can verify that everything is setup with `vagrant status`:

```bash
ubuntu@vps-e0cdfc0a:~/IoT/p1$ vagrant status
...

Current machine states:

dzondaS                   running (virtualbox)
dzondaSW                  running (virtualbox)
```

You can ssh in a VM with `vagrant ssh`:

```bash
ubuntu@vps-e0cdfc0a:~/IoT/p1$ vagrant ssh dzondaS
dzondaS:~$ 
```

or 

```bash
ubuntu@vps-e0cdfc0a:~/IoT/p1$ vagrant ssh dzondaSW
dzondaSW:~$ 
```