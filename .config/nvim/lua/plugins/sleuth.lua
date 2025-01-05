-- Detect tab size in buffer
return {
  'tpope/vim-sleuth',
  event = { "BufReadPre", "BufNewFile" }
}
