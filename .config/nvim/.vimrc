set number
call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " File Explorer | :NERDTree
    Plug 'scrooloose/NERDTree'
    
    " Vim Airline | Tells you your mode on the line below
    Plug 'vim-airline/vim-airline'
    
    " Vim Airline Themes | :Airlinetheme simple
    Plug 'vim-airline/vim-airline-themes'
    
    " Vim Code dark
    Plug 'tomasiser/vim-code-dark'
    
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    
    " Emmet-vim
    Plug 'mattn/emmet-vim'
    
    " Vim-Gitgutter
    Plug 'airblade/vim-gitgutter'
    
    " Commentary.vim | gcc = comment | gc = uncomment
    Plug 'tpope/vim-commentary'

    " fuzzy finder commandline finder | :Ag = searches directory and file content
    Plug 'junegunn/fzf.vim'

    " Fugutive is a git command wrapper
    Plug 'tpope/vim-fugitive'
    " Tab line
    Plug 'codota/tabnine-nvim' 
    " Rainbow bracket
    Plug 'frazrepo/vim-rainbow'
    " ALE for displayong errors and warnings in real time
    Plug 'dmerejkowsky/vim-ale'    
    
    " Tag bar | fh = opens the side bar
    Plug 'preservim/tagbar'
    
    " Dashboard | nvim = opens dashboard
    Plug 'glepnir/dashboard-nvim'    

    " Conqueror of Completion | CocInstall coc-python 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}




call plug#end()
