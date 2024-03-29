return {
  "folke/tokyonight.nvim",
  commit = "06d0eadc5e8efe6b2516675c75614df36117eaf1",
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = "italic",
        keywords = "italic",
        functions = "NONE",
        variables = "NONE",
        sidebars = "transparent",
        floars = "transparent",
      },
    })
    require("notify").setup({
      background_colour = "#282A36",
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
