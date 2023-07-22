vim.cmd("colorscheme gruvbox")

local status_ = pcall(vim.cmd, "colorscheme gruvbox")
if not status_ then
    print("Error: gruvbox color scheme not found")
    return
end