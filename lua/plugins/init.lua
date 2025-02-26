return {
  "tpope/vim-fugitive",
  "tpope/vim-unimpaired",
  "nanotech/jellybeans.vim",
  "nvim-lualine/lualine.nvim",
  --"ms-jpq/coq_nvim",
  "nvim-lua/plenary.nvim",
  "github/copilot.vim",

  {"VonHeikemen/lsp-zero.nvim", branch = 'v3.x'},
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",
  "L3MON4D3/LuaSnip",

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  "nvim-telescope/telescope.nvim",
  "BurntSushi/ripgrep",
  "nvim-tree/nvim-web-devicons",

  "mfussenegger/nvim-dap",
  "jay-babu/mason-nvim-dap.nvim",
  { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
}
