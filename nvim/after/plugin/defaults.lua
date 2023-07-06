vim.wo.rnu = true
vim.opt.list = false
vim.opt.listchars:append('tab:⇀ ')
vim.opt.swapfile = false
-- vim.opt.listchars:append('trail:·')
-- vim.opt.listchars:append('multispace:·')
--
-- KEYMAPS
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>rw", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

vim.keymap.set("n", "U", "<C-r>")

local prettier_fmt = function()
  local ft = vim.bo.filetype
  local filetypes = { "css", "vue", "graphql", "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  }
  for _, value in ipairs(filetypes) do
    if (ft == value) then
      local buf_path = vim.api.nvim_buf_get_name(0)
      vim.api.nvim_command(":silent%!prettierd " .. buf_path)
      return
    end
  end
end

vim.keymap.set("n", "<leader>pf", prettier_fmt)
vim.keymap.set("n", "<leader>lg", ":silent LazyGit<CR>")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- Keep the cursor still when J-ing
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
