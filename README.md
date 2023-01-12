# IoT

## Requirements

### VirtualBox on Debian GNU/Linux 10 (buster)

Update packages:

```bash
sudo echo 'deb https://download.virtualbox.org/virtualbox/debian buster contrib
' >>> /etc/apt/sources.list.d/virtualbox.list
```

```bash
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
```

```bash
sudo apt-get update
sudo apt-get install virtualbox-7.0
```

```bash
wget https://download.virtualbox.org/virtualbox/7.0.0/Oracle_VM_VirtualBox_Extension_Pack-7.0.0.vbox-extpack
sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-7.0.0.vbox-extpack
```
