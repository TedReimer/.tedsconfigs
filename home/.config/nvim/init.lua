-- Most of this file comes from kickstart.nvim, but I've only
-- really taken what I think I want

require("tedsdark")

-- Set line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- TODO: figure out if I can uncomment this
-- vim.g.have_nerd_font = true

-- Enable break indent
vim.opt.breakindent = true

-- Use true colors
vim.opt.termguicolors = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Indenting Rules
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.incsearch = true



-- [[ BASIC KEYMAPS ]]

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fv', vim.cmd.Ex, {})



-- [[ LAZY ]]

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { 'folke/tokyonight.nvim',                    lazy = false,       priority = 1000, opts = {}, },
    { 'VonHeikemen/lsp-zero.nvim',                branch = 'v3.x' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' },
    { 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'folke/neodev.nvim',                        opts = {} },
})

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    lsp_zero.buffer_autoformat()
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'gopls', 'lua_ls' },
    handlers = {
        lsp_zero.default_setup,
    },
})

--vim.cmd[[colorscheme tokyonight-moon]]
vim.cmd [[TSEnable highlight]]
