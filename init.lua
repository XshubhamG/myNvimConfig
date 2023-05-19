print('hello')
require('myNvimConfig.plugin-setup')

-- core nvim setup
require('myNvimConfig.core.keymaps')
require('myNvimConfig.core.colorScheme')
require('myNvimConfig.core.options')

-- plguin setup
require('myNvimConfig.plugins.comments')
require('myNvimConfig.plugins.nvim-tree')
require('myNvimConfig.plugins.lualine')
require('myNvimConfig.plugins.telescope')
require('myNvimConfig.plugins.cmp')
require('myNvimConfig.plugins.lsp')
require('myNvimConfig.plugins.tree-sitter')
require('myNvimConfig.plugins.autopairs')
require('myNvimConfig.plugins.null-ls')
require('myNvimConfig.plugins.bufferline')
