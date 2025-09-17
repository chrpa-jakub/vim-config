augroup DocxAsMarkdown
  autocmd!
  autocmd BufReadPost *.docx call s:OpenDocxAsMarkdown(expand('%:p'))
augroup END

function! s:OpenDocxAsMarkdown(file)
    let b:docx_file = a:file
    setlocal fileencoding=utf-8
    silent %delete _
    silent execute '0read !pandoc -f docx -t markdown+hard_line_breaks --output=- ' . shellescape(a:file)
    setlocal filetype=markdown
    execute 'file ' . fnamemodify(a:file, ':t:r') . '.md'
    augroup DocxSaveAsMarkdown
        autocmd! * <buffer>
        autocmd BufWriteCmd <buffer> call s:SaveMarkdownAsDocx()
    augroup END
endfunction

function! s:SaveMarkdownAsDocx()
    let l:docxfile = b:docx_file
    let l:tmpfile = tempname() . '.md'
    silent execute 'write! ' . fnameescape(l:tmpfile)
    let l:cmd = 'pandoc -f markdown -t docx -o ' . shellescape(l:docxfile) . ' ' . shellescape(l:tmpfile)
    silent execute '!' . l:cmd
    call delete(l:tmpfile)
    setlocal nomodified
    echo 'Saved as ' . l:docxfile
endfunction

