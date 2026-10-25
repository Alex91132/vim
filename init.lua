-- =============== АВТОУСТАНОВКА PACKER ===============
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  print('Устанавливаю packer.nvim...')
  fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd('packadd packer.nvim')
  print('Packer установлен! Перезапустите Neovim.')
  return
end
-- ===================================================

-- Базовые настройки
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.g.mapleader = ','

-- ЗАГРУЗКА ПЛАГИНОВ (ВСЕ use ТОЛЬКО ВНУТРИ ЭТОГО БЛОКА!)
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
        view = { width = 30 },
        renderer = { indent_markers = { enable = true } },
        git = { enable = true },
        actions = {
          open_file = { resize_window = true },
        },
      })
    end,
  }
  -- СЮДА МОЖНО ДОБАВЛЯТЬ ДРУГИЕ ПЛАГИНЫ (ВНУТРИ startup!)
  use 'nvim-treesitter/nvim-treesitter'
end)

-- Горячие клавиши (ВНЕ блока startup!)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ee", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

-- Тема (pcall: пока плагины не установлены, Neovim запускается без неё)
pcall(vim.cmd, 'colorscheme tokyonight')
-- Treesitter configuration
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if status_ok then
  configs.setup({ highlight = { enable = true }, indent = { enable = true } })
end
