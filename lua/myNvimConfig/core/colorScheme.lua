local status, _ = pcall(vim.cmd, "colorscheme tokyodark")
if not status then
  print('Colorscheme not found')
  return
end


