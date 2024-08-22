require "nvchad.mappings"

local map = vim.keymap.set
local unmap = vim.keymap.del

-- add yours here

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "@#", "<ESC>", { desc = "Leave insert mode" })

-- reconfigure buffer keymaps
local nvtbf = require "nvchad.tabufline"

-- remap buffer shortcuts
unmap("n", "<Tab>")
unmap("n", "<S-Tab>")
unmap("n", "<Space>b")
unmap("n", "<Space>x")
map("n", "<Space>bl", function()
  nvtbf.next()
end, { desc = "buffer goto next" })
map("n", "<Space>bh", function()
  nvtbf.prev()
end, { desc = "buffer goto previous" })
map("n", "<Space>bd", function()
  nvtbf.close_buffer()
end, { desc = "buffer delete" })
map("n", "<Space>bn", "<cmd>enew<CR>", { desc = "buffer new" })

-- remap nvimtree shortcuts
unmap("n", "<Space>e")
unmap("n", "<C-n>")
map("n", "<Space>e", "<cmd>NvimTreeToggle<CR>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
