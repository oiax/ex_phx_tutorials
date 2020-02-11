# マップ

## マップとは

マップはキーと値のペアを要素として持つ集合である。他のプログラミング言語で連想配列、辞書、ハッシュなどと呼ばれるものと類似している。

リストと異なり、要素に順序はない。この点でRubyのマップと異なる。

キーおよび値となる項の型に制限はない。次のようにキーと値を `=>` で連結し、各要素間をコンマで区切り、全体を `%{}` で囲んで記述する。

```elixir
%{"red" => 0, "green" => 1, "blue" => 2}
```

キーがアトムである場合は、`:key => value` の代わりに `key: value` と短縮できる。次の2つのマップは同値である。

```elixir
%{:red => 0, :green => 1, :blue => 2}
%{red: 0, green: 1, blue: 2}
```

マップを値として持つマップを作ることもできる。

```elixir
%{colors: %{red: 0, green: 1, blue: 2}, sizes: %{small: 0, large: 1}}
```

## 【参考】 HAMT

Elixirのマップは要素数が32以下のとき、内部的には配列として表現される。要素数が33以上の場合は、Hash-Array Mapped Trie（HAMT）と呼ばれるデータ構造が用いられる。

このデータ構造を用いると、あるマップ `M` に新たなキーと値のペアを加えて、新しいマップ `N` を作る際に、`M` のデータの一部を `N` で再利用できる。つまり、`N` の全体を新たに作り直す必要がなく、メモリ効率がよい。

HAMTはJavaScriptライブラリの[immutable.js](https://immutable-js.github.io/immutable-js/)で使われている。

HAMTの仕組みはかなり複雑であるが、次の解説記事（英語）が比較的わかりやすい。

https://medium.com/@dtinth/immutable-js-persistent-data-structures-and-structural-sharing-6d163fbd73d2
