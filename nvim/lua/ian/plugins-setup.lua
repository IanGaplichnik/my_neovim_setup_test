local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use 'bluz71/vim-nightfly-guicolors'   -- theme
  use 'christoomey/vim-tmux-navigator'  -- switch windows with ctrl+hjkl
  use 'szw/vim-maximizer'               -- maximize window (see keymaps.lua)
  use 'numToStr/Comment.nvim'           -- comment out easier with "gc"
  use 'nvim-lua/plenary.nvim'
  use 'nvim-tree/nvim-tree.lua'         -- file explorer
  use 'kyazdani42/nvim-web-devicons'    -- icons
  use 'nvim-lualine/lualine.nvim'       -- "airline"
  
  -- autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- snippets
  use 'L3MON4D3/LuaSnip'                -- snippet engine
  use 'saadparwaiz1/cmp_luasnip'        --
  use 'rafamadriz/friendly-snippets'    -- collection of useful snippets

  --fuzzy find
  use ({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use ({ "nvim-telescope/telescope.nvim", branch = '0.1.x'})

  --managing and installing LSP servers
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- configuring lsp servers
  use 'neovim/nvim-lspconfig'
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

