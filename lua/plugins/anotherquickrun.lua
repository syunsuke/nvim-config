return {
    "is0n/jaq-nvim",
    cmd = "Jaq",
    opts = {

        cmds = {
            internal = {
                lua = "luafile %",
                vim = "source %",
            },
            external = {
                markdown = "glow %",
                rust = "rust-script %"
            },
        },

        behavior = {
            -- Default type
            default     = "float",

            -- Start in insert mode
            startinsert = true,

            -- Use `wincmd p` on startup
            wincmd      = false,

            -- Auto-save files
            autosave    = false
        },

        ui = {
            float = {
                -- See ':h nvim_open_win'
                border    = "double",

                -- See ':h winhl'
                winhl     = "Normal",
                borderhl  = "FloatBorder",

                -- See ':h winblend'
                winblend  = 15,

                -- Num from `0-1` for measurements
                height    = 0.7,
                width     = 0.7,
                x         = 0.7,
                y         = 0.6
            },

            terminal = {
                -- Window position
                position = "bot",

                -- Window size
                size     = 30,

                -- Disable line numbers
                line_no  = false
            },

            quickfix = {
                -- Window position
                position = "bot",

                -- Window size
                size     = 30
            }
        }
    }
}
