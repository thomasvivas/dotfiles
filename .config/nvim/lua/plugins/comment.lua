-- Quickly comment out lines
return {
  'numToStr/Comment.nvim',
  keys = {
    { "gcc", mode = "n",          desc = "Comment toggle current line" },
    { "gc",  mode = { "n", "v" }, desc = "Comment toggle linewise" },
  },
  config = true
}
