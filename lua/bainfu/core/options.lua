vim.cmd("let g:netrw_liststyle = 3")

vim.scriptencoding = "utf-8"

local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.relativenumber = true
opt.number = true
opt.title = true
opt.backup = false

-- scrolling
opt.scrolloff = 10

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line 
opt.smartindent = true -- smart indent
opt.smarttab = true -- smart tab

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

-- turn on termguicolors for colorscheme to work
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = "cursor" -- keep cursor position when splitting window

opt.path:append({"**"}) -- search in current directory and subdirectories
opt.wildignore:append({"*/node_modules/*"}) -- ignore node_modules


