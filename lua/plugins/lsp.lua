return {

    -------------------------------
    -- mason.nvimの設定
    -------------------------------
    {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        cmd = { "Mason", "MasonUpdate", "MasonLog", "MasonInstall", "MasonUninstall", "MasonUninstallAll" },
        config = true,
        opts = {
                ui = {border = "rounded",
                      width = 0.8, height = 0.8,
                     },
                },
    },

    -------------------------------
    -- mason-lspconfig.nvimの設定
    -------------------------------
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim" },
            { "neovim/nvim-lspconfig" },
        },
        opts = {
            ensure_installed = { "lua_ls",  "clangd" },
            automatic_enable = true,
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function(_, opts)

            -- ★ サーバ個別設定は vim.lsp.config で
            vim.lsp.config('lua_ls', {
                settings = { Lua = { diagnostics = { globals = { "vim", "conky" } } } },
            })

            require("mason").setup()
            require("mason-lspconfig").setup(opts)


            --setup_handlers関数は削除されている
            --require("mason-lspconfig").setup_handlers({
            --    function(server)
            --        vim.lsp.enable(server)
            --    end,
            --})

        end,

    },

    -------------------------------
    -- mason-lspconfig.nvimの外部でHLSは管理
    -------------------------------
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            {'nvimdev/lspsaga.nvim'}
        },

        config = function()

            -- nvim-cmp を使うなら capabilities を拡張（未導入でも安全）
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            pcall(function()
                capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
            end)

            -- Key Setting
            local function common_on_attach(client, bufnr)
                vim.notify(("LSP attached: %s (buf=%d)"):format(client.name, bufnr))
                local map = function(m, lhs, rhs, d) vim.keymap.set(m, lhs, rhs, { buffer = bufnr, desc = d }) end
                --map("n", "gd", vim.lsp.buf.definition,  "LSP: Go to def")
                --map("n", "gr", vim.lsp.buf.references,  "LSP: References")
                --map("n", "K",  vim.lsp.buf.hover,       "LSP: Hover")
                --map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")
                --map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP: Code Action")
                --map("n", "<C-l>", function() vim.cmd("LspRestart") end, "LSP: Restart")
                --map("n", "K", function() vim.cmd("Lspsaga hover_doc")end, "LSP: Hover Doc")
                map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "LSP: Hover Doc")
                map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", "LSP: Rename")
                map("n", "ga", "<cmd>Lspsaga code_action<CR>", "LSP: Code Action")
                map("n", "gr", "<cmd>Lspsaga finder<CR>", "LSP: finder")
                map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", "LSP: Peek Def")
                map("n", "gD", "<cmd>Lspsaga goto_definition<CR>", "LSP: Go Def")
                map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", "LSP: Rename")
                map("n", "<leader>L", "<cmd>LspRestart<CR>", "LSP: Restart")
            end

            --vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>')
            -- 診断の見た目（控えめ）
            vim.diagnostic.config({
                virtual_text = { spacing = 2, prefix = "●" },
                float = { border = "rounded", source = "if_many" },
                severity_sort = true,
            })

            --local has_new = (vim.lsp and vim.lsp.enable and vim.lsp.config)


            -- ★ 新API: 共通設定をワイルドカードで
            vim.lsp.config("*", {
                --capabilities = capabilities,
                on_attach = common_on_attach,
            })

            -- Ruff（lint/format/import）。Hover は Pyright系に任せる
            vim.lsp.config("ruff", {
                cmd = { 'ruff', 'server' },
                settings = {},
                on_attach = function(client, bufnr)
                    common_on_attach(client, bufnr)
                    client.server_capabilities.hoverProvider = false
                end,
            })

            -- BasedPyright（型・補完）
            vim.lsp.config("basedpyright", {
                cmd = { 'basedpyright-langserver', '--stdio' },
                settings = {
                    basedpyright = {
                        disableOrganizeImports = true, -- import 整理は Ruff に任せる
                        analysis = { 

                            -- タイプチェックの厳しさ: "off" | "basic" | "standard" | "strict" | "recommended" | "all"
                            typeCheckingMode = "basic",
                            -- 解析範囲: "openFilesOnly" | "workspace"
                            diagnosticMode = "workspace" },
                    },
                },
            })

            -- ★ 新API: 共通設定をワイルドカードで
            vim.lsp.config("*", {
                --capabilities = capabilities,
                on_attach = common_on_attach,
            })

            -- Haskell用の設定
            vim.lsp.config("hls", {
                cmd = { "haskell-language-server-wrapper", "--lsp" },
                settings = {
                    haskell = {
                        formattingProvider = "ormolu",
                    },
                },
            })


            vim.lsp.enable("ruff")
            vim.lsp.enable("basedpyright")
            vim.lsp.enable("hls")
            --vim.lsp.enable("*")

        end,
    },
    -- Lspsagaの設定
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        enabled = true,
        config = function()
            require('lspsaga').setup({})

            --vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
            --vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<CR>')
            --vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>')

        end,
    },


}
