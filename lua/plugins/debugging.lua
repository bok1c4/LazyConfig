return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Setup DAP UI
    dapui.setup()

    -- Open/close DAP UI on events
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Keybindings for DAP
    vim.keymap.set("n", "<F5>", function()
      dap.continue()
    end, { desc = "Continue" })
    vim.keymap.set("n", "<F10>", function()
      dap.step_over()
    end, { desc = "Step Over" })
    vim.keymap.set("n", "<F11>", function()
      dap.step_into()
    end, { desc = "Step Into" })
    vim.keymap.set("n", "<F12>", function()
      dap.step_out()
    end, { desc = "Step Out" })
    vim.keymap.set("n", "<Leader>b", function()
      dap.toggle_breakpoint()
    end, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<Leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Set Conditional Breakpoint" })
    vim.keymap.set("n", "<Leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { desc = "Set Log Point" })
    vim.keymap.set("n", "<Leader>dr", function()
      dap.repl.open()
    end, { desc = "Open REPL" })
    vim.keymap.set("n", "<Leader>dl", function()
      dap.run_last()
    end, { desc = "Run Last" })
  end,
}, {
  "jay-babu/mason-nvim-dap.nvim",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
  opts = {
    handlers = {},
  },
}, {
  "mfussenegger/nvim-dap",
  config = function(_, _)
    require("core.utils").load_mappings("dap")
  end,
}, {
  "jose-elias-alvarez/null-ls.nvim",
  event = "VeryLazy",
  opts = function()
    return require("custom.configs.null-ls")
  end,
}, {
  "neovim/nvim-lspconfig",
  config = function()
    require("plugins.configs.lspconfig")
    require("custom.configs.lspconfig")
  end,
}, {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "clangd",
      "clang-format",
      "codelldb",
    },
  },
}
