return {
  "vague2k/vague.nvim",
  lazy = false,  
  priority = 1000, 
  config = function()
    require("vague").setup({
      -- optional configuration here
    })
    vim.cmd("colorscheme vague")
  end
}
