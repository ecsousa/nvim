vim.cmd[[
vnoremap G G$

nnoremap <silent> <SPACE> <SPACE>:noh<CR>

xnoremap > >gv
xnoremap < <gv

nnoremap <silent> <TAB>n :tabnew<CR>
nnoremap <silent> <TAB>x :tabclose<CR>
nnoremap <silent> ]<TAB> :tabn<CR>
nnoremap <silent> [<TAB> :tabp<CR>
nnoremap <silent> [<S-TAB> :tabfirst<CR>
nnoremap <silent> ]<S-TAB> :tablast<CR>

nnoremap <leader>a ggVG

]]


vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
