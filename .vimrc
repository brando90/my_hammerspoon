"esc for escaping search
nnoremap <esc><esc> :noh<return><esc>
:set hlsearch

" ---
"filetype off
"call pathogen#infect()
"call pathogen#helptags()

"
"let g:gofmt_command = 'goimports'
"autocmd BufWritePre *.go Fmt
" ---

:syntax on
:set mouse=a
:set nu

" the setup of my go development enviroment
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
"
