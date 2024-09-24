return {
    {
        'akinsho/toggleterm.nvim',
        cmd = "ToggleTerm",
        opts = {
            float_opt = {
                border = 'double',
            },
        },
        keys = {
            {"<C-t>", "<CMD>ToggleTerm direction=float<CR>", mode = {"n","t"}, desc = "Float Terminal"},
            {"<leader>t", "<CMD>ToggleTerm direction=float<CR>", mode = {"n"}, desc = "Float Terminal"},
            {"<ESC>", [[<C-\><C-n>]], mode = {"t"}, desc = "Normal Mode"},
        }
    }
}
