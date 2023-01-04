-- Plugin definition and loading

-- Packer init

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

local packer_bootstrap = ensure_packer()

-- Initialize packer

return require("packer").startup(function(use)
	---------------------------------------------------------------
	-- Packer
	---------------------------------------------------------------
	use("wbthomason/packer.nvim")

	---------------------------------------------------------------
	-- Nvim Tree
	---------------------------------------------------------------
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	---------------------------------------------------------------
	-- Theme: Tokyonight
	---------------------------------------------------------------
	use("folke/tokyonight.nvim")

	---------------------------------------------------------------
	-- Lualine
	---------------------------------------------------------------
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	---------------------------------------------------------------
	-- Bufferline
	---------------------------------------------------------------
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	---------------------------------------------------------------
	-- ALE
	---------------------------------------------------------------
	use({ "dense-analysis/ale" })

	---------------------------------------------------------------
	-- Nvim Treesitter
	---------------------------------------------------------------
	use({ "nvim-treesitter/nvim-treesitter" })

	---------------------------------------------------------------
	-- LSP
	---------------------------------------------------------------
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}) -- Configurations for Nvim LSP

	---------------------------------------------------------------
	-- Telescope
	---------------------------------------------------------------
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"jeetsukumaran/telescope-buffer-lines.nvim",
			"nvim-telescope/telescope-media-files.nvim",
		},
	})

	---------------------------------------------------------------
	-- Coc
	---------------------------------------------------------------
	use({
		"neoclide/coc.nvim",
		branch = "release",
	})

	---------------------------------------------------------------
	-- Autopairs
	---------------------------------------------------------------
	use("windwp/nvim-autopairs")

	---------------------------------------------------------------
	-- Closetag
	---------------------------------------------------------------

	use("alvan/vim-closetag")

	---------------------------------------------------------------
	-- Nerdcommenter
	---------------------------------------------------------------
	use("preservim/nerdcommenter")

	---------------------------------------------------------------
	-- Trouble
	---------------------------------------------------------------
	use({
		"folke/trouble.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			"folke/lsp-colors.nvim",
			"neovim/nvim-lspconfig",
		},
	})

	---------------------------------------------------------------
	-- Prettier.nvim
	---------------------------------------------------------------
	use({
		"MunifTanjim/prettier.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/null-ls.nvim",
		},
	})

	---------------------------------------------------------------
	-- Notify
	---------------------------------------------------------------
	use("rcarriga/nvim-notify")

	---------------------------------------------------------------
	-- Gitgutter
	---------------------------------------------------------------
	use("airblade/vim-gitgutter")

	---------------------------------------------------------------
	-- Gitsigns
	---------------------------------------------------------------
	use({
		"lewis6991/gitsigns.nvim",
		-- tag = "release", -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})

	---------------------------------------------------------------
	-- Vim-surround
	---------------------------------------------------------------
	use("tpope/vim-surround") -- This plugin provides mappings to easily delete, change and add such surroundings in pairs.

	---------------------------------------------------------------
	-- Snippets
	---------------------------------------------------------------
	use("honza/vim-snippets")
	use("grvcoelho/vim-javascript-snippets")
	use("mlaursen/vim-react-snippets")
	use("mattn/emmet-vim")
	use("tomoyukikashiro/vim-angular-snippets")
	use("tellijo/vim-react-native-snippets")

	---------------------------------------------------------------
	-- Codi
	---------------------------------------------------------------
	use("metakirby5/codi.vim")

	---------------------------------------------------------------
	-- Vim-sneak -> Este plugin sirve para moverte más rápido por la pantalla
	---------------------------------------------------------------
	use("justinmk/vim-sneak")

	---------------------------------------------------------------
	-- Vim-spectre
	---------------------------------------------------------------
	use({
		"windwp/nvim-spectre",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	---------------------------------------------------------------
	-- Sniprun
	---------------------------------------------------------------
	use({ "michaelb/sniprun", run = "bash ./install.sh" })

	---------------------------------------------------------------
	-- Vim JS File Import
	---------------------------------------------------------------
	use({
		"kristijanhusak/vim-js-file-import",
		requires = {
			"ludovicchabant/vim-gutentags",
		},
		run = "npm install",
	})
	---------------------------------------------------------------
	-- Vim Polyglot
	---------------------------------------------------------------
	use("sheerun/vim-polyglot")

	---------------------------------------------------------------
	-- Vim Rainbow
	---------------------------------------------------------------
	use("frazrepo/vim-rainbow")

	---------------------------------------------------------------
	-- Popup.nvim
	---------------------------------------------------------------
	use({ "nvim-lua/popup.nvim", requires = { "nvim-lua/plenary.nvim" } })

	---------------------------------------------------------------
	-- Vim-matchit -> '%' operator... go to close pair
	---------------------------------------------------------------
	use("adelarsq/vim-matchit")

	---------------------------------------------------------------
	-- Colorizer
	---------------------------------------------------------------
	use("norcalli/nvim-colorizer.lua")

	---------------------------------------------------------------
	-- Eunuch -> Helpers for vim, example: :Remove :Delete, :Move, :Chmod, etc.
	---------------------------------------------------------------
	use("tpope/vim-eunuch")

	---------------------------------------------------------------
	-- Ident Blankline
	---------------------------------------------------------------
	use("lukas-reineke/indent-blankline.nvim")

	---------------------------------------------------------------
	-- lspsaga
	---------------------------------------------------------------

	use({
		"kkharji/lspsaga.nvim",
		requires = {
			"neovim/nvim-lspconfig",
		},
	})

	-------------------------------------------------------------

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
