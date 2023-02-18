:fun! CFile()
:read !echo '\#include <stdio.h>'
:read !echo '\#include <stdlib.h>'
:read !echo ''
:read !echo 'int main(void){'
:read !echo '	'
:read !echo '}'
:exe 1
:d1
:exe 5
:call feedkeys('A', 'n') 
:endfun
:command CFile :call CFile()

