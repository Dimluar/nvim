local M = {}

function M.SetColorScheme(color, bg)
  color = color or 'catppuccin'
  bg = bg or false
  vim.cmd.colorscheme(color)

  vim.g.current_colorscheme = color
  vim.g.current_bg_transparency = bg

  if not bg then
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  end
end

function M.ToggleBgTransparency()
  -- vim.g.colors_name does not return the whole name (E.g. tokyonight instead of tokyonight-night)
  local color = vim.g.current_colorscheme
  local bg = not vim.g.current_bg_transparency
  M.SetColorScheme(color, bg)
end

return M
