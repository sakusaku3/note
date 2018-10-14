# ネットワークトラブルシューティング

## 基本の考え方
ネットワークでトラブルが発生した場合は、OSI参照モデルの低レイヤーから確認する。

1. 物理的につながっているか
2. 土台となるプロトコルが正常か
3. ポートは空いているか
4. 通信内容に不審な点はないか


## トラブルシューティングをする際に確認すべき項目
- ログの確認
- ping疎通の確認
- Telnet、SSH コマンドによるTCP通信の確認
- lsofコマンドによるポートの状況の確認
- 通信内容の確認


## トラブル切り分けに必須のコマンド
レイヤーとコマンドの対応表

|レイヤー|名称|コマンド|
|:---|:---|:---|
|7|アプリケーション層|telnet|
|6|プレゼンテーション層|telnet|
|5|セッション層|telnet|
|4|トランスポート層|telnet|
|3|ネットワーク層|ping, traceroute, show ip route
|2|データリンク層|show interfaces, show cdp neighbors|
|1|物理層|show interfaces, show cdp neighbors|


## 各種設定確認(ubuntu)
### ip確認
ubuntu

```bash
$ ifconfig
```

### デフォルトゲートウェイ
ubuntu

```bash
ip route show
``` 

### DNSサーバー
ubuntu

```bash
cat /etc/resolv.conf
``` 



## 参考
- [ネットワーク障害時のトラブルシューティング](https://avinton.com/blog/2017/10/linux-network-troubleshooting/)
- [ネットワークにつながらない時に確認する4つの手順Linux](http://sc.ipsecdh.net/entry/710)
- [トラブルの切り分けに有効なコマンドは？](https://tech.nikkeibp.co.jp/it/article/COLUMN/20090817/335639/)
- [クライアントからサーバーに対してネットワークが繋がらない場合の確認方法メモ](https://qiita.com/toshihirock/items/7b42c1b6e2d2eae11533)
- [ictsc:トラコン](https://icttoracon.net/)
