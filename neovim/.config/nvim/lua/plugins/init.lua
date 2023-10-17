local M = {
  -- Colorscheme
  {
    "NTBBloodbath/doom-one.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("doom-one")
    end
  },

  -- Indentation
  "tpope/vim-sleuth",
  
  -- Emacs-like which-key
  {
    "folke/which-key.nvim",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = { options = { section_separators = '', component_separators = '' } }
  },

  -- Error diagnostics counter 
  {
    "ivanjermakov/troublesum.nvim",
  },

  -- Platform IO
}

return M
