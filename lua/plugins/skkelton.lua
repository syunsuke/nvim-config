--[[
denoとskk辞書のインストールが必要
ArchLinuxの場合、以下のコマンドでインストール

$ sudo pacman -S deno skk-jisyo 

--]]

return {
    {
        'vim-skk/skkeleton',

        dependencies = {
            'vim-denops/denops.vim',
            'nvim-lualine/lualine.nvim',
        },

        event = "InsertEnter",

        keys = {
            { "jk", "<Plug>(skkeleton-enable)", mode = { "i", "c", "t" }, desc = "start skkeleton" },
            { "<C-i>", "<Plug>(skkeleton-enable)", mode = { "i", "c", "t" }, desc = "start skkeleton" },
            --{ "<C-j>", "<Plug>(skkeleton-enable)", mode = { "i", "c", "t" }, desc = "start skkeleton" },
            --{ "<C-i>", "<Plug>(skkeleton-disable)", mode = { "i", "c", "t" }, desc = "end skkeleton" }
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
                showCandidatesCount = 4,
                registerConvertResult = true,
                markerHenkan = "[変換]",
                markerHenkanSelect = "[選択]",
            })

            local function skkeleton_status()
                -- skkeletonが有効であればモードを返す
                if vim.fn['skkeleton#is_enabled']()  then
                    local mode = vim.fn['skkeleton#mode']()

                    if mode == 'hira' then
                        return 'あ'
                    elseif mode == 'kata' then
                        return 'ア'
                    elseif mode == 'zenkaku' then
                        return 'Ａ'
                    end
                else
                    return 'en'
                end
            end

            -- Lualineの設定にカスタムセクションを追加
            require('lualine').setup {
                sections = {
                    lualine_a = {'mode',skkeleton_status},
                    lualine_b = {'branch'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                }
            }


        end,
    },

    {
        "delphinus/skkeleton_indicator.nvim",
        event = "InsertEnter",
        opts = {
            fadeOutMs = 500,
            eijiText = "en",
            hiraText = 'あ',
            kataText = 'ア',
            zenkakuText = 'Ａ',
        },
    },
}

