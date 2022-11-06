if &filetype == 'c' || &filetype == 'cpp'
  map <F5> :!g++ % -o compiled.out -ansi -pedantic -std=c++11 && ./compiled.out <CR>
endif


map <F2> :NERDTreeToggle <CR>


