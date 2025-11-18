return {
    {
        "catppuccin",
        opts = {
            transparent_background = true,
            float = {
                transparent = true, -- enable transparent floating windows
            },
            custom_highlights = function(colors)
                local u = require("catppuccin.utils.colors")
                return {
                    CursorLine = {
                        bg = u.vary_color(
                            { macchiato = u.lighten(colors.mantle, 0.70, colors.base) },
                            u.darken(colors.surface0, 0.64, colors.base)
                        ),
                    },
                }
            end,
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin-macchiato",
        },
    },
    {
        "folke/noice.nvim",
        opts = {
            presets = {
                lsp_doc_border = true,
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            diagnostics = {
                float = {
                    border = "rounded",
                },
            },
        },
    },
}
