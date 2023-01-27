:set number
" :set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin('~/.config/nvim/autoload/plugged')
    set encoding=UTF-8

    use 'sheerun/vim-polyglot' -- Better Syntax Support

    use 'scrooloose/NERDTree' -- File Explorer | :NERDTree

    use 'vim-airline/vim-airline' -- Status Bar

    use 'vim-airline/vim-airline-themes' -- :Airlinetheme simple

    use 'tomasiser/vim-code-dark'

    use 'bronson/vim-trailing-whitespace' -- highlight trailing spaces

    use 'jiangmiao/auto-pairs' -- Auto pairs for '(' '[' '{'
    use 'tpope/vim-surround' -- Surrounding ysw

    use 'mattn/emmet-vim'

    use 'airblade/vim-gitgutter'

    use 'tpope/vim-commentary' -- gcc = comment | gc = uncomment

    use 'junegunn/fzf.vim' -- :Ag = searches directory and file content

    use 'tpope/vim-fugitive' -- Fugutive is a git command wrapper

    use 'codota/tabnine-nvim'

    use 'frazrepo/vim-rainbow'

    use 'dmerejkowsky/vim-ale' -- ALE for displayong errors and warnings in real time

    use 'preservim/tagbar' -- Tag bar | fh = opens the side bar

    use 'glepnir/dashboard-nvim'
    use 'nvim-lualine/lualine.nvim'

    use 'neoclide/coc.nvim', {'branch': 'release'} -- Auto completion
    -- :CocInstall coc-python | :CocInstall coc-clangd | :CocInstall coc-snippets
    -- :CocCommand snippets.edit... FOR EACH FILE TYPE

    use 'lifepillar/pgsql.vim' -- PSQL pluging needs :SQLSetType pgsql.vim
    use 'ap/vim-css-color' -- CSS Color Preview
    use 'rafi/awesome-vim-colorschemes' -- Retro Scheme
    use 'ryanoasis/vim-devicons' -- Developer Icons
    use 'tc50cal/vim-terminal' -- Vim Terminal
    use 'terryma/vim-multiple-cursors' -- CTRL + N for multiple cursors


call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nmap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme default

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
