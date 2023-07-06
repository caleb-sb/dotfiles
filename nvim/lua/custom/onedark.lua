return {
  "navarasu/onedark.nvim",
  config = function()
    require("onedark").setup {
      style = "deep",
      term_colors = true,
      transparent = false,
      code_style = {
        comments = "italic",
        variables = "bold",
        functions = "bold",
        strings = "none",
        keywords = "italic",
      },
    }
    vim.cmd.colorscheme('onedark')
  end,
}
