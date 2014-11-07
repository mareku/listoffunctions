

let s:save_cpo = &cpo
set cpo&vim

function! listoffunctions#toggle()
  for i in range(0,bufnr('$'))
    if getbufvar(winbufnr(i),'&buftype')=='quickfix'
      echo "Quickfix Close"
      ccl
      return
    endif
  endfor
  try
    if &filetype=='python'
        vim /\(def\|function\)\s*/ % | cw
      elseif &filetype=='php'
        vim /^\s*\(public\|protected\|private\)\=\s*\(static\)\=\s*function\s*(*/ % | cw
      elseif &filetype=='vim'
        vim /\(function\|function!\)\s/ % | cw
      else
        echo "unknown filetype"
      endif
  catch
    echo "unknown gara"
  endtry

endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
