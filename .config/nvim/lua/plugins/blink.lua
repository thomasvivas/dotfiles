-- Autocopmletion
return {
  'saghen/blink.cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  dependencies = 'rafamadriz/friendly-snippets',
  build = 'cargo build --release',
  config = true
}
