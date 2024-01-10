return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      sourcekit = {},
    },
  },
  config = function()
    local nvim_lsp = require("lspconfig")
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader><space>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

    nvim_lsp.sourcekit.setup({
      cmd = { "sourcekit-lsp" },
      on_attach = function(client, bufnr)
        -- Configurar las opciones de formato de código
        vim.api.nvim_buf_set_option(bufnr, "tabstop", 2)
        vim.api.nvim_buf_set_option(bufnr, "shiftwidth", 2)
        vim.api.nvim_buf_set_option(bufnr, "softtabstop", 2)

        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader><space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader><space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader><space>wl', function()
           print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<leader><<space>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader><space>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

      end,
      filetypes = { "swift" },
      root_dir = nvim_lsp.util.root_pattern("Package.swift"),
      settings = {
        swift = {
          completeFunctionCalls = true,
          importSwiftModules = true,
        },
      },
    })
  end,
}
