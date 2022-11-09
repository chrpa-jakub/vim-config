if &filetype == 'c' || &filetype == 'cpp'
  map <F5> :w <CR> :!g++ % -o compiled.out -ansi -pedantic -std=c++11 && ./compiled.out <CR>
endif


map <F2> :NERDTreeToggle <CR>
map <C-[> :cc <CR> 
map <PageDown> <Nop>
map <PageUp> <Nop>
