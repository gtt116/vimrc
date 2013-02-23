
" Le mapping des touches
map <silent> q       mZ:call ToggleComment_toggle()<CR>`Z
map <silent> <S-q>   mZ:call ToggleComment_comment()<CR>`Z
map <silent> <A-q>   mZ:call ToggleComment_uncomment()<CR>`Z

command! -range Ct <line1>,<line2>call ToggleComment_toggle()
command! -range Cc <line1>,<line2>call ToggleComment_comment()
command! -range Cu <line1>,<line2>call ToggleComment_uncomment()


" Correspondance 'syntax' / 'comment symbol'
let s:comment_symbol = {
  \  'fortran'	:  'C',
  \  'matlab'	:  '%',
  \  'rien'    :  '~',
  \  'python'	:  '#',
  \  'vim'	:  '"',
  \  'c'	:  '//',
  \ }

" Indique les 'syntax' où la ligne doit rester inchangée 
let s:comment_in_place = {
  \  'fortran'	:  1,
  \ }

" Un séparateur pour le mode commande.
" Il doit être différent de tous les 'comment symbol'
let s:sep1 = ','
let s:sep2 = ':'
let s:sep3 = ';'


function! ToggleComment_GetSeparator(cs)
  if match(a:cs,s:sep1)==-1
    return s:sep1
  endif
  if match(a:cs,s:sep2)==-1
    return s:sep2
  endif
  if match(a:cs,s:sep3)==-1
    return s:sep3
  endif
  return ''
endfunction


function! ToggleComment_CleanCommentSymbol(in)
  let cs=a:in
  let cs=substitute(cs,'\s*$','','')
  return cs
endfunction


function! ToggleComment_GetCommentSymbol()
  " Check filetype
  let cft=&ft
  if cft=='' && exists("b:current_syntax")
    let cft=b:current_syntax
  endif
  if cft==''
    return '-1'
  endif
  " Find a value for the CommentSymbol
  " 1) script list first
  let cs=get(s:comment_symbol,cft)
  if cs!='0'
    let cs=ToggleComment_CleanCommentSymbol(cs)
    return cs
  endif
  " 2) check the 'commentstring' option
  let cs=''
  if match(&commentstring,"%s$")!=-1
    let cs=substitute(&commentstring,'\(^.*\)\(%s.*$\)','\1','')
    let cs=ToggleComment_CleanCommentSymbol(cs)
    if cs!=''
      return cs
    endif
  endif
  " 3) check the 'comments' option
  let cs=''
  let _lco=&comments.','
  let _cont=1
  while _cont!=0
    let _o=matchstr(_lco,'.\{-},\@=') 
    let _lco=substitute(_lco,'.\{-},','','')
    if match(_o,':')==0
      let cs=substitute(_o,':','','')
      let _cont=0
    endif
    if match(_lco,',')==-1
      let _cont=0
    endif
  endwhile
  let cs=ToggleComment_CleanCommentSymbol(cs)
  if cs!=''
    return cs
  endif
  " :( we find nothing
  return ''
endfunction


function! ToggleComment_init()
  "
  let cs=ToggleComment_GetCommentSymbol()
  if cs=='-1'
    echohl ErrorMsg
    echo 'comment plugin : filetype is not defined'
    echohl None
    return [0,'','']
  endif
  if cs==''
    echohl ErrorMsg
    echo 'comment plugin : comment symbol not found'
    echohl None
    return [0,'','']
  endif
  "
  let sep=ToggleComment_GetSeparator(cs)
  if sep==''
    echohl ErrorMsg
    echo 'comment plugin : cannot find correct separator'
    echohl None
    return [0,'','']
  endif
  return [1,cs,sep]
endfunction


function! ToggleComment_toggle()
  let out=ToggleComment_init()
  if out[0]==0
    return
  endif
  let cs=out[1]
  let sep=out[2]

  if get(s:comment_in_place,b:current_syntax)
    execute 's'.sep.'^\s'.sep.'\0'.cs.sep.'e'
    execute 's'.sep.'^\S'.sep.cs.' '.sep.'e'
    execute 's'.sep.'^.'.sep.sep.'e'
    return
  endif
  let dummy_cs=substitute(cs,".","X","g")
  let dot_ncs=substitute(cs,".","\.","g")
  execute 's'.sep.'\(^\s\+\)\('.cs.'\)'.sep.'\2\1'.sep.'e'
  execute 's'.sep.'^\('.cs.'\)\@!.\+'.sep.dummy_cs.cs.'\0'.sep.'e'
  execute 's'.sep.'^'.dot_ncs.sep.sep.'e'
endfunction


function! ToggleComment_comment()
  let out=ToggleComment_init()
  if out[0]==0
    return
  endif
  let cs=out[1]
  let sep=out[2]

  let dot_ncs=substitute(cs,".","\.","g")
  if get(s:comment_in_place,b:current_syntax)
    execute 's'.sep.'^'.dot_ncs.sep.cs.sep.'e'
    return
  endif
  execute 's'.sep.'^\(\s*'.cs.'\)\@!.\+'.sep.cs.'\0'.sep.'e'
endfunction


function! ToggleComment_uncomment()
  let out=ToggleComment_init()
  if out[0]==0
    return
  endif
  let cs=out[1]
  let sep=out[2]

  if get(s:comment_in_place,b:current_syntax)
    let space_ncs=substitute(cs,"."," ","g")
    execute 's'.sep.'^'.cs.sep.space_ncs.sep.'e'
    return
  endif
  execute 's'.sep.'\(^\s\+\)\('.cs.'\)'.sep.'\2\1'.sep.'e'
  execute 's'.sep.'^'.cs.sep.sep.'e'
endfunction

