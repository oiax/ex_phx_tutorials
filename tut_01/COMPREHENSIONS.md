# リスト内包表記

## 関数 `BigGate.Core.fetch_users/0`

コミット [1d4ffe1](https://github.com/oiax/ex_phx_tutorials/commit/1d4ffe130dd8251c3c3d6249498636d57c30309b) を適用。

* `BigGate.Core.User.fetch_all/0` のような関数を定義したくなるが、スキーマモジュールに `changeset/2` 以外の関数を定義するのは悪手。コードの再利用性が低くなる。Elixirのモジュールでは「継承」が使えない。
* アプリケーションの開発が進むと `BigGate.Core` モジュールに属する関数の数が多くなるが、気にしない。

> Ectoの使い方はこのチュートリアルの本題ではないので、ソースコードに関する説明は省略。

## アクション `page/user_list`

コミット [932d77a](https://github.com/oiax/ex_phx_tutorials/commit/932d77a70a0f3b4b0e6cbb18dac4ef4cb916372d) を適用。

ブラウザで `http://localhost:4000/user_list` を表示。

```html
<ul>
  <%= for user <- @users do %>
    <li>
      <%= user.name %>
      (<%= user.email %>)
    </li>
  <% end %>
</ul>
```

`@users` にセットされているリストの要素をひとつずつ順に変数 `user` にセットしつつ `do ... end` を繰り返す。

この構文をリスト内包表記（list comprehensions）と呼ぶ。
