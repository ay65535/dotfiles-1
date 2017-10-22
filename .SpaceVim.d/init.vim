scriptencoding utf-8

" init.vim
" author: Seong Yong-ju ( @sei40kr )

let g:ruby_host_prog = $HOME . '/.rbenv/shims/ruby'
let g:python_host_prog = $HOME . '/.pyenv/shims/python2'
let g:python3_host_prog = $HOME . '/.pyenv/shims/python3'

" Dark powered mode of SpaceVim, generated by SpaceVim automatically.
call SpaceVim#layers#load('operator')
call SpaceVim#layers#load('incsearch')
call SpaceVim#layers#load('tags')
call SpaceVim#layers#load('shell', {
      \ 'default_position': 'top',
      \ 'default_height': 30,
      \ })
call SpaceVim#layers#load('lang#c')
call SpaceVim#layers#load('lang#crystal')
call SpaceVim#layers#load('lang#elixir')
call SpaceVim#layers#load('lang#go')
call SpaceVim#layers#load('lang#haskell')
call SpaceVim#layers#load('lang#java')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#json')
call SpaceVim#layers#load('lang#kotlin')
call SpaceVim#layers#load('lang#perl')
call SpaceVim#layers#load('lang#php')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#ruby')
call SpaceVim#layers#load('lang#rust')
call SpaceVim#layers#load('lang#sh')
call SpaceVim#layers#load('lang#tmux')
call SpaceVim#layers#load('lang#typescript')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#xml')
call SpaceVim#layers#load('tmux')

let g:deoplete#auto_complete_delay = 150
if has('python3')
  let g:ctrlp_map = ''
  nnoremap <silent> <C-p> :Denite file_rec<CR>
endif
let g:clang2_placeholder_next = ''
let g:clang2_placeholder_prev = ''

" SpaceVim configurations
let g:spacevim_max_column = 80
let g:spacevim_windows_leader = 's'
let g:spacevim_unite_leader = 'f'
let g:spacevim_denite_leader = 'F'
let g:spacevim_realtime_leader_guide = 1
let g:spacevim_enable_neomake = 0
let g:spacevim_statusline_separator = 'nil'
let g:spacevim_statusline_inactive_separator = 'bar'
let g:spacevim_error_symbol = ''
let g:spacevim_warning_symbol = ''
let g:spacevim_vim_help_language = 'japanese'
let g:spacevim_language = 'ja_JP.UTF-8'
let g:spacevim_colorscheme = 'onedark'
let g:spacevim_colorscheme_bg = 'dark'
let g:spacevim_colorscheme_default = 'onedark'
let g:spacevim_enable_debug = 0
let g:spacevim_buffer_index_type = 4
let g:spacevim_windows_index_type = 3
let g:spacevim_github_username = 'sei40kr'
let g:spacevim_disabled_plugins = [
      \ 'neomake',
      \ 'syntastic',
      \ 'vim-diminactive',
      \ 'fcitx.vim',
      \ ]
let g:spacevim_custom_plugins = [
      \ ['w0rp/ale'],
      \ ['ejholmes/vim-forcedotcom', { 'on_ft': ['apex', 'visualforce', 'apexlog'] }],
      \ ['Galooshi/vim-import-js', { 'on_cmd': ['ImportJSWord', 'ImportJSFix', 'ImportJSGoto'] }],
      \ ]
let g:spacevim_enable_powerline_fonts = 1
let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_vimfiler_gitstatus = 1

" sbdchd/neoformat
let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_c = []
let g:neoformat_enabled_cpp = []
let g:neoformat_enabled_crystal = ['crystalformat']
let g:neoformat_enabled_css = []
let g:neoformat_enabled_csv = ['prettydiff']
let g:neoformat_enabled_go = ['goimports', 'gofmt']
let g:neoformat_enabled_graphql = ['prettier']
let g:neoformat_enabled_haskell = ['stylishhaskell']
let g:neoformat_enabled_html = []
let g:neoformat_enabled_java = []
let g:neoformat_enabled_javascript = []
let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_kotlin = ['ktlint']
let g:neoformat_enabled_less = []
let g:neoformat_enabled_markdown = ['remark']
let g:neoformat_enabled_perl = ['perltidy']
let g:neoformat_enabled_php = []
let g:neoformat_enabled_python = []
let g:neoformat_enabled_ruby = []
let g:neoformat_enabled_rust = ['rustfmt']
let g:neoformat_enabled_scss = []
let g:neoformat_enabled_sh = ['shfmt']
let g:neoformat_enabled_sql = ['sqlformat']
let g:neoformat_enabled_typescript = ['tsfmt']
let g:neoformat_enabled_xml = []

" Shougo/deoplete.nvim
let g:deoplete#ignore_sources = {
      \ 'gitcommit': [],
      \ }

" Shougo/echodoc.vim
let g:echodoc#enable_at_startup = 1

