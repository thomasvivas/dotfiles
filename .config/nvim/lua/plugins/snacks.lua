-- Various goodies (actually, this fucking sucks)
return {
  "folke/snacks.nvim",
  priority = 1000,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    dashboard = {
      enabled = true,
      preset = {
header = [[
                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
]]
}
    },
    indent = { enabled = true },
    input = { enabled = true },
    scroll = { enabled = true },
    bigfile = { enabled = true },
    notify = { enabled = true }
  },
}
