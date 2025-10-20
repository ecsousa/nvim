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
require "config.netrw"
require "config.json"
require "config.filetypes"
require "config.mappings"
require "config.mason"
require "config.telescope"
require "config.rest"

if vim.g.neovide then
  require "config.neovide"
end

vim.cmd [[colo jellybeans]]

if vim.fn.has("win32") == 1 then
  require "config.windows"
end

if isModuleAvailable("local") then
  require "local"
end

vim.diagnostic.config({
  virtual_text = true,   -- Show inline diagnostics
  signs = true,          -- Show signs in the gutter
  underline = true,      -- Underline the problematic code
  update_in_insert = false,
  severity_sort = true,
})


