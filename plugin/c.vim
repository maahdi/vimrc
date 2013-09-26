
function! c#ConfigC()

" OmniCppComplete
 let OmniCpp_NamespaceSearch = 1
 let OmniCpp_GlobalScopeSearch = 1
 let OmniCpp_ShowAccess = 1
 let OmniCpp_MayCompleteDot = 1
 let OmniCpp_MayCompleteArrow = 1
 let OmniCpp_MayCompleteScope = 1
 let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
 let OmniCpp_SelectFirstItem = 2

 " automatically open and close the popup menu / preview window
 au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
 set completeopt=menuone,menu,longest,preview

 " configure tags - add additional tags here or comment out not-used ones
 set tags+=~/.vim/tags/stl
 set tags+=~/.vim/tags/gl
 set tags+=~/.vim/tags/sdl
 set tags+=~/.vim/tags/qt4

 " build tags of your own project with CTRL+F12
 map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
 noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
 inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

 endfunction
