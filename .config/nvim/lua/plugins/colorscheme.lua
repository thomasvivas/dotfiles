-- Best colorscheme blud
return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("gruvbox").setup({
      contrast = "hard",
      transparent_mode = true,
      dim_inactive = false
    })
    vim.cmd("colorscheme gruvbox")
  end
}
