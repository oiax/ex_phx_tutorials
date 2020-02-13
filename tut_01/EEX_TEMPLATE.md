# EExテンプレート

## PhoenixとRails: ディレクトリ構造の違い

| | Phoenix | Rails |
| --- | ---- | ---- |
| ルーティング | `lib/big_gate_web/router.ex` | `config/routes.rb` |
| コントローラ | `lib/big_gate_web/controllers` | `app/controllers` |
| テンプレート | `lib/big_gate_web/templates` | `app/views` |

## 【演習】

コミット [3f742ab](https://github.com/oiax/ex_phx_tutorials/commit/3f742abe169fb801fc4a60545a099ad4791a1356) を適用。

ブラウザで `http://localhost:4000/hello/alice` を開き、「Hello, alice!」と表示されることを確認。

## 【解説】

```elixir
  def hello(conn, params) do
    render(conn, "hello.html", name: params["name"])
  end
```

```html
<p>Hello, <%= @name %>!</p>
```

関数 `render/3` の `name` オプションには、パラメータ `name` の値である `"alice"` が指定される。
この文字列が、EExテンプレートの中では `@name` で参照できる。

> `@name` は Ruby のインスタンス変数のように見えるが、実際には「マクロ」であり、関数呼び出しに展開される。

## ビューモジュール

Phoenix では `lib/big_gate_web/views` ディレクトリにある「ビューモジュール」が重要な役割を果たす。Rails のヘルパーモジュールと似ているが、コントローラごとに独立している点と省略できない点で異なる。

ビューモジュールの中で定義された関数はEExテンプレートの中から呼び出せる。

## 【演習】

コミット [2e45e53](https://github.com/oiax/ex_phx_tutorials/commit/2e45e53799fb1fe5f631fd44693d28db57791fff) を適用。

ブラウザで `http://localhost:4000/hello/alice` を開きなおし、「Hello, Alice!」のように名前の先頭が大文字になっていることを確認する。
