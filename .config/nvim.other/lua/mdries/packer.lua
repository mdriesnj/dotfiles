-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Install without configuration
	use ({ 'projekt0n/github-nvim-theme' })

	-- Or with configuration
	use({
		'projekt0n/github-nvim-theme',
		config = function()
			require('github-theme').setup({
				-- ...
			})
			vim.cmd('colorscheme github_dark')
		end
	})

	use('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})
end)
