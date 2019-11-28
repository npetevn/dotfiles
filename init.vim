call plug#begin()
" Plug 'roxma/nvim-completion-manager'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'mhartington/nvim-typescript'
" Plug 'HerringtonDarkholme/yats.vim'

" Snippets for code expansion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Find and Replace in Vim
Plug 'brooth/far.vim'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" neomake
Plug 'neomake/neomake'

" NerdTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Git marking for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Searcher
Plug 'mileszs/ack.vim'

" JavaScript Highlight & Improved Indentation
Plug 'pangloss/vim-javascript'

" Typescript Syntax Highlight
Plug 'leafgarland/typescript-vim'

" Async execution library needed by tsuquyomi
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" A client to TSSServer so that we can get autocompletion
Plug 'Quramy/tsuquyomi'

" linting engine
Plug 'w0rp/ale'

" nord-vim colorscheme
Plug 'arcticicestudio/nord-vim'

" semantic-based completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer' }

" Async FuzzyFind
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
call plug#end()

" general configs
:set number relativenumber
:set ruler

:set mouse=a
:set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
" map clipboard to OSX
:set clipboard=unnamed
" enable deoplete for typescript
let g:deoplete#enable_at_startup = 1
" NeoMake config
call neomake#configure#automake('nw', 750)

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/


"""""""""""""""""""""""""""""""""""""""""""""""
" => Keymappings
"""""""""""""""""""""""""""""""""""""""""""""""

map <C-n> :NERDTreeToggle<CR>
map <C-h> :tabprevious<CR>
map <C-l> :tabnext<CR>
map <C-a> :Ag<Space>

" map fzf to ctrl+p
nnoremap <C-P> :Files<CR>

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" YouCompleteMeMappings
nnoremap ,gt    :YcmCompleter GetType<CR>
nnoremap ,dl    :YcmCompleter GoToDeclaration<CR>
nnoremap ,df    :YcmCompleter GoToDefinition<CR>
nnoremap ,#     :YcmCompleter GoToReferences<CR>

" disable auto_triggering ycm suggestions pane and instead
" use semantic completion only on Ctrl+n
let ycm_trigger_key = '<C-n>'
let g:ycm_auto_trigger = 0
let g:ycm_key_invoke_completion = ycm_trigger_key

" this is some arcane magic to allow cycling through the YCM options
" with the same key that opened it.
" See http://vim.wikia.com/wiki/Improve_completion_popup_menu for more info.
let g:ycm_key_list_select_completion = ['<TAB>', '<C-j>']
inoremap <expr> ycm_trigger_key pumvisible() ? "<C-j>" : ycm_trigger_key;

" show autocomplete suggestions only when typing more than 2 characters
let g:ycm_min_num_of_chars_for_completion = 2

" show at most 20 completion candidates at a time (more than this would be
" ridiculous, you'd press TAB so many times it would be better to simply type
" the entire thing lol)
" this applies only to the semantic-based engine
let g:ycm_max_num_candidates = 20

" this is the same as above, but only for the identifier-based engine
let g:ycm_max_num_identifier_candidates = 10

" blacklist of filetypes in which autocomplete should be disabled
let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'qf': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'mail': 1
      \}

" blacklist of filepaths in which autocomplete should be disabled
let g:ycm_filepath_blacklist = {
      \ 'html': 1,
      \ 'jsx': 1,
      \ 'xml': 1,
      \}

" fix files on save
let g:ale_fix_on_save = 1

" lint after 1000ms after changes are made both on insert mode and normal mode
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000

" use emojis for errors and warnings
let g:ale_sign_error = '✗\ '
let g:ale_sign_warning = '⚠\ '

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\}

" make FZF respect gitignore if `ag` is installed
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

"""""""""""""""""""""""""""""""""""""""""""""""
" => Visual Related Configs
"""""""""""""""""""""""""""""""""""""""""""""""

" 256 colors
set t_Co=256

" set colorscheme
colorscheme nord

" long lines as just one line (have to scroll horizontally)
set nowrap

" line numbers
set relativenumber
set number
