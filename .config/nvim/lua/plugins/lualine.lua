-- Line at the bottom of the screen
return {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy",
  dependencies = {
    {
      'nvim-tree/nvim-web-devicons',
      lazy = true,
      enabled = vim.g.have_nerd_font
    }
  },
  opts = {
    options = {
      theme = 'auto',
      globalstatus = true,
      refresh = {
        statusline = 1000, -- Reduce refresh rate for better performance
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { { 'mode', separator = { left = '', right = '' } } },
      lualine_b = { 'diff', 'diagnostics' },
      lualine_c = { { 'filename', path = 2 } },
      lualine_x = { 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { { 'location', separator = { left = '', right = '' } } },
    },
  },
}
