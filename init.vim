"                       _
" _ __   ___  _____   _(_)_ __ ___
"| '_ \ / _ \/ _ \ \ / / | '_ ` _ \
"| | | |  __/ (_) \ V /| | | | | | |
"|_| |_|\___|\___/ \_/ |_|_| |_| |_|


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""CREANDO FUNSION PARA VER BRANCH DE GIT EN EL STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "falta crear esta configuracion"

""""""""""""""""""""""""""""""""""""
""fin de funsion branch status line
""""""""""""""""""""""""""""""""""""



"Abrir el archivo en la ultima linea donde me quede"
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") | exe "normal! g"
endif

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
""source ~/.vimrc

"""""""""""""""""""
"SETEADO NATIVO
"""""""""""""""""""
"tecla lider
let mapleader =","

"numero de lineas
set number
set relativenumber

"colorea la sintaxis junto con syntax enable"
set syntax=on
syntax enable

"mouse
set mouse=a

"mostrar los comandos que se escriben
set showcmd

"evitamos que nos indique en que modo estamos (normal, vista, insertar, comando)"
""set noshowmode

"configuracion idioma
set encoding=UTF-8
set nocompatible
"setlocal spell! spelllang=es

"frecuencia en que se va actualizando el archivo"
set updatetime=50

"trabajando con parentesis"
"expandir o contraer las lineas que se encuentran dentro de los
"distintos parentesis donde nos paramos (te paras en el parentesis
"y presionas zf% y zfa)
set foldmethod=manual
""""colapsar, plegar y desplega
    ""para colapsar = zc
    ""para desplegar = espacio
set foldmethod=indent
"muestra la pareja de los distintos parentesis donde nos paramos"
set showmatch

"trabajando con tabuladores
"cuando indento con shift y >, usa 4 espacios"
set shiftwidth=4
"una tabulacion equivale a 4 espacios"
set tabstop=4
set softtabstop=4
set autoindent
"cuando precione tabulador se expande a espacios"
set expandtab
set smartindent
autocmd BufEnter *
set indentexpr=4
set ts=4
set expandtab
"corta las palabras para comenzar en el espacio de abajo"
set linebreak

"marca linea de tabulación"
""set fillchars=fold:\ | set foldtext=CustomFold() "minimalistic folding"
""set listchars=tab:\|\ ,trail:- list "alternate tab: #>-----"

""##############################################################
    "un buen tip para tabular es parate en una etiqueta y en modo visual poner (simbolo de porcentaje) para que indique donde termina todo ese bloque

 ""   luego poner (simbolo de mayor que) para que nos haga una tabulación y si queremos más tabulaciones le damos al (punto) las veces que haga falta

  ""  si solo queremos ver donde comienza y donde termina un bloque de la etiqueta solo le damos (signo de porcentaje) pero en modo normal"
""###############################################################
"""mostrar tabulaciones"

"quitar espacios al final de todas las lineas automaticamente"
autocmd BufwritePre * :%s/\s\+$//e

"busquedas"
"buscar sea con mayusculas o minuscilas
set ignorecase
set nospell
filetype indent on
"pinta toda la palabra cuando la busco"
set hlsearch
""borrar resaltado después de una búsqueda
set nohlsearch
"busqueda inteligente"
set smartcase
"incrementa el pintado de las busquedas aunque antes de poner esto ya me hacia
"el mismo trabajo"
set incsearch

"resaltado de lineas y columnas donde esta el cursor
""set cursorcolumn
""set cursorline

"resaltar columna 80
""set colorcolumn=80

"acceso al portapapeles
"copiar pegar
set clipboard=unnamed
set clipboard=unnamedplus
"historial de cambios en un archivo"
set undofile
set undodir=~/.config/nvim/undodir


"forzar a abrir ventanas a la derecha y abajo
set splitright
set splitbelow

"no mostrar mensaje (el archivo swap con tal nombre ya existe)
set noswapfile

"no guarda copias de seguridad
set nobackup

"explorador de archivos
""let g:loaded_netrw = 1

"historial de comandos
set history=1000



"lo que se mostrara en la barra de status

