-- Language server beauty
return {
  "neovim/nvim-lspconfig",
  dependencies = { { 'williamboman/mason.nvim', config = true } },
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- Define servers to set up
    local servers = {
      'lua_ls',
      'jdtls',
      'rust_analyzer',
      'zls',
      'pyright'
    }

    -- Set up each server with the same capabilities
    local lspconfig = require('lspconfig')
    for _, server in ipairs(servers) do
      lspconfig[server].setup({ capabilities = capabilities })
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = args.buf, desc = 'LSP: ' .. desc })
        end

        -- Keymaps
        local mappings = {
          { 'gd',         '<cmd>FzfLua lsp_definitions<cr>',       '[G]oto [D]efinitions' },
          { 'gr',         '<cmd>FzfLua lsp_references<cr>',        '[G]oto [R]eferences' },
          { 'gI',         '<cmd>FzfLua lsp_implementations<cr>',   '[G]oto [I]mplementations' },
          { '<leader>D',  '<cmd>FzfLua lsp_typedefs<cr>',          'Type [D]efintion' },
          { '<leader>ds', '<cmd>FzfLua lsp_document_symbols<cr>',  '[D]ocument [S]ymbols' },
          { '<leader>ws', '<cmd>FzfLua lsp_workspace_symbols<cr>', '[W]ocument [S]ymbols' },
          { '<leader>rn', vim.lsp.buf.rename,                      '[R]e[N]ame' },
          { '<leader>ca', vim.lsp.buf.code_action,                 '[C]ode [A]ction',         { 'n', 'x' } }
        }

        for _, m in ipairs(mappings) do
          map(m[1], m[2], m[3], m[4])
        end

        local c = vim.lsp.get_client_by_id(args.data.client_id)
        if not c then return end

        vim.api.nvim_create_autocmd('BufWritePre', {
          buffer = args.buf,
          callback = function()
            vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
          end,
        })
      end,
    })
  end,
}
