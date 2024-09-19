return {
    {
        'vim-skk/skkeleton',

        dependencies = {
            'vim-denops/denops.vim',
        },

        event = "InsertEnter",

        keys = {
            { "<C-j>", "<Plug>(skkeleton-toggle)", mode = { "i", "c" }, desc = "Toggle skkeleton" }
        },

        config = function()
            vim.fn['skkeleton#config']({
                globalDictionaries = {
                    "/usr/share/skk/SKK-JISYO.L",
                    "/usr/share/skk/SKK-JISYO.geo",
                    "/usr/share/skk/SKK-JISYO.jinmei",
                    "/usr/share/skk/SKK-JISYO.lisp",
                    "/usr/share/skk/SKK-JISYO.law",
                },
                eggLikeNewline = true,
                keepState = true,
                showCandidatesCount = 2,
                registerConvertResult = true,
                markerHenkan = "[変換]",
                markerHenkanSelect = "[選択]",
            })

            --vim.fn['skkeleton#register_keymap']('input', '/', 'abbrev')

            -- let g:eskk#marker_henkan = "[変換]"
            -- let g:eskk#marker_henkan_select = "[選択]"
            -- let g:eskk#marker_okuri = "[送り]"
            -- skkeletonの初期設定や追加のカスタム設定
        end,


    },
}

