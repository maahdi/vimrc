set nocompatible
filetype off			"Required
if has("mouse")
    set mouse=a
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Set leader to ,
let mapleader   = ","

"Let vundle manage vundle
Bundle 'gmarik/vundle'


"BUNDLES here
Bundle 'michalbachowski/vim-wombat256mod'
Bundle 'vim-scripts/vim-auto-save'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/AutoClose'
Bundle 'vim-scripts/Align'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'vim-scripts/yaml.vim'
Bundle 'vim-scripts/python.vim--Vasiliev'
Bundle 'vim-scripts/pythoncomplete'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/powerline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'qbbr/vim-twig'

nnoremap <Leader>bi :BundleInstall<CR>
nnoremap <Leader>bu :BundleInstall!<CR>
nnoremap <Leader>bc :BundleClean<CR>



filetype indent on 	"Required
filetype plugin on
set number
colorscheme wombat256mod
set encoding=utf-8
set t_co=256
set enc=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"AUTOSAVE
let g:auto_save = 1

"NERDTREE
nnoremap <silent> <F9> :NERDTree /srv/http/workspace<CR>
let NERDTreeChDirMode = 2  "cd dans workspace

"TAGLIST
nnoremap <silent> <F8> :TagbarToggle<CR>
"let Tlist_Exit_OnlyWindow          = 1                " Fermeture si unique onglet
"let Tlist_Process_File_Away        = 1                " Activation permanente pour la barre de status
"let Tlist_Use_Right_Window         = 1
"let Tlist_Gain_Focus_On_ToggleOpen = 0
"let generate_tags                  = 1
"let Tlist_Ctags_Cmd                = '/usr/bin/ctags'

"AUTOCLOSE
"command! AutoCloseOn :let s:running = 1

"""""""""""""WORD_COMPLETE
"""""""""""""source ~/.vim/bundle/word_complete.vim/plugin/word_complete.vim
"""""""""""""autocmd BufEnter * call DoWordComplete() 

"AUTRES
"set ttymouse=urxvt
set autoread                        " Set to auto read when a file is changed from the outside
nmap <Leader>w :w!<CR>              " Fast saving
" <F1> sudo saves the file
map <F1> <ESC>:w !sudo tee % > /dev/null<CR> 
set so=7                            " Set 7 lines to the cursor when moving vertically using j/k
set wildmenu                        " Turn on wildmenu
set backspace=eol,start,indent      " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set ignorecase                      " Ignore case when serching
set hlsearch
set incsearch
set lazyredraw                      " Don't redraw while executig macros
set showmatch                       " Show matching brackets when text-indicator is over them
set mat=2                           " How many tenths of a second to blink when matching brackets
set foldcolumn=1                    " A bitt extra margin to the left
syntax enable
set ffs=unix,dos,mac                " Use Unix as the standard file type
set expandtab                       " Use spac instead of tabs
set smarttab                        " Be smart with tabs
set shiftwidth=4                    " Use 4 space for 1 tab
set tabstop=4
set lbr                             " Linebreak on 500 char
set tw=500
set ai                              " AutoIndent
set si                              " Smart Indent
set wrap                            " Wrap lines
set ruler                           " Affiche toujours la position courante
set noswapfile                      " desactive les creation de .swp
set ttyfast
set nospell
set showcmd
set fileformats=unix,mac,dos        "gestion des retours charoits selon le type du fichier
setglobal fileencoding=utf-8
set bomb
set termencoding=utf-8


"MAPPING
nmap <silent> <C-k> :wincmd k<CR>    " Move between windows
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
map <silent> <Leader><CR> :noh<CR>   " Efface la surbrillance
map <Leader>cd :cd %:p:h<CR>:pwd<CR> " Switch CWD to the directory of the open buffer
map <C-a> ggVG                       " Selectionne tout
map <tab> gt                         " Navigation entre les onglets
map <Leader>t :tabnew<CR>            " Ouvre un onglet
map <Leader>w :tabclose<CR>          " Ferme un onglet
map <C-Right> :tabn<CR>              " Onglet de droite mode commande
imap <C-Right> <C-O>:tabn<CR>        " idem mode insertion
map <C-Left> :tabp<CR>
imap <C-Left> <C-O>:tabp<CR>
map <F3> <ESC>:set nu!<CR>           " Nouvelle page vide
map <F2> <ESC>:w<CR>                 " <F2> save file
"Ctrlp pour voir dans les tags
nnoremap <leader>. :CtrlPTag<CR>

"Agrandit en hauteur les fenetres dans les écrans splitter
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>


"BARRE DE STATUS
"set statusline=%t%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [FENC=%{&fileencoding}]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]\ [TAG=%{Tlist_Get_Tagname_By_Line()}]
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Revenir à l'ancienne position
au BufReadPost * if line("'\"") >0 |if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm$"|endif|endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

"Syntastic
map <F12> <Esc>:SyntasticCheck<CR>
map <F11> <Esc>:SyntasticReset<CR>:lcl<CR>
let g:syntastic_enable_signs=1
nnoremap <leader>e :Errors<CR>
nnoremap <leader>f :lcl<CR>
"let g:syntastic_mode_map = { 'mode': 'active',
            "\'active_filetypes': ['php'],
            "\'passive_filetypes': [''] }
"Fichier tags yomaah
"source ~/.vim/plugin/mytags/mytags.vim
"set tags+=~/.vim/plugin/mytags/yomaah/yomaah.tags

"PHP
"Mettre condition pour lancer les makepgr selon l'extension"
source ~/.vim/plugin/php.vim
au FileType php call php#PhpConfigPerso()

"PYTHON
source ~/.vim/plugin/python.vim
au FileType python call python#ConfigPython()


"YAML
source ~/.vim/plugin/yaml.vim
au FileType yaml call yaml#ConfigYaml()
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/bundle/yaml.vim/colors/yaml.vim

"C
source ~/.vim/plugin/c.vim
au Filetype h,c call c#ConfigC()

"TWIG
"au BufRead,BufNewFile *.twig setfiletype django
