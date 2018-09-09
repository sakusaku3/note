# linuxとwindowsのディレクトリ対応

## 自作アプリの置き場

/usr/local/bin/
実行ファイル一本のアプリを展開するとき


/opt/
ディレクトリ構造を持ったアプリを展開するとき



## 対応表

| Windows|働き| UNIX |
|:-----------|:------------|:------------|
| レジストリ|Windowsのシステム設定・各種ソフトウェアの動作設定はレジストリに保存するのが一般的だが、UNIX系ではソフトウェアごとのテキストベース設定ファイルに保存するのが一般的。| /etc|
|C:\Windows\System32\drivers\etc|WindowsにもUNIX由来の設定ファイルがあるのでそれ用のディレクトリ…といってもほとんどの開発者にとってはhosts格納専用でしょう。| /etc|
|C:\Windows|コマンド。/binは一般ユーザ用で/sbinは管理用。/usr配下のはこれらの別名のことが多いが、独立していてオプショナルなコマンドを格納している構成もある。ここをいじっていいのはパッケージマネージャだけ。|/bin, /sbin, /usr/bin, /usr/sbin|
|C:\Windows\System32|共有ライブラリ。ここをいじっていいのはパッケージマネージャだけ。|/lib|
|C:\Windows\System32\drivers|ドライバ。UNIX系ではカーネルモジュールの一種としてドライバを位置づける。|/lib/modules/【OSバージョン】|
|C:\Program Files\Common Files|ユーザがインストールした共有ライブラリ|/usr/local/lib|
|C:\Program Files|ユーザがインストールしたプログラム。ディレクトリを作る。|/opt|
|（該当なし。ユーザーが自分で格納用ディレクトリを作ることが多い）|ユーザがインストールしたプログラム。ディレクトリを作らない単体のもの。|/usr/local/bin|
|C:\Users\【ユーザー名】|ユーザーのホームディレクトリ。UNIXでは管理者だけ/home以下でなく/rootというホームディレクトリを持つ。|/home/【ユーザー名】, /root|
|（ユーザーの）スタートアップ<br/><br/>とても深いディレクトリ。コマンド`shell:startup`で開けます。@tukiyo3 さんより|ログイン時に実行されるプログラム。Windowsではショートカットを集めたフォルダだがUNIXではスクリプトファイル。|/home/【ユーザー名】/.bash_profile, .bash_login, .profile<br/>このほか、シェルプログラム起動のたびに実行される .bashrc 。も|
|（全員の）スタートアップ|〃|/etc/profile|
|コントロール パネル\システム\システムの詳細設定\環境変数|DOS時代はAUTOEXEC.BATで設定していた環境変数をWindowsではコントロールパネルで設定するようになりましたが、UNIXではDOSと同じく起動スクリプトで設定します。<br/>注意点としてUNIXの環境変数はDOS/Windowsのものと違い、明示的にexportしたものしか子プロセスに引き継がれません。|/home/【ユーザー名】/.bash_profile, .bash_login, .profile,<br/>/etc/profile|
|C:\Users\【ユーザー名】\AppData\Roaming, Local, LocalLow|アプリが作るデータディレクトリ。WindowsではAppData以下に作られるが、UNIX系ではホームディレクトリ直下。.config以下に作る場合も。|/home/【ユーザー名】,<br/>/home/【ユーザー名】/.config|
|C:\ProgramData|サービスのデータ・ログ|/var|
|C:\inetpub|Webコンテンツ|/var/www|
|C:\Windows\Temp,<br/>C:\Users\【ユーザー名】\AppData\Local\temp|一時ファイル置き場。自動削除はされない。消えてるとしたら誰かがタイマーで消している。|/var/tmp|

## refs
- [ref0](https://qiita.com/yuba/items/669f718fe6e62dbaab19)
