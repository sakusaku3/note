# ウィンドウ起動～終了時までのイベント

| No. | イベント | 説明 |
|:-:|:--|:--|
|1| [**SourceInitialized**<br/>(Window)](https://msdn.microsoft.com/ja-jp/library/system.windows.window.sourceinitialized.aspx)  |   |
|2| [**Activated**<br/>(Window)](https://msdn.microsoft.com/ja-jp/library/system.windows.window.activated.aspx)  | ウィンドウがフォアグラウンド ウィンドウになったとき<br/>※アクティブ化しないで表示する場合は発生しない  |
|3| [**Loaded**<br/>(FrameworkElement)](https://msdn.microsoft.com/ja-jp/library/system.windows.frameworkelement.loaded.aspx)  | 要素のレイアウトやレンダリングが完了し、操作を受け入れる準備が整ったとき  |
|4|  [**ContentRendered**<br/>(Window)](https://msdn.microsoft.com/ja-jp/library/system.windows.window.contentrendered.aspx) |  ウィンドウのコンテンツがレンダリングされた後<br/>※ウィンドウにコンテンツを含む場合に発生 |
|5| [**Closing**<br/>(Window)](https://msdn.microsoft.com/ja-jp/library/system.windows.window.closing.aspx)  | Closeが呼び出された直後<br/>※ウィンドウを閉じるのをキャンセルできる  |
|6| [**Deactivated**<br/>(Window)](https://msdn.microsoft.com/ja-jp/library/system.windows.window.deactivated.aspx)  | ウィンドウが背景ウィンドウになったとき  |
|7| [**Closed**<br/>(Window)](https://msdn.microsoft.com/ja-jp/library/system.windows.window.closed.aspx)  | ウィンドウが閉じるとき  |

## 参考サイト
- [ウィンドウ起動～終了時のイベント](https://qiita.com/Kosen-amai/items/e13f82ba114e82161b76)
