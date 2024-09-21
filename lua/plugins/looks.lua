return {

    {
        'catppuccin/nvim',
        enabled = true,
        name = "catputtin",
        event = "VeryLazy",
        priority = 1000,
        opts = {
            --flavour = mocha,
            flavour = "latte",
        },

        config = function()
            vim.cmd.colorscheme "catppuccin"
        end,

    },

    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                theme = 'catppuccin',
            },
        },
        event = "VeryLazy",
        priority = 1001,
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
}
