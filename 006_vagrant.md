# vagrant

## vagrantとは
仮想マシンの簡単な構築や、どこでも同じ環境を再現できるように仮想マシンを管理するためのコマンドラインツール

### メリット
簡単に仮想マシンを構築できる

さらに構成管理ツール(Chef, Ansible)を使って以下のメリットを受けられる

- 構築手順がコード管理可能になる。
- どんな処理を行っているか明確になる。
- 簡単に共有できるようになる。
- 何度でも同じ結果を得ることができる。(冪等性) ★大事だと思う

Vagrantfileに構成管理ツールを実行するように指定できるので、どこでも同じ仮想マシンを再現できる

## 用語

### Boxファイル
仮想マシン起動時のテンプレートとなるイメージファイル(isoファイルとは異なる)

自前でBoxファイルを作ることもできる(packerなど)

### Vagrantfile
仮想マシンの構成を記述するファイル

主に以下の項目を指定する

- 起動する仮想マシン指定
- ネットワーク設定
- 共有フォルダ設定
- マシンスペック設定(CPUやメモリの割り当てなど)
- プロビジョニング(シェルスクリプトや構成管理ツールの実行指定)


### プロバイダ
仮想化ソフト(仮想環境)のこと

デフォルトではVirtualBoxをサポートしている

プラグインをインストールすれば他の仮想環境(AWSとか)へも適応可能


### プロビジョニング
ミドルウェアのインストールや設定を行うツール
ここではシェルスクリプトや、構成管理ツール(Chef、Puppet、Ansibleなど)のことを指す
Vagrantfile内で指定する


### プラグイン
vagrant plugin installであとから機能を追加できる



## 簡単な手順
- box追加(vagrant box add [name] [url or path])
- vagrantの初期化(vagrant init)
- Vagrantfileの編集
- 仮想マシン起動(vagrant up)
- 仮想マシンの状態を確認(vagrant status)
- 仮想マシンにsshログイン(vagrant ssh)
- 仮想マシン停止(vagrant halt)



### box追加
[https://app.vagrantup.com/boxes/search](https://app.vagrantup.com/boxes/search)でインストールするBoxを検索

![vagrant.cloud](img/006_vagrant-00.png)

検索したBoxを追加する

```bash
$ vagrant box add [name] [url or path]
```

例 (bento系はChef社が提供しているやつ 安心して使って!)
```bash
$ vagrant box add bento/ubuntu-18.04
```


#### box一覧を確認

```bash
$ vagrant box list

bento/centos-6.8   (virtualbox, 2.3.4)
bento/centos-7.3   (virtualbox, 201708.22.0)
bento/ubuntu-18.04 (virtualbox, 201808.24.0)
centos64           (virtualbox, 0)
centos70           (virtualbox, 0)
ubuntu16           (virtualbox, 0)
```


### vagrantの初期化
Boxを使ってVagrantfileを作成する

```bash
$ vagrant init [box名:なくてもいい]
```

カレントディレクトリにVagrantfileができる

```bash
$ tree

./
	`--- Vagrantfile
```

例
```bash
$ vagrant init bento/ubuntu-18.04

A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
```


### Vagrantfileの編集
あとで詳しく



### 仮想マシン起動
Vagrantfileのあるディレクトリで、以下のコマンドを実行するとVagrantが起動する

Vagrant起動=VirtualBoxの仮想マシン起動

```bash
$ vagrant up
```

### 仮想マシンの状態を確認
Vagrantの起動状態を以下のコマンドで確認できる

```bash
$ vagrant status
```

起動している場合
```bash
default		running (virtualbox)
```

停止している場合
```bash
default		poweroff (virtualbox)
```


### 仮想マシンにsshログイン
sshログインできる

```bash
$ vagrant ssh
```

user:vagrant, pass:vagrant

user:root, pass:vagrant


### 仮想マシン停止(vagrant halt)
haltで停止できる

```bash
$ vagrant halt
```


## ローカルに作成されるファイルの場所

### vagrant系
c:/Users/[ユーザー名]/.vagrant.d/boxes/

### virtualbox系
c:/Users/[ユーザー名]/VirtualBox VMs/


## 自前でboxを用意する方法
packerを使用する

packer hashicopeが提供しているツール

### 手順
まだやりかたわかってない


## refs
- [0](https://qiita.com/ozawan/items/160728f7c6b10c73b97e)
