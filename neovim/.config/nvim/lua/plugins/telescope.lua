local is_installed = function(...)
  local arg = ...
  for i,v in ipairs(arg) do
    if not (vim.fn.executable(v) == 1) then return false end
  end
  return true
end

M = {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = {
      { 'nvim-lua/plenary.nvim' }, 
      { 
        "nvim-telescope/telescope-fzf-native.nvim",
        cond = is_installed({"fzf", "cc", "make"}),
        build = "make",
        config = function()
      	  require('telescope').load_extension('fzf')
        end
      }
    },
    keys = {
      { "<leader>s", desc=" [s]earch"}, 
      { "<leader>sf", function() require("telescope.builtin").find_files() end , desc = "[f]iles" },
      { "<leader>sg", function() require("telescope.builtin").live_grep() end , desc = "(live) [g]rep" },
      { "<leader>sb", function() require("telescope.builtin").buffers() end , desc = "[b]uffers" },
      { "<leader>sh", function() require("telescope.builtin").help_tags() end , desc = "[h]elp-tags" },
      { "<leader>sc", function() require("telescope.builtin").colorscheme({enable_preview = true}) end, desc = "[c]olorscheme" }
    },
  }

return M
