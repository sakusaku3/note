# pythonで機械学習 環境構築

## pyenvインストール

### gitのinstall

```bash
sudo apt -y update
sudo apt -y install git
```

### pyenvのinstall

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

```bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.profile
```

```bash
# 再読込
source ~/.profile
```

### 確認

```bash
$ which pyenv
/home/USERNAME/.pyenv/bin/pyenv
```

### refs
[ref](https://qiita.com/shigechioyo/items/198211e84f8e0e9a5c18)



## 各ライブラリインストール
```bash
sudo pip install numpy scipy matplotlib ipython scikit-learn pandas pillow
```


## jupyterをリモートサーバで実行

### リモートでの操作
#### jupyterインストール
```bash
sudo pip install jupyter
```

#### jupyterログインパス設定
```bash
$ ipython

In [1]: from notebook.auth import passwd

In [2]: passwd()
Enter password: [パスワードを入力]
Verify password: [パスワードを再度入力]
Out[2]: 'sha1: [ハッシュ化されたパスワード]'
```

#### 外部接続用の設定ファイルを作成

```bash
$ mkdir ~/.jupyter
$ vim ~/.jupyter/jupyter_notebook_config.py
```

```py
c = get_config()

# notebook上でplotを表示できるようにする
c.IPKernelApp.pylab = 'inline'
# 全てのIPから接続を許可
c.NotebookApp.ip = '*'
# IPython notebookのログインパスワード
c.NotebookApp.password = 'sha1:[ハッシュ化されたパスワード]'
# 起動時にブラウザを起動させるかの設定
c.NotebookApp.open_browser = False
# ポート指定
c.NotebookApp.port = [接続ポート]
```

#### jupyter起動

```bash
$ jupyter notebook
```

接続先のURLが表示される
[I ...] http;//[ip]:[port]/


#### jupyter立ち下げ
ctrl + c


### ローカル操作
表示されたURLにアクセスする
設定したパスを入力してログインすれば使える


### 参考
[ref0](https://qiita.com/syo_cream/items/05553b41277523a131fd)
[ref1](https://qiita.com/joemphilips/items/de5d12723b9b88b5b090)

---

## 各インストール
apt install python3-pip
apt update
apt install python3.6
wget https://bootstrap.pypa.io/get-pip.py
python3.6 get-pip.py



## matplot使えなかった
tkinterがないって言われた
https://qiita.com/4hiziri/items/aba80f0bc92300ea22e2

apt install tk-dev

## vim設定


## nodejs, npm
https://qiita.com/kerupani129/items/60ee8c8becc2fe9f0d28
apt update
apt install nodejs
apt install npm


## jupyterをリモートサーバで実行
https://qiita.com/joemphilips/items/de5d12723b9b88b5b090
pip install jupyter




