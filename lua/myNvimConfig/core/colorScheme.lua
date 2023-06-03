local status, _ = pcall(vim.cmd, "colorscheme rose-pine-main")
if not status then
  print('Colorscheme not found')
  return
end
