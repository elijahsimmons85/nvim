-- import nvim-tree plugin safely
local setup, neogit = pcall(require, "neogit")
if not setup then
  return
end

neogit.setup({})
