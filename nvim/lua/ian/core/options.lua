local opt = vim.opt -- for conciseness

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true -- replaces some tab symbols
opt.autoindent = true -- copy spaces from current line to the next created line
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignores case if search is with small letters only
opt.smartcase = true -- if search has capital letters, then it will look for exact match

-- appearance
opt.termguicolors = true
opt.background = "dark" -- make dark as default for themes, if available
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.mouse="a"
