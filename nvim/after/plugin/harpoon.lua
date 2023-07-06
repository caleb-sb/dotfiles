local harpoon_exists, _ = pcall(require, "harpoon")
if not harpoon_exists then return end

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>hl", ui.toggle_quick_menu)


vim.keymap.set("n", "<leader>hr", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>he", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>hw", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>hq", function() ui.nav_file(4) end)
