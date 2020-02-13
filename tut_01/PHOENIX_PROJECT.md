# Phoenixプロジェクト

## _mix phx.new_ のバージョン番号を確認

```bash
$ mix phx.new --version
```

```
Phoenix v1.4.12
```

## プロジェクト `big_gate` を作成

```bash
$ mix phx.new big_gate --database postgres
```

```
* creating big_gate/config/config.exs
* creating big_gate/config/dev.exs
* creating big_gate/config/prod.exs
(中略)
* creating big_gate/assets/css/phoenix.css
* creating big_gate/assets/static/images/phoenix.png
* creating big_gate/assets/static/robots.txt

Fetch and install dependencies? [Yn]
```

キーボードで `Enter` キーを押す。

```
* running mix deps.get
* running cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development
* running mix deps.compile
(中略)
You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server
```

## データベースを作る

```bash
$ cd big_gate
$ mix ecto.create
```

```
Compiling 13 files (.ex)
Generated big_gate app
The database for BigGate.Repo has been created
```

事前配布資料『Docker を用いたElixir/Phoenix 開発環境の構築手順』にしたがって環境構築した場合は、ここで次のようなエラーが出ます。

```
04:22:59.843 [error] GenServer #PID<0.343.0> terminating
** (DBConnection.ConnectionError) tcp connect (localhost:5432): connection refused - :econnrefused
    (db_connection) lib/db_connection/connection.ex:87: DBConnection.Connection.connect/2
    (connection) lib/connection.ex:622: Connection.enter_connect/5
    (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
Last message: nil
State: Postgrex.Protocol
** (Mix) The database for BigGate.Repo couldn't be created: killed
```

`config/dev.exs` を開き、`hostname` の値を `"localhost"` から `"db"` に書き換えて、`mix ecto.create` を実行してください。

## Phoenixサーバーの起動

```bash
$ mix phx.server
```

```
Compiling 13 files (.ex)
Generated big_gate app
[info] Running BigGateWeb.Endpoint with cowboy 2.7.0 at 0.0.0.0:4000 (http)
[info] Access BigGateWeb.Endpoint at http://localhost:4000

webpack is watching the files…

Hash: e4dc5f1f07a0b5c39430
Version: webpack 4.41.5
Time: 529ms
Built at: 2020-02-13 13:26:52
                Asset       Size       Chunks             Chunk Names
       ../css/app.css   10.6 KiB  ./js/app.js  [emitted]  ./js/app.js
       ../favicon.ico   1.23 KiB               [emitted]
../images/phoenix.png   13.6 KiB               [emitted]
        ../robots.txt  202 bytes               [emitted]
               app.js   8.23 KiB  ./js/app.js  [emitted]  ./js/app.js
Entrypoint ./js/app.js = ../css/app.css app.js
[0] multi ./js/app.js 28 bytes {./js/app.js} [built]
[../deps/phoenix_html/priv/static/phoenix_html.js] 2.21 KiB {./js/app.js} [built]
[./css/app.css] 39 bytes {./js/app.js} [built]
[./js/app.js] 493 bytes {./js/app.js} [built]
    + 2 hidden modules
Child mini-css-extract-plugin node_modules/css-loader/dist/cjs.js!css/app.css:
    Entrypoint mini-css-extract-plugin = *
    [./node_modules/css-loader/dist/cjs.js!./css/app.css] 436 bytes {mini-css-extract-plugin} [built]
    [./node_modules/css-loader/dist/cjs.js!./css/phoenix.css] 10.9 KiB {mini-css-extract-plugin} [built]
        + 1 hidden module
```

この状態になったら、ブラウザで `http://localhost:4000` を開く。

## Phoenixサーバーの停止

ターミナル上で `Ctrl-C` を2回入力する。
