function! php#PhpConfigPerso() 
    set omnifunc=phpcomplete#CompletePHP
    set tabstop=4
    set shiftwidth=4
    let g:syntastic_php_checkers=['php','phpmd']
    "Permet de faire tous les checkers et display après
    let g:syntastic_aggregate_errors=1        " idem mode insertion"
    let g:syntastic_check_on_open=0
    "autocmd BufWrite *.php execute ":SyntasticCheck"
    "autocmd InsertLeave *.php execute ":SyntasticCheck"
    "Ouvre automatiquement la liste des erreurs et la ferme si pas d'erreur
    let g:syntastic_auto_loc_list=0
    "Actualise la fenetre avec la liste des erreurs
    let g:syntastic_always_populate_loc_list=1

endfunction 

function! InsertCloseTag()
  " inserts the appropriate closing HTML tag
  " may require ignorecase to be set, or to type HTML tags in exactly the same case
  if &filetype == 'html' || &filetype=='php' || &filetype=='xml'
  
    " list of tags which shouldn't be closed:
    let UnaryTags = ' Area Base Br br BR DD dd Dd DT dt Dt HR hr Hr Img img IMG input INPUT Input li Li LI link LINK Link meta Meta p P Param param PARAM '

    " remember current position:
    normal mz
    normal mw

    " loop backwards looking for tags:
    let Found = 0
	let NBL = 0
    while Found == 0
		 let NBL = NBL+1
		 if NBL == 50
			 break
		endif

      " find the previous <, then go forwards one character and grab the first
      " character plus the entire word:
      execute "normal ?\<LT>\<CR>l"
      normal "zyl
      let Tag = expand('<cword>')

      " if this is a closing tag, skip back to its matching opening tag:
      if @z == '/'
        execute "normal ?\<LT>" . Tag . "\<CR>"

      " if this is a unary tag, then position the cursor for the next
      " iteration:
      elseif match(UnaryTags, ' ' . Tag . ' ') > 0
        normal h

      " otherwise this is the tag that needs closing:
      else
        let Found = 1

      endif
    endwhile " not yet found match

    " create the closing tag and insert it:
    let @z = '</' . Tag . '>'
    normal `z"zp
	normal `w
	execute "normal />\<cr>"
  else " filetype is not HTML
	normal mw
    let @z = '</'
    normal "zp`wll
  endif " check on filetype
endfunction " InsertCloseTag()
imap <lt>/ <Esc>:call InsertCloseTag()<CR>a

