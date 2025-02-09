return {
  "akinsho/flutter-tools.nvim",
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("flutter-tools").setup({
      ui = {
        notification_style = "plugin",
      },
      lsp = {
        color = {
          enabled = true,
          foreground = true,
        },
      },
      debugger = {
        enable = true,
        register_configurations = function(paths)
          require("dap").configurations.dart = {
            --put here config that you would find in .vscode/launch.json
            require("dap.ext.vscode").getconfigs(""),
          }
          -- If you want to load .vscode launch.json automatically run the following:
          -- require("dap.ext.vscode").load_launchjs()
        end,
      },
    })
    vim.keymap.set("n", "<leader>fl", require("telescope").extensions.flutter.commands, { desc = "flutter tools" })
  end,
}
