" =============================================================================
" Vim config file -- Sander Mathijs van Veen <smvv@kompiler.org> -- since 2011
" =============================================================================

set nocompatible " Be iMproved!

" Terminal configuration
" -----------------------------------------------------------------------------

set background=dark
set t_Co=256
set title           " change the terminal's title
set ttyfast

" Vundle
" -----------------------------------------------------------------------------

"filetype on      " disable OS X exit with non-zero error code
filetype off     " disabled to work around vundle ftdetect bug

" required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Utility repos
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'wincent/Command-T'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/nerdcommenter'

" Syntax checking
Plugin 'dense-analysis/ale'
Plugin 'neoclide/coc.nvim'

" Language repos
Plugin 'groenewege/vim-less'
Plugin 'fatih/vim-go'
Plugin 'ambv/black'
Plugin 'prettier/vim-prettier'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'Quramy/vim-js-pretty-template'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

" Disable visual bells
" -----------------------------------------------------------------------------

set visualbell      " don't beep
set noerrorbells    " don't beep
set vb t_vb=        " don't beep

" User inteface options
" -----------------------------------------------------------------------------

set modeline        " Check beginning and end of file for file-specific Vim
                    " settings. Modelines contain the string "vim:" or "ex:".
set autoread        " Read the contents of a file, if it has been modified.
set autowrite       " Write the contents of the file, if it has been modified.
                    " When <C-Z> is pressed, Vim will write to the file.
set showcmd         " Show (partial) command in the last line of the screen.
set showmode        " Show paste mode in the last line of the screen.
set cmdheight=1     " Number of screen lines to use for the command-line.


" Wildmenu
set wildmenu        " use wildmenu
set wildcharm=<TAB> " autocomplete
set wildignore=*.swp,*.bak,*.pyc,*.class,*.old

" Don't search inside NPM packages
set wildignore+=*/node_modules

" Don't search inside android build dirs
set wildignore+=*/android/build
set wildignore+=*/android/app/build

" Don't search inside govendor dirs.
set wildignore+=*/vendor

" Don't search inside pytest-cov dirs.
set wildignore+=*/htmlcov

" Enable persistent undo history
set undofile
set undodir=~/.vim/undo
set history=1000    " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo

" Set utf-8 encoding as default encoding
set encoding=utf-8
set fileencodings=utf-8,cp1251
set termencoding=utf-8

function! LinterStatus() abort
    let l:buffer = bufnr('')

    try
        let l:counts = ale#statusline#Count(buffer)

        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors

        if l:counts.error
            " Try to get the first error from ALE.
            let l:first_error = ale#statusline#FirstProblem(l:buffer, "error")
        endif

        if l:counts.total == 0
            return ''
        endif

        return printf(
        \   'Line: %s (%dW %dE)',
        \   first_error.lnum,
        \   all_non_errors,
        \   all_errors
        \)
    catch
        return "Fail"
    endtry
endfunction

" My OMGWTFBBQ statusline
set statusline=%f      " path from cwd to filename
set statusline+=\ \    " separator

set statusline+=%h     " help file flag
set statusline+=%m     " modified flag
set statusline+=%r     " read only flag
set statusline+=%=     " left/right separator


set statusline+=%#warningmsg#
set statusline+=%{LinterStatus()}
set statusline+=%0*    " set default colors
set statusline+=\      " separator

set statusline+=%#Comment#  " change colors
set statusline+=%y     " filetype
" set statusline+=%0*    " set default colors
" set statusline+=\      " separator
" set statusline+=%#Constant#  " change colors
" set statusline+=%{fugitive#statusline()} " git status line
set statusline+=%0*    " set default colors
set statusline+=\      " separator

set statusline+=%c,    " cursor column
set statusline+=%l/%L  " cursor line/total lines
set statusline+=\ %P   " percent through file

" NERD Tree
let NERDTreeShowHidden = 1

" UltiSnips
ca use UltiSnipsEdit
set runtimepath+=~/.vim/
" let g:UltiSnipsDontReverseSearchPath = "1" " workaround Vundle
" let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
let g:UltiSnipsSnippetDirectories = ["custom_snippets"]
let g:UltiSnipsEditSplit = "horizontal"
let g:UltiSnipsListSnippets = "<c-l>"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Command-T
let g:CommandTFileScanner = "watchman"  " use watchman for fast file scanning
let g:CommandTTraverseSCM = "pwd"  " use working directory as root for finder

" Color theme and styling
" -----------------------------------------------------------------------------
if !has('gui_running')
    " Use the guicolorscheme plugin to makes 256-color or 88-color terminal
    " use GUI colors rather than cterm colors
    runtime! plugin/guicolorscheme.vim
    GuiColorScheme darkspectrum
