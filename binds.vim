if &filetype == 'c' || &filetype == 'cpp'
  map <F5> :w <CR> :! g++ % -o %<.out -ansi -pedantic -std=c++17 && ./%<.out <CR>
  map <F6> :w <CR> :! g++ % -g -fsanitize=address -o debug_%<.out -std=c++17 -ansi -pedantic && ./debug_%<.out <CR>
endif


map <F2> :NERDTreeToggle <CR>
map <C-[> :cc <CR> 
map <PageDown> <Nop>
map <PageUp> <Nop>
