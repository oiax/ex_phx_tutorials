# Mixプロジェクト

## _mix_ のバージョン番号を確認

```bash
$ mix --version
```

```
Erlang/OTP 22 [erts-10.6.4] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe]

Mix 1.10.0 (compiled with Erlang/OTP 21)
```

## プロジェクト alpha を作成

```bash
$ mix new alpha
```

```
* creating README.md
* creating .formatter.exs
* creating .gitignore
* creating mix.exs
* creating lib
* creating lib/alpha.ex
* creating test
* creating test/test_helper.exs
* creating test/alpha_test.exs

Your Mix project was created successfully.
You can use "mix" to compile it, test it, and more:

    cd alpha
    mix test

Run "mix help" for more commands.
```

## ソースコードを眺める

* [alpha/mix.exs](https://github.com/oiax/ex_phx_tutorials/blob/8d4d932fca96882ece43e9927b8ff9ee0261d3af/tut_01/alpha/mix.exs)
* [alpha/lib/alpha.ex](https://github.com/oiax/ex_phx_tutorials/blob/8d4d932fca96882ece43e9927b8ff9ee0261d3af/tut_01/alpha/lib/alpha.ex)
* [alpha/test/alpha_test.exs](https://github.com/oiax/ex_phx_tutorials/blob/8d4d932fca96882ece43e9927b8ff9ee0261d3af/tut_01/alpha/test/alpha_test.exs)

> Elixirソースコードの拡張子には `.ex` と `.exs` がある。両者とも「バイトコード」にコンパイルされ、仮想マシン上で実行される点は同じ。前者はバイトコードがファイルに書き込まれるが、後者はそうではない。

## _iex_ コンソールから関数を呼び出す

_iex_ コンソールを起動:

```bash
$ cd alpha
$ iex -S mix
```

_iex_ コンソール上で関数 `Alpha.hello/0` を呼び出す:

```
> Alpha.hello()
:world
```

> Elixir では関数名を `Alpha.hello/0` のように記述する。`Alpha` は「モジュール」、`hello` は「関数名」、`0` は「アリティ（引数の個数）」。モジュールについては後述するが、とりあえず関数の分類と考えればよい。

`Ctrl-C` を2回入力して _iex_ を終了する。

## テストを実行

```bash
$ mix test
```

```
Compiling 1 file (.ex)
Generated alpha app
..

Finished in 0.03 seconds
1 doctest, 1 test, 0 failures

Randomized with seed 11186
```

## _mix run_ コマンドで関数を呼び出す

```bash
$ mix run -e "Alpha.hello()"
```

```
Compiling 1 file (.ex)
Generated alpha app
```

> `alpha` というアプリケーションのビルドに成功したことが分かる。しかし、ターミナルに `:world` とは表示されない。

## 関数 `Alpha.print/0` を追加

* コミット [125419c](https://github.com/oiax/ex_phx_tutorials/commit/125419ccc94508b90d0f624e990ad9762c0d43cb#diff-25ef34b84bed6edf830eb2d118202705) を適用。

```bash
$ mix run -e "Alpha.print()"
```

```
Compiling 1 file (.ex)
:world
```
