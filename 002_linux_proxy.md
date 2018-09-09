# プロキシ設定

## 設定ファイル


/etc/profile.d/proxy.sh

```sh
# プロキシ設定 ==============================================
USERNAME="<USERNAME>"       # 認証が必要なプロキシの場合
PASSWORD="<PASSWORD>"       # 認証が必要なプロキシの場合
HOST="<HOST>"
PORT="<PORT>"

# 認証が必要なプロキシの場合
PROXY="$USERNAME:$PASSWORD@$HOST:$PORT"

# 認証が不要なプロキシの場合
PROXY="$HOST:$PORT"

# 実際の環境変数の設定
export http_proxy="http://$PROXY"
export https_proxy="https://$PROXY"
export ftp_proxy="ftp://$PROXY"

# 大文字バージョンしか認識しないプログラム用
export HTTP_PROXY="http://$PROXY"
export HTTPS_PROXY="https://$PROXY"
export FTP_PROXY="ftp://$PROXY"

# プロキシを利用しないアドレスの指定（必須）
export no_proxy="127.0.0.1,localhost"
export NO_PROXY="$no_proxy"

```


## refs
- [ref0](https://lambdalisue.hatenablog.com/entry/2013/06/25/140630)
- [ref1](http://fj.hatenablog.jp/entry/2014/08/20/204554)

