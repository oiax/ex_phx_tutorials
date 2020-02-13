# データベースマイグレーション

## スキーマ `Core.User` の生成

```bash
$ mix phx.gen.schema Core.User core_users
```

```
* creating lib/big_gate/core/user.ex
* creating priv/repo/migrations/20200213130219_create_core_users.exs

Remember to update your repository by running migrations:

    $ mix ecto.migrate
```

## データベーステーブル `core_users` にフィールドを追加

コミット [93a789b](https://github.com/oiax/ex_phx_tutorials/commit/93a789b424b2e5126a2311cdac31a35dff5c6abe) を適用。

```bash
$ mix ecto.migrate
```

```
Compiling 1 file (.ex)
Generated big_gate app

22:07:31.849 [info]  == Running 20200213130219 BigGate.Repo.Migrations.CreateCoreUsers.change/0 forward

22:07:31.851 [info]  create table core_users

22:07:31.859 [info]  create index core_users_name_index

22:07:31.863 [info]  == Migrated 20200213130219 in 0.0s
```

## モジュール `BigGate.Core.User` にフィールドを追加

コミット [05dfa6b](https://github.com/oiax/ex_phx_tutorials/commit/05dfa6b41a433c5e241d230917cb831c57e6eec1) を適用。

## シードデータを投入

コミット [07b5796](https://github.com/oiax/ex_phx_tutorials/commit/07b5796fc7ab3634167950d1ba5e4fe4dd0fbf57) を適用。

```bash
$ mix run priv/repo/seeds.exs
```

```
[debug] QUERY OK source="core_users" db=0.4ms decode=0.8ms queue=0.5ms idle=7.0ms
DELETE FROM "core_users" AS c0 []
[debug] QUERY OK db=4.2ms queue=0.7ms idle=30.9ms
INSERT INTO "core_users" ("email","name","inserted_at","updated_at") VALUES ($1,$2,$3,$4) ...
(省略)
```

## レコードの件数を調べる

```bash
$ iex -S mix
```

```
> BigGate.Repo.aggregate(BigGate.Core.User, :count)
[debug] QUERY OK source="core_users" db=1.0ms decode=1.5ms queue=1.1ms idle=9031.8ms
SELECT count(*) FROM "core_users" AS c0 []
3
```
