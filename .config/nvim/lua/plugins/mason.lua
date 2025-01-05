-- Make it easier to install LSP shi
return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  cmd = "Mason",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({ automatic_installation = true })
  end
}
