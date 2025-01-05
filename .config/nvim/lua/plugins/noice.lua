-- Make commands look pretty
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
  },
  keys = {
    { "<S-Enter>",   function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c" },
    { "<leader>snl", function() require("noice").cmd("last") end },
    { "<leader>snh", function() require("noice").cmd("history") end },
    { "<leader>sna", function() require("noice").cmd("all") end },
    { "<leader>snd", function() require("noice").cmd("dismiss") end },
  },
}
