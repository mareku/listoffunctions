
if exists("g:loaded_listoffunctions")
  finish
endif
let g:loaded_listoffunctions = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=0 ListOfFunctions call listoffunctions#toggle()

let &cpo = s:save_cpo
unlet s:save_cpo
