vim.g.mapleader="-"

local function isModuleAvailable(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end


require "config.lazy"
require "config.lualine"
require "config.options"
if isModuleAvailable("config.local") then
  require "config.local"
end
require "config.netrw"
require "config.json"
require "config.filetypes"
require "config.mappings"
require "config.mason"
require "config.telescope"

if vim.g.neovide then
  require "config.neovide"
end

vim.cmd [[colo jellybeans]]

if vim.fn.has("windows") then
  vim.cmd[[source $VIMRUNTIME/mswin.vim]]
  vim.api.nvim_del_keymap("n", "<C-A>")
end

