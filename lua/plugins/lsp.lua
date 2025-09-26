return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- LSP management
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- LSP scaffolding
    { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },

    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",

  },

  config = function()
    local lsp_zero = require("lsp-zero")

    -- Setup Mason and install servers
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright", "clangd", },
      handlers = {
        lsp_zero.default_setup,
      },
    })

    -- Setup LSP on_attach keymaps
    lsp_zero.on_attach(function(_, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    -- Setup nvim-cmp
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        -- Add more sources here if needed
      },
    })
  end,
}

