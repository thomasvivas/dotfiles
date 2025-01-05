-- Lowlighting yeah
return {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPost", "BufNewFile" }, -- Load only when buffer is loaded
  build = ':TSUpdate',
  cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {},
    auto_install = false, -- Disable auto-install for better startup
    highlight = {
      enable = true,
      disable = function(_, bufnr) -- Disable for large files
        return vim.api.nvim_buf_line_count(bufnr) > 10000
      end,
    },
    indent = { enable = true },
  },
}
