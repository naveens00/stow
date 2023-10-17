vim.g.mapleader = " "
vim.g.localleader = " "


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

require("user.opts")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })


-- LSP
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
--     local nmap = function(keys, func, desc)
--       if desc then
--         desc = 'LSP: ' .. desc
--       end
--       vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
--     end
--
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client.server_capabilities.completionProvider then
--       -- Enable completion triggered by <c-x><c-o>
--       vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
--     end
--     if client.server_capabilities.definitionProvider then
--       vim.bo[ev.buf].tagfunc = "v:lua.vim.lsp.tagfunc"
--     end
--
--
--     nmap("K", vim.lsp.buf.hover, "Hover Documentation")
--     nmap("gd", vim.lsp.buf.definition, "[g]oto [d]efinition")
--     nmap("gD", vim.lsp.buf.declaration, "[g]oto [D]eclaration")
--     nmap("gr", vim.lsp.buf.references, "[g]oto [r]eferences")
--   end
-- })
--
-- -- Populate loclist with the current buffer diagnostics
-- vim.api.nvim_create_autocmd('DiagnosticChanged', {
--   callback = function(_)
--     vim.diagnostic.setloclist({open = false})
--   end,
-- })
--
-- require("neodev").setup({})
--
-- local lspconfig = require("lspconfig")
-- -- Lua LSP
-- lspconfig.lua_ls.setup({
--   settings = {
--     Lua = {
--       workspace = { checkThirdParty = false },
--       telemetry = { enable = false },
--       disable = { "missing-fields", "incomplete-signature-doc" }
--     }
--   }
-- })
--
-- require'lspconfig'.gopls.setup{}
