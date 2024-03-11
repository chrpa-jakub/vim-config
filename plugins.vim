call plug#begin('~/.config/nvim/plugged')

Plug 'windwp/nvim-autopairs'

Plug 'itchyny/lightline.vim'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons' 

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'preservim/nerdcommenter'
" Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'p00f/nvim-ts-rainbow'
Plug 'turbio/bracey.vim'
" Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

call plug#end()
