-- import whichkey plugin safely
local status, whichkey = pcall(require, "which-key")
if not status then
  return
end

-- configure whichkey plugin
local wk = require("which-key")
wk.setup({

})

wk.register({
    ["<leader>s"] = {
      name = "+Split Window",
    },
    ["<leader>f"] = {
        name = "+Find",
      },
      ["<leader>b"] = {
        name = "+Buffers",
      },
  })