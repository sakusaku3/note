# Vagrantで起動時にdocker+docker-composeをセットアップ

## 環境
- windows10
- virtualbox
- vagrant
- cygwin

## 前提条件
- virtualboxセットアップ済み
- vagrantセットアップ済み

## Vagrantfileを修正

```rb
Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.4"
  config.vm.provision "docker"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
  # docker-composeのインストール
  $get_compose = <<-'EOF'
  sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  EOF
  config.vm.provision "shell", inline: $get_compose
end
```

## 仮想マシン起動

``` bash
$ vagrant up
```

## 確認

ホストからゲストへsshログイン
``` bash
$ vagrant ssh
```

ゲスト
``` bash
[vagrant@localhost ~]$ docker -v
Docker version 18.05.0-ce, build f150324

[vagrant@localhost ~]$ docker-compose -v
docker-compose version 1.21.0, build 5920eb0
```

## refs
- [0](https://qiita.com/You_name_is_YU/items/19cc3268badd23fdd298)
