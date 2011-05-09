noremap <F5> :wa<Enter>:!make<Enter>
noremap <F6> :wa<Enter>:!make final<Enter>
noremap <F7> :!open Thesis.pdf<Enter>
set listchars=eol:$,tab:·\ ,trail:=,extends:>,precedes:<
set list
set foldmarker=\\begin,\\end
set foldmethod=marker
set spelllang=fr
set spell
highlight Folded term=standout ctermfg=Black ctermbg=DarkGray
