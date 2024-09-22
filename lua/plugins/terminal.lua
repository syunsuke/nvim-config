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
        }
    }
}
