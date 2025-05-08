
vim.api.nvim_set_keymap("n", "gf", "",
  {
    callback=function()
      local name=vim.fn.expand("<cfile>")
      local cmdheight=vim.opt.cmdheight
      vim.opt.cmdheight = 4
      vim.opt.hidden = true
      vim.cmd[[e <cfile>]]

      if string.match(name, "^https?://") then
        local mark = string.find(name, "?")
        if mark then
          name = string.sub(name, 0, mark-1)
        end

        vim.cmd("file " .. name)
      end

      vim.opt.cmdheight = cmdheight
    end
  })

local hcurl = (vim.fn.has("win32") == 1) and vim.fn.expand("~/bin/hcurl.exe") or vim.fn.expand("~/bin/hcurl")

if vim.fn.filereadable(hcurl) == 1 then
  vim.g.netrw_http_cmd = hcurl
  local curlrc = vim.fn.expand("~/.curlrc")
  vim.g.netrw_http_xcmd = "-o"
  if vim.fn.filereadable(curlrc) then
    vim.g.netrw_http_xcmd = "-K" .. curlrc .. " " .. vim.g.netrw_http_xcmd
  end
end

