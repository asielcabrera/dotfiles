return {
  "neovim/nvim-lspconfig",

  opts = {
    noremap = true,
    silent = true,
  },

  config = function()
    vim.lsp.start({
      name = "sourcekit-lsp",
      cmd = { "sourcekit-lsp" },
      pattern = { "swift" },
      autostart = true,
      init_options = {
        hostInfo = "nvim",
      },
      root_dir = vim.fs.dirname(vim.fs.find({ "Package.swift" }, { upward = true })[1]),
    })
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
      end,
    })
  end,
}
