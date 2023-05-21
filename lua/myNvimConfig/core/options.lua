local opt = vim.opt   -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentations
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wraping 
opt.wrap = true

-- search settings 
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance 
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "no"

-- clipboard
opt.clipboard:prepend("unnamed")

--split window
opt.splitright = true
opt.splitbelow = true

-- transparent background
-- vim.api.nvim_set_hl(0, 'Normal',{bg = 'none'})

-- terminal
opt.shell='pwsh'
opt.shellcmdflag='-command'
opt.shellquote= '\"'
opt.shellxquote= ''
