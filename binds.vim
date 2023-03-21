if &filetype == 'c' || &filetype == 'cpp'
  map <F5> :w <CR> :! g++ % -o %<.out -ansi -pedantic -std=c++20 -Wall && ./%<.out <CR>
  map <F6> :w <CR> :! g++ % -o %<.out -ansi -pedantic -std=c++20 -Wall  -g -fsanitize=address && ./%<.out <CR>
endif

if &filetype == 'html' || &filetype == 'css' || &filetype == 'php'
  map <F5> :w <CR> :Bracey <CR>
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
map <F1> <Nop>

au VimEnter * :silent ! xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * :silent ! xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
