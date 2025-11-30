vim.opt.nu = true
vim.opt.wrap = true
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    -- Exception: Force spaces for YAML files only
    if args.match == "yaml" then
      vim.opt_local.expandtab = true
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
    else
      -- Everyone else gets tabs
      vim.opt_local.expandtab = false
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
    end
  end,
})
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true


vim.opt.scrolloff = 12
