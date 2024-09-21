return {
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = true,
        build = ":TSUpdate", -- treesitterの更新を自動で行う
        event = { "BufReadPost", "BufNewFile" }, -- ファイル読み込み時に読み込む
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { "lua", "haskell", "rust", "vim", "vimdoc" }, -- 必要な言語のパーサーをインストール
                highlight = {
                    enable = true, -- シンタックスハイライトを有効化
                },
                indent = {
                    enable = true, -- インデントのサポートを有効化
                },
            })
        end,
    }
}


