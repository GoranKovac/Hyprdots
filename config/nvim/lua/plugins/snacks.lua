return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        -- explorer = {
        --     -- auto_close = false,
        --     -- your explorer configuration comes here
        --     -- or leave it empty to use the default settings
        --     -- refer to the configuration section below
        -- },
        picker = {

            -- ignored = true,
            -- hidden = true,
            sources = {
                explorer = {
                    ignored = true,
                    hidden = true,
                    auto_close = true,
                    layout = {
                        preset = "default",
                    },
                    -- your explorer picker configuration comes here
                    -- or leave it empty to use the default settings
                },
                files = {
                    ignored = true,
                    hidden = true,
                },
            },
        },
    },
}
