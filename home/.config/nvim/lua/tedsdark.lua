vim.api.nvim_command('highlight clear')

vim.o.background = 'dark'

local function highlight(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  local parts = {group}
  if guifg then table.insert(parts, 'guifg='..guifg) end
  if guibg then table.insert(parts, 'guibg='..guibg) end
  if ctermfg then table.insert(parts, 'ctermfg='..ctermfg) end
  if ctermbg then table.insert(parts, 'ctermbg='..ctermbg) end
  if attr then
    table.insert(parts, 'gui='..attr)
    table.insert(parts, 'cterm='..attr)
  end
  if guisp then table.insert(parts, 'guisp='..guisp) end
  vim.api.nvim_command('highlight '..table.concat(parts, ' '))
end

local teds_white = '#ffffff'
local teds_gray = '#bbbbbb'
local teds_background = '#14263F'
local teds_green = '#118855'
local teds_red = '#DD5566'
local teds_orange = '#dd7755'
local teds_blue = '#6699bb'
local teds_yellow = '#EEDA42'
local teds_pink = '#E95399'
local teds_magenta = '#BB5FE6'
local teds_teal = '#74CFA0'
local teds_apple = '#75B521'
local teds_purple = '#7223B7'
local teds_err = '#C81E1E'
local teds_brown = '#4A2216'
local teds_cyan = '#00FFF2'

local term_colors = {
  terminal_color_0 = teds_white,
  terminal_color_1 = teds_gray,
  terminal_color_2 = teds_background,
  terminal_color_3 = teds_green,
  terminal_color_4 = teds_red,
  terminal_color_5 = teds_orange,
  terminal_color_6 = teds_blue,
  terminal_color_7 = teds_yellow,
  terminal_color_8 = teds_pink,
  terminal_color_9 = teds_magenta,
  terminal_color_10 = teds_teal,
  terminal_color_11 = teds_apple,
  terminal_color_12 = teds_purple,
  terminal_color_13 = teds_err,
  terminal_color_14 = teds_brown,
  terminal_color_15 = teds_cyan,
}
for color, value in pairs(term_colors) do
  vim.g[color] = value
end

highlight('Normal', teds_white, teds_background, 'NONE', 'NONE', nil, nil)
highlight('Visual', nil, teds_blue, nil, nil, nil, nil)

-- Editor
highlight('MatchParen', teds_white, teds_green, nil, nil, nil, nil)
highlight('LineNr', teds_green, nil, nil, nil, nil, nil)
highlight('EndOfBuffer', teds_green, nil, 'NONE', 'NONE', nil, nil)

-- Gutter
highlight('SignColumn', nil, teds_gray, nil, nil, nil, nil)

-- Datatypes
highlight('Comment', teds_gray, nil, nil, nil, nil, nil)

highlight('Constant', teds_orange, nil, nil, nil, nil, nil) -- includes nil
highlight('String', teds_red, nil, nil, nil, nil, nil)
highlight('Character', teds_red, nil, nil, nil, nil, nil)
highlight('Number', teds_green, nil, nil, nil, nil, nil)
highlight('Float', teds_green, nil, nil, nil, nil, nil)
highlight('Boolean', teds_orange, nil, nil, nil, nil, nil)

highlight('Identifier', teds_apple, nil, nil, nil, nil, nil)
highlight('Function', teds_yellow, nil, nil, nil, nil, nil)

highlight('Statement', teds_orange, nil, nil, nil, nil, nil)
highlight('Operator', teds_yellow, nil, nil, nil, nil, nil)
highlight('Keyword', teds_orange, nil, nil, nil, nil, nil)
highlight('Exception', teds_err, nil, nil, nil, nil, nil)

highlight('PreProc', teds_magenta, nil, nil, nil, nil, nil)

highlight('Type', teds_pink, nil, nil, nil, nil, nil)
highlight('Structure', teds_pink, nil, nil, nil, nil, nil)

highlight('Special', teds_teal, nil, nil, nil, nil, nil)

highlight('Error', nil, teds_err, nil, nil, nil, nil, nil)

highlight('Todo', nil, teds_yellow, nil, nil, nil, nil)
