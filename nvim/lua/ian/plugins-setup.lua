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
  -- use 'foo2/bar2.nvim'
  use 'bluz71/vim-nightfly-guicolors'   -- theme
  use 'christoomey/vim-tmux-navigator'  -- switch windows with ctrl+hjkl
  use 'szw/vim-maximizer'               -- maximize window (see keymaps.lua)
  use 'numToStr/Comment.nvim'           -- comment out easier with "gc"
  use 'nvim-lua/plenary.nvim'
  use 'nvim-tree/nvim-tree.lua'         -- file explorer
  use 'kyazdani42/nvim-web-devicons'    -- icons
  use 'nvim-lualine/lualine.nvim'       -- "airline"

  use ({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use ({ "nvim-telescope/telescope.nvim", branch = '0.1.x'})

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

