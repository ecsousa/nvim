
local function noremap(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap=true
  vim.keymap.set(mode, lhs, rhs, opts)
end

local function nnoremap(lhs, rhs, opts) noremap('n', lhs, rhs, opts) end
local function vnoremap(lhs, rhs, opts) noremap('v', lhs, rhs, opts) end
local function xnoremap(lhs, rhs, opts) noremap('x', lhs, rhs, opts) end
local silent = { silent = true }

vnoremap('G', 'G$')

nnoremap('<SPACE>', '<SPACE>:noh<CR>', silent)
nnoremap('<TAB>n', ':tabnew<CR>', silent)
nnoremap('<TAB>x', ':tabclose<CR>', silent)
nnoremap(']<TAB>', ':tabn<CR>', silent)
nnoremap('[<TAB>', ':tabp<CR>', silent)
nnoremap('[<S-TAB>', ':tabfirst<CR>', silent)
nnoremap(']<S-TAB>', ':tablast<CR>', silent)

nnoremap('<leader>a', 'ggVG')

xnoremap('>', '>gv', { noremap=true })
xnoremap('<', '<gv', { noremap=true })

nnoremap('<leader>r', vim.lsp.buf.rename)
nnoremap('<leader>e', vim.diagnostic.goto_next)
nnoremap('<leader>E', vim.diagnostic.goto_prev)

