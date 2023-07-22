-- import bufferline plugin safely
local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

require("bufferline").setup({
  options = {
    separator_style = "thin",
    offsets = {
      {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
      }
    },
  },
})
