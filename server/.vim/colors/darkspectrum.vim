" Vim color file
"
" Author: Brian Mock <mock.brian@gmail.com>
" Author: Sander Mathijs van Veen <smvv@kompiler.org>
"
" Note: Based on Oblivion color scheme for gedit (gtk-source-view)
"       and based on Brian Mock's darkspectrum color theme.
"
" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear

    if exists("syntax_on")
        syntax reset
    endif
endif

set background=dark

let g:colors_name="darkspectrum"

hi Normal term=none cterm=none ctermfg=white ctermbg=none gui=none guifg=white guibg=black

" highlight groups
hi Cursor       ctermfg=16 ctermbg=231 guifg=#000000 guibg=#ffffff
hi CursorLine   ctermbg=16 guibg=#000000
"hi CursorColumn guibg=#464646

hi DiffAdd      cterm=none ctermfg=fg guibg=#119e21
hi DiffDelete   cterm=none ctermfg=fg
hi DiffChange   cterm=none ctermfg=fg guibg=#19119e
hi DiffText     cterm=none ctermfg=fg guifg=#ffffff guibg=#9e1111

hi Number       ctermfg=221 guifg=#fce94f

hi Folded       cterm=bold ctermfg=231 guifg=#ffffff guibg=#000000 gui=bold
hi vimFold      cterm=bold ctermfg=231 guifg=#ffffff guibg=#000000 gui=bold
hi FoldColumn   cterm=bold ctermfg=231 guifg=#ffffff guibg=#000000 gui=bold

hi LineNr       ctermfg=240 guifg=#636363
hi NonText      ctermfg=240 guifg=#636363
hi Folded       cterm=bold ctermfg=240 ctermbg=none guifg=#666666 gui=bold
hi FoldeColumn  cterm=bold ctermfg=240 ctermbg=none guifg=#636363 gui=bold

hi VertSplit    cterm=none ctermfg=236 guifg=#3c3c3c gui=none
hi StatusLine   cterm=none ctermfg=231 guifg=#ffffff gui=none
hi StatusLineNC cterm=none ctermfg=243 guifg=#808080 gui=none

hi ModeMsg      ctermfg=221 guifg=#fce94f
hi MoreMsg      ctermfg=221 guifg=#fce94f
hi Visual       cterm=none ctermfg=231 ctermbg=25 guifg=#ffffff guibg=#3465a4 gui=none
hi VisualNOS    cterm=none ctermfg=231 ctermbg=18 guifg=#ffffff guibg=#204a87 gui=none
hi IncSearch    ctermfg=202 ctermbg=231 guifg=#ef5939 guibg=#ffffff
hi Search       ctermfg=231 ctermbg=100 guifg=#ffffff guibg=#818800
hi SpecialKey   ctermfg=112 guifg=#8ae234

hi Title        ctermfg=202 guifg=#ef5939
hi WarningMsg   ctermfg=202 guifg=#ef5939
hi Number       ctermfg=214 guifg=#fcaf3e

hi MatchParen   ctermfg=231 guifg=#ffffff guibg=#ad7fa8
hi Comment      ctermfg=244 guifg=#8a8a8a
hi Constant     cterm=none ctermfg=202 guifg=#ef5939 gui=none
hi String       ctermfg=221 guifg=#fce94f
hi Identifier   ctermfg=74  guifg=#729fcf
hi Statement    cterm=bold ctermfg=231 guifg=#ffffff gui=bold
hi PreProc      cterm=bold ctermfg=231 guifg=#ffffff gui=bold
hi Type         cterm=bold ctermfg=112 guifg=#8ae234 gui=bold
hi Special      ctermfg=179 guifg=#e9b96e
hi Underlined   cterm=underline ctermfg=139 guifg=#ad7fa8 gui=underline
hi Directory    ctermfg=74 guifg=#729fcf
hi Ignore       ctermfg=239 guifg=#555753
hi Todo         ctermfg=231 guifg=#ffffff guibg=#ef5939 gui=bold
hi Function     ctermfg=139 guifg=#ad7fa8

"hi WildMenu     guibg=#2e3436 guifg=#ffffff gui=bold
"hi WildMenu     guifg=#7fbdff guibg=#425c78 gui=none
hi WildMenu     cterm=none ctermfg=231 guifg=#ffffff guibg=#3465a4 gui=none

hi Pmenu        guifg=#c0c0c0 guibg=#000000
hi PmenuSel     guifg=#ffffff guibg=#3465a4
hi PmenuSbar    guifg=#444444 guibg=#444444
hi PmenuThumb   guifg=#888888 guibg=#888888

hi cppSTLType   cterm=bold guifg=#729fcf gui=bold

" hi spellBad     guisp=#fcaf3e cterm=underline
" hi spellCap     guisp=#73d216
" hi spellRare    guisp=#ad7fa8
" hi spellLocal   guisp=#729fcf

hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl


hi link cppSTL          Function
hi link Error           Todo
hi link Character       Number
hi link rubySymbol      Number
hi link htmlTag         htmlEndTag
"hi link htmlTagName     htmlTag
hi link htmlLink        Underlined
hi link pythonFunction  Identifier
hi link Question        Type
hi link CursorIM        Cursor
hi link VisualNOS       Visual
hi link xmlTag          Identifier
hi link xmlTagName      Identifier
hi link shDeref         Identifier
hi link shVariable      Function
hi link rubySharpBang   Special
hi link perlSharpBang   Special
hi link schemeFunc      Statement
"hi link shSpecialVariables Constant
"hi link bashSpecialVariables Constant

" Vim layout ------------------------------------------------------------------
" tabs (non gui)
hi TabLine      cterm=none guifg=#a3a3a3 guibg=#202020 gui=none
hi TabLineFill  cterm=none guifg=#535353 guibg=#202020 gui=none
hi TabLineSel   cterm=bold guifg=#ffffff gui=bold

hi ColorColumn  ctermbg=88 guibg=#990000

" Pyflakes warning and errors
hi pyflakes     cterm=underline ctermfg=178 guifg=#ccaa00 gui=underline

" Vim spell checker

" vim: sw=4 ts=4
