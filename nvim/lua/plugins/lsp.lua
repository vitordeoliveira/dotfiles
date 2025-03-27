return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            procMacro = {
              enable = true,
            },
          },
        },
      },
    },
  },
}
