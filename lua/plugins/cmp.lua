return {

    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'rinx/cmp-skkeleton' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },

    -- nvim-cmp 補完の設定
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
                    -- 効果が不明
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

                -- ソースを登録
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'skkeleton' },
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


