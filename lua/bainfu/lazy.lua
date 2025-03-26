local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "bainfu.plugins" }, { import = "bainfu.plugins.lsp"} }, {
  checker = {
    enabled = true,
    notify = false
  },
  change_detection = {
    notify = false,
  },
})


vim.opt.autoread = true

-- refresh files if changed outside
vim.fn.timer_start(2000, function()
  vim.cmd("silent! checktime")
end, { ["repeat"] = -1 })