set statusline=
set statusline+=\ %=
set statusline+=\ %f
set statusline+=\ %=
""set statusline+=\ [%{&ff}]
set statusline+=\ %-m
set statusline+=\ %y
set statusline+=\ %=
""set statusline+=\ [%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\ %l:%c
set statusline+=\ %=
set statusline+=\ %p%%
set statusline+=\ %=
set statusline+=\ [Total_Lineas=%L]


""""""""""""""""""""
"FIN SETEADO NATIVO
""""""""""""""""""""

"""""""""""""""""""""""""""
"CONFIGURACION DE PLUGINS
"""""""""""""""""""""""""""

"--------------------------------------Inicio Plugins
"call plug#begin('.config/nvim/plugged')

"TEMAS
"GRUVBOX
"Plug 'sainnhe/gruvbox-material'
"DRACULA
"Plug 'dracula/vim' , { 'as': 'dracula' }
"MONOKAI
"Plug 'crusoexia/vim-monokai'
"PAPAYA
"Plug 'henrynewcomer/vim-theme-papaya'
"CI DARK
"Plug 'yunlingz/ci_dark'
"FIN TEMAS

"ADMINISTRADOR DE ARCHIVOS
"NERDTREE
"Plug 'scrooloose/nerdtree'
""Plug 'ryanoasis/vim-devicons'
""Plug 'nvim-tree/nvim-web-devicons'

"AUTOCOMPLETADO"
""Plug 'neoclide/coc.nvim', {'branch': 'release'}

""Plug 'matt/emmet-vim'

""call plug#end()
""""""""""""
"FIN PUGINS
""""""""""""



""""""""""""""""""""""""
"MAPEO GENEREAL
""""""""""""""""""""""""


""""""""""""""""
"Temas de color
"""""""""""
""GRUVBOX configuracion
""set background=dark
""let g:gruvbox_material_background='medium'
""let g:airline_theme='gruvbox-material'
""let g:gruvbox_contrast_dark='hard'
""colorscheme gruvbox-material

"DRACULA configuracion
"let g:airline_theme='dracula'
"if (has("termguicolors"))
"	set termguicolors
"endif
colorscheme dracula

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


""""""""""""""""
"Fin Temas de color
"""""""""""








"""""""""""""""""""""""""""""""""""""""""""""""""""
"Autocompletar paréntesis, llaves, corchetes, etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap </ </><Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ¿ ¿?<Esc>i
inoremap /* /*<CR>/<Esc>O
inoremap <! <!--<CR>--><Esc>O
inoremap {<CR> {<CR>}<Esc>O

""""""""""""""""""""""""""""""""""""""""
"Trabajo con diferentes pestañas
"""""""""""""""""""""""""""""""""""""""
"nueva (pestaña)
nnoremap <C-t> :tabnew<CR>
"(siguiente pestaña)
nnoremap <C-p> :tabprevious<CR>
"(anterior pestaña)
nnoremap <C-n> :tabnext<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
"Trabajo con diferentes buffers
"""""""""""""""""""""""""""""""""""""""""""""""""
"Abrir nuevos buffers
nnoremap <C-v> :vs<CR> "vertical
nnoremap <C-b> :sp<CR> "horizontal

"cambiar tamaño de buffers
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>



""Hay varias formas de poder desplazarse por los buffers:

"":bnext o de manera abreviada puedes utilizar :bn para ir al buffer siguiente (:bprevious o :bp para ir al buffer previo).

"":buffer + nombre_de_archivo. De manera abreviada puedes utilizar :b. Vim puede autocompletar el nombre de archivo con Tab.

"":buffer + n, donde n es el número del buffer. También puedes reemplazar :buffer por :b. Por ejemplo, escribiendo: :buffer 2 o :b 2 te llevará al buffer número 2.

""Salta a la antigua posición en la lista de saltos con Ctrl-O y a la nueva posición con Ctrl-I. Estos no son métodos específicos para buffers, pero pueden ser utilizados para saltar entre diferentes buffers. Explicaré más detalles sobre los saltos en el capítulo 5.

""Ir al buffer previamente editado con Ctrl-^.


""""""""""""""""""""""""""
"Arbol gestor de archivos
""""""""""""""""""""""""""
""""Configuración Explore""""
"Abrir explorador a la derecha
nmap <F3> :Vexplore!<CR>
"Cerrar explorador
nmap <F4> :q<CR>
"Sincronizar el directorio actual y el directorio que está mostrando Netrw. Esto ayuda con el error cuando se intenta mover archivos.
let g:netrw_keepdir = 0
"Porcentaje que ocupa cuando Netrw crea una división
let g:netrw_winsize = 30
"Ocultar el banner (Si quieren). Para mostrarlo temporalmente sólo deben presionar (I) en Netrw.
let g:netrw_banner = 0
"Modificar el comando para copiar archivos. Para permitir copiar directorios de manera recursiva.
let g:netrw_localcopydircmd = 'cp -r'

let NERDTreeQuitOnOpen=1

""""Configuración NERDTree""""
""nmap <F3> :NERDTreeFind<CR>
""nnoremap <leader>n :NERDTreeFocus<CR>
""nnoremap <C-n> :NERDTree<CR>
""nnoremap <C-t> :NERDTreeToggle<CR>
""nnoremap <C-f> :NERDTreeFind<CR>




"NERDTREE configuracion
""let NERDTreeQuitOnOpen=1
"Abrir explorador a la derecha
""let g:NERDTreeWinPos = "right"
""noremap <silent> <F3> :NERDTreeFind<CR>
""nnoremap <silent> <F4> :NERDTreeToggle<CR>



""""""""""""""""""""""""
"Creando plantilla HTML
""""""""""""""""""""""""
nnoremap .html :-1read $HOME/.config/nvim/plantillas/plantilla.html<CR>
nnoremap .css :-1read $HOME/.config/nvim/plantillas/estilos/plantilla.css<CR>

""""""""""""""""""""""""""""""""""""
"Llamando archivo de configuración
""""""""""""""""""""""""""""""""""""
nnoremap <C--> :vs $HOME/.config/nvim/init.vim<CR>

""""""""""""""""""""
"Abriendo terminal
"""""""""""""""""""
"terminal abajo
nnoremap <C-i> :split<CR>:terminal<CR>:resize 35<CR>
"teeminal a la derecha
"nnoremap <C-t> :botright vnew<CR>:terminal<CR>

"""""""""""""""""""""""""""""""""""""""""""""
"Actualizar archivo de configuración neovim
"""""""""""""""""""""""""""""""""""""""""""""
""nmap <F5> :source $HOME/.config/nvim/init.vim<CR>

""""""""""""""""""""""""""""""""""""""""""""""
"Actualizar el archivo que se esta editando
"""""""""""""""""""""""""""""""""""""""""""""""
""nmap <F5> :source %<CR>

"""""""""""""""""""""""""""""""
"Muestra errores ortograficos
""""""""""""""""""""""""""""""
nnoremap <F7> :setlocal spell! spelllang=es<CR>

""""""""""""""""""""""""
"navegar entre ventanas
"""""""""""""""""""""""
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k
""""""""""""

"""""""""""""""""""""""""""
""Busquedas
"""""""""""""""""""""""""""
"limpia las marcas creadas cuando se realiza una busqueda
"""""""""""""""""""""""""""
nmap <C-ñ> :noh<CR>
"centra en la pantalla las busquedas realizadas"
nnoremap n nzzzv

"""""""""""""""""""""""""""
""Muestra pagina de ayuda
"""""""""""""""""""""""""""
nnoremap <F1> :help<CR>

""""""""""""""""""""""""""
"Navegacion con guias
"""""""""""""""""""""""""""
inoremap ;gui <++>
inoremap <leader><leader> <Esc>/<++><CR>"_c41
vnoremap <leader><leader> <Esc>/<++><CR>"_c41
map <leader><leader> <Esc>/<++><CR>"_c41

""""""""""""""""""""""""""""""
"Guardar archivos
""""""""""""""""""""""""""""""
nnoremap <C-s> :w<CR>
nnoremap <C-x> :x<CR>
nnoremap <C-q> :q!<CR>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
"Buscar diferencias entre dos archivos"
"""""""""""""""""""""""""""""""
nnoremap <S-t> :diffthis<CR>

"""""""""""""""""""""""
""Seleccionar todo
"""""""""""""""""""""""
nnoremap <C-a> ggVG
""""""""""""

""""""""""""""""""""""""""""""""""""""
"""""""""""""Identación"""""""""""""""
""""""recorrer linea a la derecha"""""
""    >>
""""""recorrer linea a la izquierda"""""
""    <<
""""""""contenido bloque entre llaves a la derecha""""""""
""    >%
""""""""contenido bloque entre llaves a la izquierda""""""""
""    <%
""""""""contenido bloque entre parentesis a la derecha""""""""""
""    >i
""""""""contenido bloque entre parentesis a la izquierda""""""""""
""    <b
""""""""identar todo el codigo""""""""
""    gg=G
    nnoremap <F2> gg=G



""""""""""""""""""""""
noremap <kj> <Esc>

"FIN MAPEOS
""""""""""""

"Para arrancar Vim con múltiples pestañas, puedes ejecutar esto desde la terminal:"
"vim -p archivo1.js archivo2.js archivo3.js"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"COLORES Y TEMAS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight TabLine      guifg=#202328 ctermfg=4  guibg=#5b6268 ctermbg=8    cterm=none
highlight TabLineSel   guifg=#202328 ctermfg=3  guibg=#5b6268 ctermbg=8    cterm=none
highlight TabLineFill  guifg=#202328 ctermfg=8  guibg=#5b6268 ctermbg=none cterm=none
highlight Normal       guifg=#dfdfdf ctermfg=15 guibg=#282c34 ctermbg=none cterm=none
""numero de lineas
highlight LineNr       guifg=#5b6268 ctermfg=8  guibg=#282c34 ctermbg=none cterm=none
highlight CursorLineNr guifg=#202328 ctermfg=7  guibg=#5b6268 ctermbg=8    cterm=none
highlight VertSplit    guifg=#1c1f24 ctermfg=7  guibg=#5b6268 ctermbg=none cterm=none
highlight Statement    guifg=#98be65 ctermfg=2  guibg=none    ctermbg=none cterm=none
highlight Directory    guifg=#51afef ctermfg=4  guibg=none    ctermbg=none cterm=none
"barra de estatus activa"
highlight StatusLine   guifg=#202328 ctermfg=3  guibg=#5b6268 ctermbg=8    cterm=none
"barra de estatus inactiva"
highlight StatusLineNC guifg=#202328 ctermfg=4  guibg=#5b6268 ctermbg=none cterm=none
highlight Constant     guifg=#3071db ctermfg=12 guibg=none    ctermbg=none cterm=none
"comentarios con fuente italica"
highlight Comment      guifg=#6272a4 ctermfg=6  guibg=none    ctermbg=none cterm=bold
"highlight Comment      guifg=#57afef ctermfg=7  guibg=none   ctermbg=none cterm=italic
highlight Special      guifg=#51afef ctermfg=4  guibg=none    ctermbg=none cterm=none
highlight Identifier   guifg=#5699af ctermfg=6  guibg=none    ctermbg=none cterm=none
highlight PreProc      guifg=#c678dd ctermfg=3  guibg=none    ctermbg=none cterm=italic
highlight String       guifg=#dfdfdf ctermfg=12 guibg=none    ctermbg=none cterm=italic
highlight Number       guifg=#ff6c6b ctermfg=3  guibg=none    ctermbg=none cterm=italic
highlight Function     guifg=#ff6c6b ctermfg=1  guibg=none    ctermbg=none cterm=italic
highlight Visual       guifg=#3e4452 ctermfg=3  guibg=#1c1f24 ctermbg=8    cterm=none
"highlight Visual      guifg=#dfdfdf ctermfg=7  guibg=#1c1f24 ctermbg=8    cterm=none
highlight ColorColumn                                         ctermbg=8
highlight CursorColumn guifg=#5b6268 ctermfg=7  guibg=#282c34 ctermbg=none cterm=none

highlight markup   guifg=#5b6268 ctermfg=7  guibg=#282c34 ctermbg=none cterm=none
""highlight markup     {'dark': "#F07178",  'light': "#F07178",  'mirage': "#F07178"}

"algunas configuraciones de monokai"
highlight Boolean ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
highlight Character ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Conditional ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#46830c gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8b0807 guibg=NONE gui=NONE
hi DiffChange ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=#243955 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
hi Float ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Define ctermfg=197 ctermbg=NONE cterm=NONE guifg=#f92672 guibg=NONE gui=NONE
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#46830c gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8b0807 guibg=NONE gui=NONE
hi DiffChange ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=#243955 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
hi WarningMsg ctermfg=231 ctermbg=197 cterm=NONE guifg=#f8f8f0 guibg=#f92672 gui=NONE
hi Float ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE






""""""""""""""
"FIN COLORES
""""""""
