# nvim-config

![Image](https://github.com/user-attachments/assets/817633a7-bd37-4fb1-9a81-46266f50ce91)

## Neovimをはじめて設定する

(はじめてじゃない場合は、下記の**リセット**も見て下さい。)

リポジトリをcloneしたり、ダウンロードしたりします。


```bash
git clone https://github.com/syunsuke/nvim-config.git
```

`~/.config/nvim`に置きます。

```bash
mv /somewhere/nvim-config ~/.config/nvim
```


## WSLで必要となるもの

WSLのUbuntuでは、以下のパッケージが必要です。

```bash
sudo apt install build-essential fzf unzip skkdic skkdic-extra
```

また、denoのインストールが必要です。

```bash
curl -fsSL https://deno.land/install.sh | sh
```

`~/.deno/bin`を`~/.zshrc`等で環境変数PATHに入れる。


## リセット

以前にneovimを利用していて設定等がよくわからなくなったので、新たに初めからやりなおしたい場合。次のふたつを行ないます。


1. 設定のバックアップとして、`~/.config/nvim/`ディレクトリをコピーして何処か別の場所に置いておきます。
1. 次に以下のディレクトリを消去します。

- ~/.chash/nvim
- ~/.local/share/nvim
- ~/.local/state/nvim

これは、必要なUbuntuのパッケージが無い状態でプラグインを起動して、後でパッケージを入れてもエラーが消えない場合にも有効です。





