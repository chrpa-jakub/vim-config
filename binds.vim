if &filetype == 'c' || &filetype == 'cpp'
  map <F5> :w <CR> :! g++ % -o %<.out -ansi -pedantic -std=c++20 -Wall && ./%<.out <CR>
  map <F6> :w <CR> :! g++ % -o %<.out -ansi -pedantic -std=c++20 -Wall  -g -fsanitize=address && ./%<.out -fpermissive <CR>
endif

if &filetype == 'rust'
  map <F5> :w <CR> :!cargo run <CR>
endif

if &filetype == 'html' || &filetype == 'css' 
  map <F5> :w <CR> :StartBrowserSync <CR> :!vivaldi localhost:3000 --parent-window<CR>
endif

if &filetype == 'svelte'
    map <F5> :w <CR> :!npm run dev&<CR> :!vivaldi http://localhost:5173<CR> 
endif

if &filetype == 'go'
    map <F5> :w <CR> :!go run .<CR>
endif

map <F3> :let oldline = line(".") <CR> gg=G <CR> :exe oldline <CR> <C-l>
map <F2> :NERDTreeToggle <CR>
map § $
map ů 0
map ú [m
map ) ]m 
map <A-ú> {
map <A-)> }
map <C-[> :cc <CR> 
map <PageDown> <Nop>
map <PageUp> <Nop>
let mapleader=","
inoremap <leader>p "1p 
map <F1> <Nop>

nnoremap <C-c> <C-a>

au VimEnter * :silent ! xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * :silent ! xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

nnoremap <leader>p "2p
