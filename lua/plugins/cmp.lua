return {

    -- mason.nvimの設定
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',  -- masonをアップデート
        config = function()
            require("mason").setup()
        end
    },

    -- mason-lspconfig.nvimの設定
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls",  "clangd" },
                automatic_installation = true,
            })
        end
    },

    -- nvim-lspconfigの設定
    {
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lspconfig = require('lspconfig')
            local mason_lspconfig = require('mason-lspconfig')

            mason_lspconfig.setup_handlers {
                -- デフォルトのLSPサーバー設定
                function(server_name)
                    lspconfig[server_name].setup{}
                end,

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
                end,
            }
        end
    },

    -- Lspsagaの設定
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({
                ui = {
                    code_action = '*',
                    --code_action = '',
                    --code_action = '',
                },
            })
            --vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
            vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<CR>')
            vim.keymap.set('n', 'ga', '<cmd>Lspsaga code_action<CR>')

        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        }
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

    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'rinx/cmp-skkeleton' },

    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },

    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",

        config = function()
            local cmp = require 'cmp'

            cmp.setup({

                snipet = {
                    expand = function(args)
                        --vim.fn["vsnip#anonymous"](args.body)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },

                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end,

                    ['<S-Tab>'] = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end,

                    ['<C-l>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),

                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'skkeleton' },
                }, {
                    { name = 'buffer' },
                    { name = 'path' },
                }),

                view = {
                    entries = 'native',
                },

            })

        end,
    },
}


