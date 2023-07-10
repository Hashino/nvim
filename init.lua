vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = "<Space>"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
	    lazypath,
	  })
	end
	vim.opt.rtp:prepend(lazypath)

plugins = 
{
	{
		  "nvim-neo-tree/neo-tree.nvim",
		  dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
		  },
		  cmd = "Neotree",
		  init = function() vim.g.neo_tree_remove_legacy_commands = true end,
	}, 
	{
		  "folke/which-key.nvim",
		  keys = { "<leader>" },
		  event = "VeryLazy",
		  init = function()
		    vim.o.timeout = true
		    vim.o.timeoutlen = 300
		  end,
		  opts = {
		    -- your configuration comes here
		    -- or leave it empty to use the default settings
		    -- refer to the configuration section below
		  }
	},
}
require("lazy").setup(plugins, opts)
