-- Telescope? WHat's that?
return {
  "ibhagwan/fzf-lua",
  cmd = 'FzfLua',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { '<leader>sh',       '<cmd>FzfLua helptags<cr>',  desc = '[S]earch [H]elp' },
    { '<leader>sf',       '<cmd>FzfLua files<cr>',     desc = '[S]earch [F]iles' },
    { '<leader><leader>', '<cmd>FzfLua buffers<cr>',   desc = '[] Search existing buffers' },
    { '<leader>sg',       '<cmd>FzfLua live_grep<cr>', desc = '[S]earch by [G]rep' },
    { '<leader>sk',       '<cmd>FzfLua keymaps<cr>',   desc = '[S]earch [K]eymaps' },
    { '<leader>sr',       '<cmd>FzfLua oldfiles<cr>',  desc = '[S]earch [R]ecent' },
  },
}
