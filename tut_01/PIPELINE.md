# パイプライン演算子

## 【演習】

新規ファイル `lib/gamma.ex` を次の内容で作成する。

```elixir
defmodule Gamma do
  def transform(str) do
    a = String.trim(str)
    b = String.downcase(a)
    c = String.reverse(b)
    IO.inspect(c)
  end
end
```

> `String.trim/1` は文字列の先頭と末尾から連続する空白を取り除く。
> `String.downcase/1` は文字列に含まれる大文字のアルファベットを小文字に変換する。
> `String.reverse/1` は文字列全体を逆転させる。

実行。

```bash
$ mix run -e 'Gamma.transform(" xYz ")'
```

```
Compiling 2 files (.ex)
Generated alpha app
"zyx"
```

## 【演習】

ファイル `lib/gamma.ex` を次のように書き換える。

```elixir
defmodule Gamma do
  def transform(str) do
    c =
      str
      |> String.trim()
      |> String.downcase()
      |> String.reverse()

    IO.inspect(c)
  end
end
```

実行して結果が変わらないことを確かめる。

```bash
$ mix run -e 'Gamma.transform(" xYz ")'
```

```
Compiling 1 file (.ex)
"zyx"
```

## パイプライン演算子

* パイプライン演算子 `|>` は左辺の項を第1引数として右辺の関数を呼び出す。つまり、次のふたつは同値。
  - `String.trim(str)`
  - `str |> String.trim()`
* 右辺の関数が2個以上の引数を取る場合、右辺の関数呼び出しでは第1引数を取り除く。
  - `Foo.bar(x, y, z)`
  - `x |> Foo.bar(y, z)`
* ふたつ以上のパイプライン演算子を組み合わせるときに真価を発揮する。
  - `String.downcase(String.trim(str))`
  - `str |> String.trim() |> String.downcase()`

> 単独のパイプライン演算子の使用は推奨されていない。

## 【演習】

新規ファイル `lib/delta.ex` を次の内容で作成する。

```elixir
defmodule Delta do
  def transform(str) do
    a = String.trim(str)
    b = String.downcase(a)
    c = append(b, "@")
    IO.inspect(c)
  end

  defp append(str, char) do
    char <> str
  end
end
```

> `<>` は文字列と文字列を連結する演算子。

実行。

```bash
$ mix run -e 'Delta.transform(" xYz ")'
```

```
Compiling 1 file (.ex)
"@xyz"
```

【問題】 関数 `Delta.transform/1` をパイプライン演算子を使って書き換え、変数 `a` と `b` をソースコードから取り除いてください。

【答え】 [e07aa43](https://github.com/oiax/ex_phx_tutorials/commit/e07aa43831435d3686e71d0e04e6db82d1f3a62a)
