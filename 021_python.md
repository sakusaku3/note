# vagrantパブリックネットワーク設定

## コマンドラインパーサー
- sys.argv
- argparse
- docopt

```py
from argparse import ArgumentParser
```

## ファイルアクセス

withでclose処理を省略デキル

```py
#!/usr/bin/env python
#coding:utf-8

import sys

with open('test1.txt') as lines:
    for line in lines:
        text = line.rstrip('\r\n')
        print(text, end='')
```

### 参考
- [with使い方](https://www.sejuku.net/blog/24672)


## 文末の改行文字を消す

```py
text.rstrip('\r\n')
```

### 参考
- [文末改行消す](http://ytyaru.hatenablog.com/entry/2017/09/13/000000)


## print
python3だとprint(text, end='')が使えるがpython2.x系は使えない
そのときは以下の構文を先頭で宣言すればprint関数が上書きされる

```py
from __future__ import print_function
```



## 参考
- [公式](https://www.vagrantup.com/docs/networking/public_network.html)
- [ネットワークのデフォルトゲートウェイの設定](https://qiita.com/koara-local/items/d1e2092d5c5fc6d1739f)
- [Box起動後、ネットワークのGatewayが設定されない](https://kurosuke.jp/program/579)
- [Vagrant NATを使わないでみる](https://qiita.com/mogetarou/items/7da1111a0d9147a95b11)
- [Windows+VirtualBox+Vagrant](https://www.serotoninpower.club/archives/188)
