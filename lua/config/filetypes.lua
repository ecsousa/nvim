local api = vim.api

local group = api.nvim_create_augroup("myConfig", { clear = true })

local fts = {
  COMMIT_EDITMSG = "gitcommit",
  ["differential-update-comments"] = "gitcommit",
  ["*.tasks"] = "xml",
  ["*.vb"] = "vbnet",
  ["*._ps1"] = "ps1",
  ["*.msbuild"] = "xml",
  ["*.targets"] = "xml",
  ["*.properties"] = "xml",
  ["*.proj"] = "xml",
  ["*.props"] = "xml",
  ["*.build"] = "xml",
  ["*.wxi"] = "xml",
  ["*.wxs"] = "xml",
  ["*.vim"] = "vim",
  ["vimrc"] = "vim",
  ["*.cs"] = "cs",
  ["**/.kube/config"] = "yaml",
  ["gitconfig"] = "gitconfig",
}

local tabs = {
  html=2,
  typescript=2,
  typescriptreact=2,
  lua=2,
  yaml=2,
  json=2,
  xml=2,
  javascript=2,
  javascriptreact=2,
  ["javascript.jsx"]=2,
  ["*.json"]=2,
}

for pattern, ft in pairs(fts) do
  api.nvim_create_autocmd({"BufNewFile","BufRead"}, {
    pattern = pattern,
    command = "set ft=" .. ft,
    group = group,
  })
end

for ft, tab in pairs(tabs) do
  api.nvim_create_autocmd("FileType", {
    pattern = ft,
    command = string.format("set ts=%s sw=%s", tab, tab),
    group = group,
  })
end

api.nvim_create_autocmd({"FileType"}, {
  pattern = {"gitcommit"},
  command = "setlocal enc=utf8 spell",
  group = group,
})
api.nvim_create_autocmd({"FileType"}, {
  pattern = {"gitcommit"},
  command = "normal! gg",
  group = group,
})


api.nvim_create_autocmd({"FileType"}, {
  pattern = {"yaml","json","xml"},
  command = "setlocal enc=utf8",
  group = group,
})
api.nvim_create_autocmd({"FileType"}, {
  pattern = {"ruby","eruby"},
  command = "set filetype=ruby.eruby.chef",
  group = group,
})
api.nvim_create_autocmd({"FileType"}, {
  pattern = {"markdown"},
  command = "set spell",
  group = group,
})

api.nvim_create_autocmd({"QuickFixCmdPost"}, {
  pattern = {"[^l]*"},
  command = "nested cwindow",
  group = group,
})
api.nvim_create_autocmd({"QuickFixCmdPost"}, {
  pattern = {"l*"},
  command = "nested lwindow",
  group = group,
})

--api.nvim_create_autocmd({"FileType"}, {
  --pattern = {"typescript"},
  --command = "syn clear foldBraces",
  --group = group,
--})

api.nvim_create_autocmd({"BufReadCmd"}, {
  pattern = {"*.jar","*.xpi","*.docx","*.nupkg"},
  command = "call zip#Browse(expand(\"<amatch>\"))",
  group = group,
})


