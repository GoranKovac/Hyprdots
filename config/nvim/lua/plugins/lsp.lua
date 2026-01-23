return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--all-scopes-completion",
            "--header-insertion=never",
            "--query-driver=/**/*",  -- Important for finding system headers
          },
        },
      },
    },
  },
}
