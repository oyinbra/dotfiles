set number
call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Vim Airline
    Plug 'vim-airline/vim-airline'
    " Vim Airline Themes
    Plug 'vim-airline/vim-airline-themes'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " Vim Code dark
    Plug 'tomasiser/vim-code-dark'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Emmet-vim
    Plug 'mattn/emmet-vim'
    " Vim-Gitgutter
    Plug 'airblade/vim-gitgutter'
    " Commentary.vim
    Plug 'tpope/vim-commentary' 
    " fzf commandline finder
    Plug 'junegunn/fzf.vim'
    " Fugutive is a git command wrapper
    Plug 'tpope/vim-fugitive'
    " Tab line
    Plug 'codota/tabnine-nvim' 
    " Rainbow bracket
    Plug 'frazrepo/vim-rainbow'
    


call plug#end()
