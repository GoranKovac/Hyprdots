return {
  "stevearc/conform.nvim",
  opts = {
    -- Ensure Lua files use StyLua
    formatters_by_ft = {
      lua = { "stylua" },
    },
    -- Override StyLua settings globally
    formatters = {
      stylua = {
        command = "stylua",
        args = {
          "--config-path",
          vim.fn.expand("~/.config/nvim/stylua.toml"),
          "-",
        },
        stdin = true,
      },
    },
  },
}
