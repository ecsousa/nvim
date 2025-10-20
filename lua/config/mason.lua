
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)


--require('lspconfig').lua_ls.setup({
    ---- ... other configs
    --settings = {
        --Lua = {
            --diagnostics = {
                --globals = { 'vim' }
            --}
        --}
    --}
  --}
--)

vim.lsp.config('csharp_ls', { })

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })
    end,
  },
})


require("mason-nvim-dap").setup()

