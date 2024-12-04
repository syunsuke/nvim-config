return{
    "thinca/vim-quickrun",
    enabled = true,

    dependencies = {
        "lambdalisue/vim-quickrun-neovim-job",
    },

    init = function()
        vim.g.quickrun_config = {

            ["_"] = {
                ["runner"] = "system",
                --["runner"] = "terminal",
                ["outputter/buffer/opener"] = "new",
                ["outputter/buffer/close_on_empty"] = 1,
            },

            ["rust"] = {
                ["exec"] = "rust-script",
            },
        }

        --vim.keymap.set("n", "<leader>r", "<Nop>")
        vim.keymap.set("n", "<leader>rq", ":QuickRun<CR>", { silent = true })
    end,
}
