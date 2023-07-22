-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
  ]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
    return
end

-- add list of plugins to install
return packer.startup(function(use)

    -- packer can manage itself
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

    use("ellisonleao/gruvbox.nvim") -- gruvbox color theme gorgeous

    use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

    use("szw/vim-maximizer") -- maximizes and restores current window

    -- essential plugins
    use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
    use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

    -- file explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim"}
    }

    -- window picker for neotree
    use {
        's1n7ax/nvim-window-picker',
        tag = 'v2.*',
        config = function()
            require'window-picker'.setup()
        end
    }

    -- notification manager
    use {
        "folke/noice.nvim",
        requires = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"}
    }

    use {
        'goolord/alpha-nvim',
        requires = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }
    -- vs-code like icons
    use("nvim-tree/nvim-web-devicons")

    -- statusline
    use("nvim-lualine/lualine.nvim")

    -- bufferline
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons'
    }

    -- telescope (fuzzy finder)
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- treesitter configuration
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({
                with_sync = true
            })
            ts_update()
        end
    })

    -- auto closing
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use({
        "windwp/nvim-ts-autotag",
        after = "nvim-treesitter"
    }) -- autoclose tags

    -- git integration
    use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

    -- which-key
    use("folke/which-key.nvim")

    -- autocompletion
    use("hrsh7th/nvim-cmp") -- completion plugin
    use("hrsh7th/cmp-buffer") -- source for text in buffer
    use("hrsh7th/cmp-path") -- source for file system paths

    -- snippets
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets

    use {
        'NeogitOrg/neogit', 
        requires = 'nvim-lua/plenary.nvim' 
    }

    use('famiu/bufdelete.nvim')

    if packer_bootstrap then
        require("packer").sync()
    end
end)
