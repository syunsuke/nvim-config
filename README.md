# nvim-config

## 準備

シンボリックリンクを張る

```bash
ln -s /somewhere/nvim-config ~/.config/nvim
```

もちろん、リネームして移動してもよい。



## WSLで必要となるもの

WSLのUbuntuでは、以下のパッケージが必要となる。

```bash
sudo apt install build-essential fzf unzip skkdic skkdic-extra
```

また、denoのインストールが必要となる。

```bash
curl -fsSL https://deno.land/install.sh | sh
```

`~/.deno/bin`をPATHに入れる。


## リセット

パッケージが無い状態でプラグインを起動すると、後でパッケージを入れてもエラーが消えない事がある。
その場合、以下のディレクトリを消去する。(もう一度、プラグインを自動ダウンロードさせる)

- ~/.chash/nvim
- ~/.local/share/nvim
- ~/.local/state/nvim





