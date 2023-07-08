local status, _ = pcall(vim.cmd, "colorscheme tokyodark")
if not status then
  print('Colorscheme not found')
  return
end

vim.g.tokyodark_enable_italic_comment = false,
vim.g.tokyodark_enable_italic  == false,
