return {

    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
            require('telescope').setup({
                pickers = {
                },

            })

            require('telescope').load_extension('fzf')

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'files' })
            vim.keymap.set('n', '<leader>fv', function() builtin.find_files({cwd = vim.fn.stdpath("config")})end, { desc = 'neovim config' })
            vim.keymap.set('n', '<leader>fm', function() builtin.marks({mark_type = "global"})end, { desc = 'marks' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'buffers' })
            --vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'marks' })
            vim.keymap.set("n", "<leader>ts", "<cmd>Telescope treesitter<CR>", { desc = "TS symbols (buffer)" })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'help tags' })

            vim.keymap.set("n", "<leader>ls",
                function()
                    require("telescope.builtin").lsp_document_symbols {
                        symbols = { "function", "method", "class" }
                    }
                end,
                { desc = "LSP symbols (buffer) - fn/class only" }
            )
            vim.keymap.set("n", "<leader>lw",
                function()
                    require("telescope.builtin").lsp_workspace_symbols {
                        query = "",  -- 空でもOK。後でTelescope側で絞り込み
                        symbols = { "function", "method", "class" },
                    }
                end,
                { desc = "LSP symbols (workspace)" }
            )
        end,
    }
}


