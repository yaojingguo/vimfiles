function! Init()
  " echo "Command: " . a:cmd
  let l:suffixes = &suffixesadd
  let l:count = 0
  for suffix in split(l:suffixes, ",")
    let l:count = l:count + 1
    echo "suffix: " . suffix
  endfor
  echo l:suffixes
  echo l:count
endfunction

" https://vim.fandom.com/wiki/Find_files_in_subdirectories
"set Find
function! Find(...)
  if a:0==2
    let path=a:1
    let l:name=a:2
  else
    let path="."
    let l:name=a:1
  endif


  let l:suffixes = []
  for suffix in split(&suffixesadd, ",")
    call add(l:suffixes, suffix)
  endfor
  call add(l:suffixes, "")

  let l:found = 0
  
  for suffix in suffixes
    let l:list=system("find ".path." -name '*.class' -prune -o -path '*/.svn' -prune -o -name '".l:name.suffix."' -print | perl -ne 'print \"$.\\t$_\"'")
    let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
    if l:num < 1
      continue
    else
      let l:found = 1
      if l:num > 1
        echo l:list
        let l:input=input("Which ? (CR=nothing)\n")
        if strlen(l:input)==0
          return
        endif
        if strlen(substitute(l:input, "[0-9]", "", "g"))>0
          echo "Not a number"
          return
        endif
        if l:input<1 || l:input>l:num
          echo "Out of range"
          return
        endif
        let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
      else
        let l:line=l:list
      endif

      let l:line=substitute(l:line, "^[^\t]*\t", "", "")
      execute ":e ".l:line
    endif
  endfor

  if l:found == 0
    echo "'".l:name."' not found"
    return
  endif

endfunction
command! -nargs=* Fd :call Find(<f-args>)
nnoremap gf :call Find(expand('<cfile>'))<CR>

