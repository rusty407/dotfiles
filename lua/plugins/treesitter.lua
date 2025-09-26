return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Run :TSUpdate to install parsers on first install
    opts = {
      ensure_installed = { "lua", "python", "javascript", "typescript", "html", "css", "cpp", "c", "bash", }, -- Languages to install parsers for
      highlight = { enable = true},
      indent = { enable = true },
      -- Add other configurations as needed
    },
  },
}
