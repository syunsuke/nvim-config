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
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find cwd' })
            vim.keymap.set('n', '<leader>fv', function() builtin.find_files({cwd = vim.fn.stdpath("config")})end, { desc = 'find neovim config' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'help tags' })
        end,
    }
}


