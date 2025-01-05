-- Quickly run code from Neovim
return {
  'CRAG666/code_runner.nvim',
  keys = {
    { '<leader>r',  '<cmd>RunCode<cr>' },
    { '<leader>rq', '<cmd>RunClose<cr>' }
  },
  opts = {
    filetype = {
      java = {
        "cd $dir &&",
        "javac $fileName &&",
        "java $fileNameWithoutExt"
      },
      python = "python3 -u",
      rust = {
        "cd $dir &&",
        "rustc $fileName &&",
        "$dir/$fileNameWithoutExt"
      },
    },
  }
}
