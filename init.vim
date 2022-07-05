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




"--------------------------------------Inicio Plugins
call plug#begin('.config/nvim/plugged')

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

Plug 'ryanoasis/vim-devicons'

"PESTAÑAS
"AIRLINE
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"AUTOCOMPLETADO
"AUTO-PAIRS
Plug 'jiangmiao/auto-pairs'
"CLOSETAG
Plug 'alvan/vim-closetag'

"Servidor de lenguajes
"LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'


"COMENTARIOS
Plug 'tpope/vim-commentary'

"IDENT LINE auto indentado
Plug 'Yggdroot/indentLine'

call plug#end()
"---------------------------------------Fin Plugins


"--------------------------------CONFIGURACION DE PLUGINS

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


"Servidor de lenguajes
"LSP
lua << EOF
require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.html.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.cssls.setup{on_attach=require'completion'.on_attach}
EOF



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


"COMENTARIOS

nnoremap <space>ñ :Commentary<CR>
vnoremap <space>ñ :Commentary<CR>