" Shougo/neosnippet.vim
let g:neosnippet#disable_runtime_snippets = {
      \ 'html': 1,
      \ 'css': 1,
      \ 'scss': 1,
      \ }

" mattn/emmet-vim
let g:emmet_html5 = 1

" easymotion/vim-easymotion
let g:EasyMotion_keys = 'sdghklwertyuioxcvbnmfj'

" thinca/vim-template
source ~/.SpaceVim.d/config/plugins_before/vim-template.vim

" w0rp/ale
let g:ale_lint_on_save = 1
let g:ale_echo_msg_format = '%severity%: %linter%: %s'
let g:ale_sign_column_always = 1
let g:ale_change_sign_column_color = 1
let g:ale_sign_error = ''
let g:ale_sign_info = ''
let g:ale_sign_warning = ''
let g:ale_statusline_format = ['   %d ', '   %d ', '  ']
let g:ale_fixers = {
      \ 'c': ['clang-format'],
      \ 'cpp': ['clang-format'],
      \ 'css': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ 'json': ['prettier'],
      \ 'python': ['autopep8', 'yapf', 'isort'],
      \ 'ruby': ['rubocop'],
      \ 'sass': ['stylelint'],
      \ 'scss': ['stylelint'],
      \ 'typescript': ['prettier'],
      \ }
let g:ale_linters = {
      \ 'ansible': ['ansible-lint'],
      \ 'awk': ['gawk'],
      \ 'bash': ['shellcheck'],
      \ 'c': ['clang', 'clang-format'],
      \ 'cpp': ['clang', 'clang-format', 'cppcheck', 'cpplint'],
      \ 'cmake': ['cmakelint'],
      \ 'css': ['stylelint', 'prettier'],
      \ 'crystal': ['crystal'],
      \ 'go': ['go', 'golint'],
      \ 'html': ['htmlhint'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'json': ['jsonlint', 'prettier'],
      \ 'kotlin': ['kotlinc', 'ktlint'],
      \ 'markdown': ['mdl'],
      \ 'python': ['autopep8', 'isort', 'yapf'],
      \ 'ruby': ['rubocop', 'ruby'],
      \ 'rust': ['rls', 'rustc'],
      \ 'sass': ['sass-lint', 'stylelint'],
      \ 'scss': ['sass-lint', 'stylelint', 'prettier'],
      \ 'sh': ['shellcheck'],
      \ 'sql': ['sqlint'],
      \ 'thrift': ['thrift'],
      \ 'typescript': ['tslint', 'tsserver', 'prettier'],
      \ 'vim': ['vint'],
      \ 'xml': ['xmlint'],
      \ 'yaml': ['yamllint'],
      \ }

" Shougo/denite.vim

" Shougo/vimfiler.vim
let g:vimfiler_direction = 'topleft'

" vim-airline/vim-airline
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_detect_iminsert = 1
let g:airline_inactive_collapse = 1
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
let g:airline_symbols = { 'branch': '', 'readonly': '', 'linenr': '☰', 'maxlinenr': '' }

let g:airline_section_x = '%{airline#util#wrap(airline#parts#filetype(),0)} | %{airline#util#wrap(airline#parts#ffenc(),0)}'
let g:airline_section_y = '%{g:airline_symbols.linenr}  %l/%L : %v '
" TODO Re-locate ALE section according to linting result
let g:airline_section_z = '%{ALEGetStatusLine()}'
let g:airline_section_warning = ''
let g:airline_section_error = ''
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = g:spacevim_error_symbol
let g:airline#extensions#ale#warning_symbol = g:spacevim_warning_symbol

" joshdick/onedark.vim
let g:onedark_terminal_italics = 1

" Yggdroot/indentLine
let g:indentLine_color_term = 59
let g:indentLine_color_gui = '#5c6370'
let g:indentLine_char = '┆'

" mhinz/vim-signify
let g:signify_update_on_bufenter = 1
let g:signify_update_on_focusgained = 1
let g:signify_sign_add = '▌'
" TODO Re-think a sign of line deletions
let g:signify_sign_delete = '▸'
let g:signify_sign_delete_first_line = g:signify_sign_delete
let g:signify_sign_change = '▌'
let g:signify_sign_changedelete = g:signify_sign_change
let g:signify_sign_show_count = 0

" tmux-plugins/vim-tmux-focus-events
augroup vim_tmux_focus_events_hooks
  autocmd!
  autocmd FocusGained * set cursorline
  autocmd FocusLost * set nocursorline
augroup END

" elzr/vim-json
let g:vim_json_syntax_conceal = 0

set expandtab
set autoread
set nobackup
set nowritebackup
set noswapfile
set clipboard& clipboard^=unnamed,unnamedplus
set iminsert=0

augroup user_hooks
  autocmd!
  autocmd ColorScheme onedark
        \ highlight link LineNr Normal
        \ | highlight link CursorLineNr CursorLine
augroup END

" vim: set et sw=2 cc=80
