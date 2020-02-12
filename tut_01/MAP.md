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

## 要素の追加と更新

マップに要素を追加したり、既存のキーに対する値を入れ替えたりするには、関数 `Map.put/3` を使用する。

```elixir
m1 = %{"red" => 0, "green" => 1, "blue" => 2}
m2 = Map.put(m1, "black", 3)
m3 = Map.put(m2, "red", 4)
```

この結果、変数 `m3` は `%{"red" => 4, "green" => 1, "blue" => 2, "black" => 3}` というマップを参照することになる。

3行目は、次のような書き方も可能。

```elixir
m3 = %{m2 | "red" => 4}
```

しかし、2行目を次のように書き換えると例外 `KeyError` が発生する。

```elixir
m2 = %{m1 | "black" => 3}
```

```
** (KeyError) key "black" not found in: %{"blue" => 2, "green" => 1, "red" => 0}
    (stdlib 3.11.2) :maps.update("black", 3, %{"blue" => 2, "green" => 1, "red" => 0})
    (stdlib 3.11.2) erl_eval.erl:256: anonymous fn/2 in :erl_eval.expr/5
    (stdlib 3.11.2) lists.erl:1263: :lists.foldl/3
```

**【重要】** パイプ記号 `|` を用いた書き方は、既存のキーに対する値を入れ替えるときにしか使えない。

## 要素の削除

マップから要素を削除するには、関数 `Map.delete/2` を使用する。

```elixir
m1 = %{"red" => 0, "green" => 1, "blue" => 2}
m2 = Map.delete(m1, "red")
```

この結果、変数 `m2` は `%{"green" => 1, "blue" => 2}` というマップを参照することになる。

関数 `Map.delete/2` の第2引数に存在しないキーが与えられた場合、第1引数のマップがそのまま返される。

## 【演習】

* [577d815](https://github.com/oiax/ex_phx_tutorials/commit/577d815f395acdc7548bec6144106db63465b0bd) を適用。

```bash
$ mix run -e "Alpha.put_and_delete()"
```

```
Compiling 1 file (.ex)
%{"black" => 3, "blue" => 2, "red" => 4}
```
