:fun! CFile()
:read !echo '\#include <stdio.h>'
:read !echo '\#include <stdlib.h>'
:read !echo ''
:read !echo 'int main(void){'
:read !echo '	'
:read !echo '	return 0;'
:read !echo '}'
:exe 1
:d1
:exe 5
:call feedkeys('A', 'n') 
:endfun
:command CFile :call CFile()

:fun! CPPFile()
:read !echo '\#include <iostream>'
:read !echo ''
:read !echo 'using namespace std;'
:read !echo ''
:read !echo 'int main(void){'
:read !echo '	'
:read !echo '	return 0;'
:read !echo '}'
:exe 1
:d1
:exe 6
:call feedkeys('A', 'n') 
:endfun
:command CPPFile :call CPPFile()

if &filetype == 'cpp'
  :command Def :call CPPFile()
endif

if &filetype == 'c'
  :command Def :call CFile()
endif
