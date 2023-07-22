local opt = vim.opt

-- General options --
opt.relativenumber = true
opt.number = true

-- Indentation --
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 4          -- Size of an indent
opt.tabstop = 4             -- Number of spaces tabs count for
opt.autoindent = true       -- Enable autoindent

-- Line wrapping --
opt.wrap = false

-- Search --
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line --
opt.cursorline = true       -- Highlight the current line

-- Appearance --
opt.termguicolors = true    -- True color support
opt.background = "dark"     -- Tell vim what the background color looks like
opt.signcolumn = "yes"      -- Always show the sign column, otherwise it would shift the text each time
opt.showmode = false        -- Don't show mode (insert, normal, etc)

-- Backspace --
opt.backspace = "indent,eol,start"      -- Make backspace behave like every other editor

-- Clipboard --
opt.clipboard = "unnamedplus"           -- Copy paste between vim and everything else

-- Split Windows --
opt.splitbelow = true
opt.splitright = true

opt.iskeyword:append("-")   -- treat dash separated words as a one word text object