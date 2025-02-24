
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

require('lspconfig').csharp_ls.setup({ })

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      require('lspconfig').lua_ls.setup({
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

