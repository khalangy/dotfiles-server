
" GENERAL OPTIONS :
" -----------------------------------------------------------------------------
set nocompatible	" Do not ensure compatibility with the old Vi
set encoding=utf8	" Encoding in utf-8
set fileencoding=utf-8	" Encoding files in utf-8
set history=50		" Number of orders in the history
set viminfo='20,\"50	" Options of the file ~/.viminfo
set autoread		" Auto playback if the file has been modified from the outside
set nobk		" Prevents vim from creating a backup before writing to a file
filetype plugin indent on   " Enables file type detection

" -- Mouse & Space & Tab --
set mouse=r		" Mouse selection
set backspace=2		" Activates the Backspace key
set ruler		" Displays the cursor position
set whichwrap=<,>,[,]	" Allows you to move from one line to another with the left and right arrows
set wildmode=list:full	" Completion mode that is used for the character specified with Wildchar
set wildchar=<Tab>	" Character you must type to start the expansion of wildcard characters in the command line
set wildmenu		" Better completion of orders in the status line
set tabstop=8		" Number of spaces that a <TAB> in the file counts
set shiftwidth=4	" Number of spaces to be used for each step of the paragraph (automatic)
set softtabstop=4	" Number of spaces that a <Tab> counts during editing operations
set noexpandtab		" Requires vim to insert tabs as characters instead of inserting a set of spaces

" -- Indent --
set autoindent		" Keeps the indentation on a new line
set smartindent		" Perform intelligent automatic marking when starting a new line
set shiftwidth=4	" Number of spaces in the indentation

" -- Fold --
set foldenable		" Allows you to fold by default
set foldmethod=indent	" The folding is based on the indentation of the file
set foldlevelstart=99	" No folds closed by default
set foldnestmax=4	" 4 maximum bending levels

" -- Search --
set hlsearch		" Highlight the search word
set incsearch		" Incremental searches
set incsearch		" Highlights search results during entry
set ignorecase		" The searches are not 'case sensitives'...
set smartcase		" ... unless the pattern you are looking for contains upper case letters

" -- Beep --
set visualbell		" Use a visual beep instead of a beep
set noerrorbells	" Prevent Vim from beepping


" UI :
" -----------------------------------------------------------------------------
syntax enable		" Enables syntax highlighting
colorscheme onedark	" Colour theme
set t_Co=256		" Use 256 colors
set title		" Define the window title
set cursorline		" Highlights the cursor screen line
set nostartofline	" Try to keep the cursor in the same column when changing rows
set splitright		" When enabled, splitting a window places the new window to the right of the current window
set laststatus=1	" Status bar always visible
set statusline=%F\ Type=%y\ %=Pos=%l,%c\ (%p%%)\ SLOC=%L\ %P	" Content of the status bar
set showcmd		" Displays the commands in the status bar
set wrap		" Displays lines that are too long on several lines
set wrapmargin=8	" Number of characters from the right edge of the window where wrapping starts
set linebreak		" Do not cut a word to go to the line
set showmatch		" Displays the pair of parentheses

" -- Scroling --
set scrolloff=8		" Keep 8 visible lines by scrolling vertically
set sidescrolloff=15	" Keep 15 columns visible by scrolling horizontally
set sidescroll=1	" The minimum number of columns to scroll horizontally
set scrollbind		" Scroller sync between 2 windows


" MAPPING :
" -----------------------------------------------------------------------------
" Mapper Y for copying to the end of the line
map Y y$
" U is not useful, make it a redo (Ctrl - R))
map U <C-r>
" Folding with space
nnoremap <space> za
" Ctrl-D to delete a line in insert mode
imap <C-D> <esc> ddi
" Ctrl-U to capitalize in insert mode
imap <C-U> <esc> viwgUi
" Ctrl-Y to duplicate a line in insert mode
imap <C-Y> <esc> yypi
" Press Ctrl-F10 to active paste option
noremap <C-p> :set invpaste <CR>
" Displays the line numbers with  Ctrl-F11
noremap <C-n> :set invnumber <CR>
" Display listchers with Ctrl-F12
noremap <C-l> :set invlist listchars=nbsp:¤,tab:··,trail:¤,extends:▶,precedes:◀,eol:¶ <CR>

" ASTUCES :
" -----------------------------------------------------------------------------
" Persistent undo
if has("persistent_undo")
	if ! isdirectory(expand("~/.vim/vim-undo/")) || ! filewritable(expand("~/.vim/vim-undo/"))
	    silent execute '!mkdir -p ~/.vim/vim-undo'
	endif
	    set undofile    " Vim automatically saves the cancellation history in a cancellation file when writing a buffer to a file
	    set undodir^=~/.vim/vim-undo    " list of directory names for cancellation files
endif
