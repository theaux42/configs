vim.cmd([[
  set tabstop=2        " La largeur d'un tab est de 2 espaces
  set shiftwidth=2     " L'indentation avec >> ou << est de 2 espaces
  set softtabstop=2    " Lorsqu'on appuie sur Tab, il insère 2 espaces
  set noexpandtab      " Utiliser des vraies tabulations au lieu d'espaces
	set relativenumber
]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo,
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup for distant and neo-tree compatibility
 vim.api.nvim_create_autocmd("DirChanged", {
  pattern = "*",
  callback = function()
    -- Change the directory in neo-tree to match the new working directory
    require("neo-tree.command").execute({
      action = "focus",
      source = "filesystem",
      position = "right", -- Change "left" if your neo-tree panel is elsewhere
      cwd = vim.fn.getcwd(),
    })
  end,
})

-- Setup lazy.nvim
require("lazy").setup("plugins")

-- Setup bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
