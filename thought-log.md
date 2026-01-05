- 本: 思考のエンジン
- neovimで標準の折りたたみ機能を使う
  - https://qiita.com/reisuta/items/ebd71e9cade3a858d4f9
  - 使いたい時だけ使えるように、luaスクリプトを用意する

「cd しない派（絶対パス運用）」の王道実装

方針
cd 一切しない
すべて $PROJECT_ROOT 起点
副作用ゼロ（親シェルに影響なし）
CI / ローカル / 別ディレクトリ実行すべて同一挙動

---

全体構成（cdしない派）

project-root/
├─ go.mod
├─ Makefile
├─ scripts/
│  ├─ lib/
│  │  └─ project_root.sh
│  ├─ build.sh
│  ├─ test.sh
│  └─ lint.sh
└─ ...


---

1️⃣ 共通ライブラリ（cdしない前提）

scripts/lib/project_root.sh

#!/usr/bin/env bash
set -euo pipefail

ROOT_MARKERS=(
  "go.mod"
  ".git"
)

find_project_root() {
  local dir="$1"

  while [[ "$dir" != "/" ]]; do
    for marker in "${ROOT_MARKERS[@]}"; do
      if [[ -e "$dir/$marker" ]]; then
        echo "$dir"
        return 0
      fi
    done
    dir="$(dirname "$dir")"
  done

  return 1
}

# このライブラリ自身の場所
LIB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 呼び出し元スクリプトの場所（lib/ の1つ上を想定）
SCRIPT_DIR="$(cd "$LIB_DIR/.." && pwd)"

PROJECT_ROOT="$(find_project_root "$SCRIPT_DIR")" || {
  echo "❌ project root not found (markers: ${ROOT_MARKERS[*]})" >&2
  exit 1
}

export PROJECT_ROOT

📌 ポイント

cd は subshell でのみ使用（作業ディレクトリは変わらない）

PROJECT_ROOT 以外は export しない

呼び出し側がどこから実行されても安全



---

2️⃣ build スクリプト（絶対パスのみ）

scripts/build.sh

#!/usr/bin/env bash
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/project_root.sh"

echo "📦 build at $PROJECT_ROOT"

go build "$PROJECT_ROOT/..."


---

3️⃣ test / lint も同様

scripts/test.sh

#!/usr/bin/env bash
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/project_root.sh"

go test "$PROJECT_ROOT/..."

scripts/lint.sh

#!/usr/bin/env bash
set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/project_root.sh"

golangci-lint run "$PROJECT_ROOT/..."


---

4️⃣ Makefile / CI（そのまま）

build:
	./scripts/build.sh

- run: ./scripts/build.sh


---

cdしない派のメリット（実務的）

✔ 親シェルの状態を汚さない
✔ 他スクリプトから source しても安全
✔ 並列実行で事故らない
✔ bash / make / CI 混在に強い


---

よくある疑問への回答

Q. go build "$PROJECT_ROOT/..." って問題ない？

👉 問題なし（公式対応）
Go ツールチェーンはパス指定前提で設計されている。


---

Q. 相対パスでファイル参照したい場合は？

CONFIG="$PROJECT_ROOT/config/app.yaml"


---

Q. 一部だけ cd したい処理は？

(
  cd "$PROJECT_ROOT/tools"
  ./gen.sh
)

👉 subshell に閉じ込める（cdしない派の流儀）


---

OSSで実際に見かけるキーワード

PROJECT_ROOT

REPO_ROOT

ROOT_DIR

SCRIPT_DIR
👉 ほぼこの命名
---

まとめ（この形が「cdしない派」の完成形）

root 探索は共通化

実行ディレクトリに依存しない

絶対パスのみ

cd は subshell 限定