else
    colorscheme darkspectrum
endif

" Highlight current line
au ColorScheme * hi CursorLine term=underline ctermbg=darkblue

" Highlight search color
hi! Search term=reverse ctermfg=255 ctermbg=130

" Make sign column same color as theme
"highlight clear SignColumn
hi! link SignColumn LineNr

" Whitespace control
" -----------------------------------------------------------------------------

"filetype plugin indent on

set backspace=indent,eol,start
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set expandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=4
set scrolloff=2   " 2 lines above/below cursor when scrolling
set smarttab      " insert tabs on the start of a line according to
                  " shiftwidth, not tabstop
set tabstop=4
set textwidth=79
set colorcolumn=80

au BufNewFile,BufRead *.{html,css,js,json} set tabstop=2
au BufNewFile,BufRead *.{html,css,js,json} set shiftwidth=2

" Show tabs as symbols
set listchars=tab:>\ ,trail:·,extends:⋯,precedes:⋯
set list

" When editing a git commit message (.git/COMMIT_EDITMSG) you often won't start
" on the first line due to Vim remembering your last position in that file
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

" Search behaviour
" -----------------------------------------------------------------------------

set ignorecase    " ignore case when searching
set incsearch     " show search matches as you type
set hlsearch      " highlight search terms
set smartcase     " ignore case, if search pattern is all lowercase,
                  " case-sensitive otherwise

" Fix Vim's default key bindings
" -----------------------------------------------------------------------------

" Vertical align the line of next / previous matching search result
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" Use Q for formatting the current paragraph or selection
vmap Q gq
nmap Q gqap

" Visual shifting without exiting visual mode
vnoremap < <gv
vnoremap > >gv

" Nice scrolling if line is wrapped
noremap j gj
noremap k gk

" Make Y behave like other capitals
map Y y$

" Split line (opposite to S-J joining line)
nnoremap <silent> <C-J> gEa<CR><ESC>ew

" Use sane regexes
nnoremap / /\v
vnoremap / /\v

" Handy keyboard shortcuts
" -----------------------------------------------------------------------------

" It clears the search buffer (and highlighting)
nmap <silent> <leader>/ :nohlsearch<CR>

nnoremap <leader>t :GFiles<Cr>
nnoremap <leader>g :Ag<Cr>

" Invoke `sort' command on line selection
nmap <leader>s Vip :!sort<CR>
vmap <silent> <leader>s :!sort<CR>

" Invoke `make' commands
nmap <silent> <F5> :!make<CR>

nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :call StripTrailingWhitespaces()<CR>
nnoremap <F10> :set invpaste paste?<CR>
set pastetoggle=<F10>

" Show syntax highlighting groups for word under cursor
nmap <F11> :call <SID>DisplaySyntaxGroup()<CR>

noremap <S-Up> <Nop>
noremap <S-Down> <Nop>
noremap <S-Left> <Nop>
noremap <S-Right> <Nop>

" File type corrections for Vim
" -----------------------------------------------------------------------------

" Vim 7.3 does not detect "index ..." lines in filetype=diff
au BufRead,BufNewFile *.patch syn match diffFile "^index .*$"

" Vim 7.3 does not set the proper filetype for TeX files
au BufNewFile,BufRead *.tex set ft=tex
au BufNewFile,BufRead *.md set ft=markdown
au BufNewFile,BufRead *.hbs set ft=html

" Disable opening the quickfix after parsing errors.
let g:prettier#quickfix_enabled = 0

" Run vim-prettier on save.
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.yaml,*.md,*.vue,*.html PrettierAsync

let g:go_fmt_command = "goimports"

let g:ale_linters = {
    \ 'javascript': ['eslint', 'flow'],
    \ 'javascript.jsx': ['eslint', 'flow'],
    \ 'python': ['flake8', 'pylint'],
    \ 'go': ['gobuild', 'gofmt', 'govet'],
    \ }

" Python specific
autocmd BufWritePre *.py,*.pyi execute ':Black'
au BufNewFile,BufRead *.py,*.pyi set textwidth=87 colorcolumn=88

" Miscellaneous utility functions
" -----------------------------------------------------------------------------

function! StripTrailingWhitespaces()
    " prelude
    let _s=@/
    let l = line(".")
    let c = col(".")
    " business time
    %s/\s\+$//e
    " epilogue
    let @/=_s
    call cursor(l, c)
endfunction

"function! <SID>SynStack()
function! <SID>DisplaySyntaxGroup()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Autocompletion for typescript
" -----------------------------------------------------------------------------

" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
