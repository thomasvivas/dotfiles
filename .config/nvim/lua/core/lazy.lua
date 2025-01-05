-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.system({
    "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath
  }, { text = true }):wait()
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "rplugin",
        "shada",
        "spellfile",
        "vimball",
      },
    },
  },
  change_detection = {
    enabled = false,
    notify = false, 
  },
  checker = {
    enabled = false,
  },
})
