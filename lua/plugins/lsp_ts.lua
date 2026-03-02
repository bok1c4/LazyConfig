return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          root_dir = require("lspconfig.util").root_pattern("tsconfig.json", "jsconfig.json", ".git"),
        },
      },
    },
  },
}
