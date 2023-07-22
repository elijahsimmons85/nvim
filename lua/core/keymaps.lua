vim.g.mapleader = " " -- set leader key to space

local map = vim.keymap

-- General keymaps -- 

map.set('i', "jk", "<ESC>", {silent = true, desc = "Exit insert mode"}) -- exiting insert mode
map.set("n", "x", '"_x') -- delete without yanking

-- window management --
map.set("n", "<leader>sv", "<C-w>v", {silent = true, desc = "Split Window Vertically"})
map.set("n", "<leader>sh", "<C-w>s", {silent = true, desc = "Split Window Horizontally"})
map.set("n", "<leader>se", "<C-w>=", {silent = true, desc = "Equalize Windows"})
map.set("n", "<leader>sx", ":close<CR>", {silent = true, desc = "Close Window"})

-- buffer management --
map.set("n", "<leader>d", ":Bdelete<CR>", {silent = true, desc = "Close Buffer"}) -- close current buffer
map.set("n", "<S-l>", ":bn<CR>", {silent = true, desc = "Next Buffer"}) -- go to next buffer
map.set("n", "<S-h>", ":bp<CR>", {silent = true, desc = "Previous Buffer"}) -- go to previous buffer


map.set("n", "<leader>c", ":q<CR>", {silent = true, desc = "Close"}) -- close current buffer
map.set("n", "<leader>C", ":q!<CR>", {silent = true, desc = "Force Close"}) -- close without saving


-- saving --
map.set("n", "<leader>w", ":w<CR>", {silent = true, desc = "Save"}) -- save current buffer

-- plugin maps --

-- vim-maximizer
map.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- neo-tree 
map.set("n", "<leader>e", ":Neotree toggle<CR>", {silent = true, desc = "Toggle File Explorer"}) -- toggle file explorer
map.set("n", "<leader>h", ":Alpha<CR>", {silent = true, desc = "Home"}) -- close current buffer

-- telescope
map.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {silent = true, desc = "Find Files"}) -- find files within current working directory, respects .gitignore
map.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", {silent = true, desc = "Find Recent Files"}) -- find recently opened files
map.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", {silent = true, desc = "Find Pinned Files"}) -- find pinned files

map.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", {silent = true, desc = "Live Grep"}) -- find string in current working directory as you type
map.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", {silent = true, desc = "Current Word Grep"}) -- find string under cursor in current working directory
map.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {silent = true, desc = "Find Buffers"}) -- list open buffers in current neovim instance
