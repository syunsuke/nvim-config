return {

    -------------------------------
    -- mason.nvimの設定
    -------------------------------
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        opts = {
                ui = {border = "rounded",
                      width = 0.8, height = 0.8,
                     },
                },
    },

    -------------------------------
    -- mason-lspconfig.nvimの設定
    -------------------------------
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
        opts = {
                ensure_installed = { "lua_ls",  "clangd" },

                -- mason-lspconfig.setup_handorersを使う場合は
                -- automatic_installationをしないようにする
                -- (どちらか択一的に使うのが良いと思う) 
                automatic_installation = false,
                }
    },

    -------------------------------
    -- nvim-lspconfigの設定
    -------------------------------
    {
        'neovim/nvim-lspconfig',
        -- mason_lspconfigとの連携がある場合、読みこみのタイミングに注意
        -- (automatic_installation = trueの時等)
        -- event = { "BufReadPre", "BufNewFile" },

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
            -- 但し、haskell-tools.nvimを使う場合、lspconfigの設定は使わない
            lspconfig.hls.setup {
                -- GHCupで準備したHLSの名前
                cmd = {"haskell-language-server-wrapper", "--lsp"}
            }

        end -- Config end
    },

    -- Haskellに特化したLSP設定プラグイン
--    {
--        'mrcjkb/haskell-tools.nvim',
--        version = '^4', -- Recommended
--        lazy = false, -- This plugin is already lazy
--    },

    -- Lspsagaの設定
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        enabled = true,
        config = function()
            require('lspsaga').setup({})

            vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
            vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<CR>')
            vim.keymap.set('n', 'ga', '<cmd>Lspsaga code_action<CR>')

        end,
    },


}
