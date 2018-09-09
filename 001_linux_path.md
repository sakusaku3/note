# 環境変数

## ログイン時(実行順)
1. /etc/profile
1. /etc/profile/profile.d	(ディレクトリ .shが全て実行される)
1. ~/.bash_profile
	上のファイルがなければ
	1. ~/.bash_login
	1. ~/.profile
1. ~/.bashrc
1. /etc/bashrc
1. bash実行

全ユーザーにPATHを追加するとき
	profile.dに.shファイルを追加するといい

特定のユーザーにPATHを追加するとき
	/.bash_profileに追加するといい


## ログアウト時
1. ~/.bash_logout


## PATHの確認方法

```bash
echo $PATH
```


## コマンド格納場所
1. /bin		基本コマンド
1. /sbin		管理者用コマンド
1. /usr/bin		アプリケーションで利用する基本コマンド
1. /usr/sbin		アプリケーションで利用する管理者用コマンド
1. /usr/local/bin		追加したソフトやパッケージ用のコマンド
1. /usr/local/sbin		追加した管理者用のコマンド
1. /home/<USER>/bin		ユーザーが追加したコマンド



## refs
- [ref0](https://oxynotes.com/?p=5418)
- [ref1](https://qiita.com/yunzeroin/items/480a3a677f78a57ac52f)
- [ref2](https://qiita.com/bokotomo/items/674e06da84c921f5407a)


