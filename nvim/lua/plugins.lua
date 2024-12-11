-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ 
      "git", 
      "clone", 
      "--filter=blob:none", 
      "--branch=stable", 
      lazyrepo, 
      lazypath 
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({global = false})
                end,
                desc = "Buffer Local keymaps (which-key)",
            },
        },
    },
    -- LSP manager
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- Add hooks to LSP to support Linter && Formatter
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            -- Note:
            --  the default search path for 'require ' is ~/.config/nvim/lua
            --  use a `.` as a path separator
            --  the suffix `.lua` is not needed
            require("config.mason-null-ls")
        end,
    },
    -- Vscode like pictograms
    {
        "onsails/lspkind.nvim",
        event = { "VimEnter" },
    },
    -- Atuo-completion engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp", --lsp auto-completion
            "hrsh7th/cmp-buffer", -- buffer auto-completion
            "hrsh7th/cmp-path", --path auto-completion
            "hrsh7th/cmp-cmdline", --cmdline auto-completion
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },
    -- Git integration
	"tpope/vim-fugitive",
    {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config.gitsigns")
		end,
	},
    -- Atuopairs: [], (), "", '', etc
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("config.nvim-autopairs")
        end,
    },
    -- Treesitter-integration
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("config.nvim-treesitter")
        end,
    },
    -- Nvim-treesitter text objects
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.nvim-treesitter-textobjects")
        end,
    },
    -- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.lualine")
		end,
	},
    -- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("config.nvim-tree")
		end,
	},
-- Improve the performance of big file
	{
		"pteroctopus/faster.nvim",
	},
    -- Better terminal integration
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("config.toggleterm")
		end,
	},
    {
        "folke/trouble.nvim",
        branch = "main",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols Diagnostics (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.postion=right<cr>",
                desc = "LSP Definitions/references/ .. (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
        opts = function()
            require("config.trouble")
        end,
    },



  },
  -- Configure any other settings here. See the documentation for more details.
})
