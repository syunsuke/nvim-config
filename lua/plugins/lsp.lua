return {

    -------------------------------
    -- mason.nvimの設定
    -------------------------------
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',  -- masonをアップデート
        config = function()
            require("mason").setup()
        end
    },

    -------------------------------
    -- mason-lspconfig.nvimの設定
    -------------------------------
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
        config = function()
            require("mason-lspconfig").setup({
                -- 無い場合に自動でインストールする設定
                ensure_installed = { "lua_ls",  "clangd" },
                automatic_installation = true,
            })
        end
    },

    -------------------------------
    -- nvim-lspconfigの設定
    -------------------------------
    {
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lspconfig = require('lspconfig')
            local mason_lspconfig = require('mason-lspconfig')

            -->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            -- mason_lspconfigプラグインの機能で自動設定
            -->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            mason_lspconfig.setup_handlers {

                -- keyの無い一番初めの要素がデフォルトの
                -- ハンドラー関数になる
                function(server_name)
                    lspconfig[server_name].setup{}
                end,

                -- 二つ目以降はキーにランゲージサーバー名をとって
                -- 要素にハンドラー関数を定義
                ["lua_ls"] = function ()
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end, -- lua_ls end
            }

            -->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            -- masonの外にあるLanguage Server用
            -->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

            -- HaskellのHLSl
            lspconfig.hls.setup {
                -- GHCupで準備したHLSの名前
                cmd = {"haskell-language-server-wrapper", "--lsp"}
            }

        end -- Config end
    },

    -- Lspsagaの設定
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lspsaga').setup({
                ui = {
                    -- 表示がずれないアイコンフォントを探す
                    code_action = '*',
                    --code_action = '',
                    --code_action = '',
                },
            })

            vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
            vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<CR>')
            vim.keymap.set('n', 'ga', '<cmd>Lspsaga code_action<CR>')

        end,
    },

--    {
--        'mrcjkb/haskell-tools.nvim',
--        dependencies = {
--            'nvim-lua/plenary.nvim',
--        },
--        version = '^2', -- Recommended
--        ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
--        init = function()
--            vim.g.haskell_tools = {}
--        end,
--    },
--
}
