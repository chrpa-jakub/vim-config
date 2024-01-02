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

:fun! HtmlFile()
:read !echo '<\!DOCTYPE html>'
:read !echo '<html lang="en">' 
:read !echo '<head>'
:read !echo '	<meta charset="UTF-8">'
:read !echo '	<title>Title</title>'
:read !echo '</head>'
:read !echo '<body>'
:read !echo '	'
:read !echo '</body>'
:read !echo '</html>'
:exe 1
:d1
:exe 8 
:call feedkeys('A', 'n')
:endfun
:command HtmlFile :call HtmlFile()
:command W :w

:fun! GoFile()
:read !echo 'package main'
:read !echo ''
:read !echo 'import "fmt"'
:read !echo ''
:read !echo 'func main() {'
:read !echo '	'
:read !echo '}'
:exe 1
:d1
:exe 6
:call feedkeys('A', 'n') 
:endfun
:command GoFile :call GoFile()



if &filetype == 'cpp'
  :command Def :call CPPFile()
endif

if &filetype == 'go'
  :command Def :call GoFile()
endif

if &filetype == 'c'
  :command Def :call CFile()
endif

if &filetype == 'html'
  :command Def :call HtmlFile()
endif
