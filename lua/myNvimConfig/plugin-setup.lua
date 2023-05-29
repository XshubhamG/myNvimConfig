-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed


-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- add list of plugins to install
return packer.startup(function(use)
  -- packer
  use("wbthomason/packer.nvim")

  -- lua function plugin
  use("nvim-lua/plenary.nvim")


  -- colorscheme
  use { "bluz71/vim-nightfly-colors", as = "nightfly" }
  use "lunarvim/colorschemes"
  use { "folke/tokyonight.nvim" }
  use { "joshdick/onedark.vim" }
  use { "rebelot/kanagawa.nvim" }
  use { 'Mofiqul/dracula.nvim' }

  -- tmux navigator
  use { "christoomey/vim-tmux-navigator" }


  -- commenting with gc
  use("numToStr/Comment.nvim")


  -- file explorer
  use("nvim-tree/nvim-tree.lua")


  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")


  -- statusline
  use("nvim-lualine/lualine.nvim")


  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })        -- fuzzy finder


  -- treesitter
  use('nvim-treesitter/nvim-treesitter', { rest = ':TSUpdate' })
  use('nvim-treesitter/playground')


  -- Autocompletion
  use { 'hrsh7th/nvim-cmp' }             -- Required
  use { 'hrsh7th/cmp-nvim-lsp' }         -- Required
  use { 'hrsh7th/cmp-buffer' }           -- buffer completions
  use { 'hrsh7th/cmp-path' }             -- path completions
  use { 'hrsh7th/cmp-cmdline' }          -- cmdline completions
  use { 'saadparwaiz1/cmp_luasnip' }     -- snippet completions
  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' } -- a bunch of snippets to use

  -- Autopairs
  use { 'windwp/nvim-autopairs' }

  -- Lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },  -- Required
      {                             -- Optional
        'williamboman/mason.nvim',
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    }
  }
  use { 'jose-elias-alvarez/null-ls.nvim' } -- for Linters and formatter

  -- using packer.nvim
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
  use { 'moll/vim-bbye' }

  -- Vim be good 
  use { 'ThePrimeagen/vim-be-good' }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
