set number
set mouse=a
syntax enable
set showcmd
set encoding=UTF-8
set showmatch
set relativenumber
setlocal spell spelllang=es
set nocompatible
set shiftwidth=4
set autoindent
autocmd BufEnter * set indentexpr=



"--------------------------------------Inicio PluginsS
call plug#begin('~/.config/nvim/plugged')
"Guías de indentación
Plug 'Yggdroot/indentLine'

"SYNTAX
Plug 'sheerun/vim-polyglot'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript', { 'for': 'javascript'  }

"TEMAS
"GRUVBOX
Plug 'sainnhe/gruvbox-material'
"DRACULA
Plug 'dracula/vim' , { 'as': 'dracula' }
"MONOKAI
Plug 'crusoexia/vim-monokai'
"PAPAYA
Plug 'henrynewcomer/vim-theme-papaya'
"CI DARK
Plug 'yunlingz/ci_dark'
"FIN TEMAS

"ADMINISTRADOR DE ARCHIVOS
"NERDTREE
Plug 'scrooloose/nerdtree'

"PESTAÑAS
"AIRLINE
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"AUTOCOMPLETADO
"AUTO-PAIRS
Plug 'jiangmiao/auto-pairs'
"CLOSETAG
Plug 'alvan/vim-closetag'
"Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
Plug 'Shougo/neco-syntax'  " Fuente general de auto completado"

call plug#end()
"---------------------------------------Fin Plugins


"--------------------------------CONFIGURACION DE PLUGINS

"INDENTLINE
" No mostrar en ciertos tipos de buffers y archivos
 let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
 let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

"--------------------------------TEMAS DE COLOR
""GRUVBOX configuracion
set background=dark
let g:gruvbox_material_background='medium'
let g:airline_theme='gruvbox-material'
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox-material

"DRACULA configuracion
"let g:airline_theme='dracula'
"if (has("termguicolors"))
"	set termguicolors
"endif
"colorscheme dracula

"MONOKAI configuracion
"let g:monokai_term_italic = 1
"let g:monokai_gui_italic = 1
"colorscheme monokai

"PAPAYA configuracion
"if (has("termguicolors"))
"	  set termguicolors
" endif
"colorscheme papaya
"let g:papaya_gui_color='blue'

"CI DARK
"set termguicolors
"let g:ci_dark_enable_bold = 1
"colorscheme ci_dark
"set fillchars+=vert:│
"let g:airline_theme = 'ci_dark'

"--------------------------------FIN TEMAS DE COLOR

"NERDTREE configuracion
let NERDTreeQuitOnOpen=1
nnoremap <silent> <F3> :NERDTreeFind<CR>
nnoremap <silent> <F4> :NERDTreeToggle<CR> 

"AUTOCOMPLETADO
"Deoplete
" Activar deoplete al iniciar Neovim
 let g:deoplete#enable_at_startup = 1

" Cerrar automaticamente la ventana de vista previa (donde se muestra
" documentación, si existe)
 augroup deopleteCompleteDoneAu
   autocmd!
     autocmd CompleteDone * silent! pclose!
     augroup END"

"CLOSETAG
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }


"PESTAÑAS
"AIRLINE configuracion
let g:airlene#extension#tabline#left_sep = ' '
let g:airlene#extension#tabline#left_alt_sep = '|'
let g:airlene#extension#tabline#formatter = 'default'
let g:airline#extensions#tabline#enabled = 1



"SYNTAX
"POLYGLOT configuracion
"let g:polyglot_disabled = 'autoindent'
"let g:polyglot_disabled = 'sensible'
"let g:polyglot_disabled = 'ftdetect'
"let g:polyglot_disabled = 'markdown.plugin'
"let g:polyglot_disabled = 'markdown'
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0
