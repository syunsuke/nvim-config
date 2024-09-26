return{
    "thinca/vim-quickrun",
    enabled = false,

    dependencies = {
        "lambdalisue/vim-quickrun-neovim-job",
    },

    init = function()
        vim.g.quickrun_config = {

            ["_"] = {
                ["runner"] = "neovim_job",
                --["runner"] = "terminal",
                ["outputter/buffer/opener"] = "new",
                ["outputter/buffer/close_on_empty"] = 1,
            },

            ["rust"] = {
                ["exec"] = "rust-script %s",
            },
        }

        --vim.keymap.set("n", "<leader>r", "<Nop>")
        --vim.keymap.set("n", "<leader>rr", ":QuickRun<CR>", { silent = true })
    end,
}
