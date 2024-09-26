return {

    {
        'xiyaowong/transparent.nvim',
        config = function ()
            vim.cmd[[TransparentEnable]]
        end

    },

    {
        'catppuccin/nvim',
        enabled = true,
        name = "catppuccin",

        config = function()
            require('catppuccin').setup({
                flavour = 'mocha',
                --flavour = "latte",
                transparent_background = vim.g.transparent_background,
            })
            vim.cmd.colorscheme "catppuccin"
        end,

    },

    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                --theme = 'catppuccin',
                theme = 'auto',
            },
        },
        dependencies = {
            { 'nvim-tree/nvim-web-devicons', lazy = true, },
            { 'catppuccin/nvim' },
        },
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        keys = {
            {"<leader>ee", "<CMD>Neotree filesystem reveal current toggle<CR>", desc = "explore file"},
            --{"<leader>eb", "<CMD>Neotree buffers current toggle<CR>", desc = "explore buffer"},
        },

        dependencies = {
            {"nvim-lua/plenary.nvim", lazy = true},
            {"nvim-tree/nvim-web-devicons",lazy = true}, -- not strictly required, but recommended
            {"MunifTanjim/nui.nvim",lazy = true},
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

}
