-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Manim shenanigans
local function render_scene()
  local node = vim.treesitter.get_node()
  while node and node:type() ~= "class_definition" do
    node = node:parent()
  end
  if not node then
    print("No class name found at cursor!")
    return
  end
  local class_name = vim.treesitter.get_node_text(node:field("name")[1], 0)
  local file_path = vim.fn.expand('%:p')
  local video_path = vim.fn.expand('%:p:h') ..
      '/media/videos/' .. vim.fn.expand('%:t:r') .. '/480p15/' .. class_name .. '.mp4'
  vim.api.nvim_command('split | resize 10 | terminal manim -ql "' ..
    file_path .. '" "' .. class_name .. '"; start "' .. video_path .. '"')
end

vim.keymap.set("n", "<leader>mm", render_scene, { desc = 'Render manim class under cursor' })
