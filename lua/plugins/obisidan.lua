return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "rng-notes",
        path = "/home/temp/Notes/rng/",
      },
      {
        name = "devops",
        path = "/home/temp/Notes/devops/",
      },
      {
        name = "cybsec",
        path = "/home/temp/Notes/cybsec/",
      },
      {
        name = "uni",
        path = "/home/temp/Notes/uni/",
      },
    },

    -- see below for full list of options 👇
  },
}
