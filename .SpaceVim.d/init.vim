scriptencoding utf-8

" init.vim
" author: Seong Yong-ju ( @sei40kr )

if has('$RBENV_ROOT')
  let g:ruby_host_prog = $RBENV_ROOT . '/shims/ruby'
endif

if has('$PYENV_ROOT')
  let g:python_host_prog = $PYENV_ROOT . '/shims/python2'
  let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
endif

let g:mapleader = ';'

call SpaceVim#layers#load('autocomplete')
call SpaceVim#layers#load('operator')
call SpaceVim#layers#load('incsearch')
call SpaceVim#layers#load('shell', {
    \ 'default_position': 'bottom',
    \ 'default_height': 30
    \ })
call SpaceVim#layers#load('lsp', {
      \ 'filetypes': ['css', 'haskell', 'html', 'javascript', 'json', 'less', 'php', 'python', 'rust', 'scss'],
      \ 'override_cmd': {
      \ 'css': ['css-languageserver', '--stdio'],
      \ 'html': ['html-languageserver', '--stdio'],
      \ 'javascript': ['flow-language-server', '--stdio'],
      \ 'json': ['json-languageserver', '--stdio'],
      \ 'less': ['css-languageserver', '--stdio'],
      \ 'scss': ['css-languageserver', '--stdio'],
      \ }
      \ })
call SpaceVim#layers#load('lang#c')
call SpaceVim#layers#load('lang#crystal')
call SpaceVim#layers#load('lang#go')
call SpaceVim#layers#load('lang#haskell')
call SpaceVim#layers#load('lang#html')
call SpaceVim#layers#load('lang#java')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#json')
call SpaceVim#layers#load('lang#kotlin')
call SpaceVim#layers#load('lang#lisp')
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
let g:spacevim_enable_ale = 1
let g:spacevim_statusline_separator = 'nil'
let g:spacevim_statusline_inactive_separator = 'nil'
let g:spacevim_statusline_unicode_symbols = 1
let g:spacevim_error_symbol = ''
let g:spacevim_warning_symbol = ''
let g:spacevim_info_symbol = ''
let g:spacevim_terminal_cursor_shape = 1
let g:spacevim_vim_help_language = 'ja'
let g:spacevim_language = 'ja_JP.UTF-8'
let g:spacevim_colorscheme = 'onedark'
let g:spacevim_colorscheme_bg = 'dark'
let g:spacevim_colorscheme_default = 'onedark'
let g:spacevim_enable_debug = 0
let g:spacevim_buffer_index_type = 4
let g:spacevim_windows_index_type = 3
let g:spacevim_github_username = 'sei40kr'
let g:spacevim_enable_powerline_fonts = 1
let g:spacevim_project_rooter_patterns = ['.git/']
let g:spacevim_project_rooter_automatically = 1
let g:spacevim_enable_vimfiler_welcome = 0
let g:spacevim_enable_vimfiler_gitstatus = 0
let g:spacevim_enable_vimfiler_filetypeicon = 1
let g:spacevim_wildignore .= ',' . join([
      \ '*/.bundle/*',
      \ '*/vendor/bundle/*',
      \ '*/node_modules/*',
      \ '*/out/*',
      \ '*/build/*',
      \ '*/dist/*',
      \ '*/coverage/*',
      \ '*/log/*',
      \ '*/.tmp/*',
      \ '*/tmp/*'
      \ ], ',')

" TODO re-enable chromatica.nvim
let g:spacevim_disabled_plugins = [
      \ 'chromatica.nvim',
      \ 'vim-snippets',
      \ 'neco-look',
      \ 'fcitx.vim',
      \ ]
let g:spacevim_custom_plugins = [
      \ ['ejholmes/vim-forcedotcom'],
      \ ['kana/vim-textobj-help', {
      \ 'depends': 'vim-textobj-user',
      \ 'on_ft': 'help',
      \ }],
      \ ['rhysd/committia.vim', { 'on_path': ['COMMIT_EDITMSG', 'MERGE_MSG'] }],
      \ ['thinca/vim-template'],
      \ ['tyru/open-browser-github.vim',  { 'depends': 'open-browser.vim', 'on_cmd': ['OpenGithubFile', 'OpenGithubIssue', 'OpenGithubPullReq'] }],
      \ ]

" blueyed/vim-diminactive {{{
let g:diminactive = 0
" }}}

" elzr/vim-json {{{

" conceal by default
let g:vim_json_syntax_conceal = 0

" have warnings by default
let g:vim_json_warnings = 0

" }}}

" joshdick/onedark.vim {{{
let g:onedark_terminal_italics = 1
" }}}

" mhinz/vim-signify {{{
let g:gitgutter_sign_added = '▍'
let g:gitgutter_sign_modified = '▍'
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_modified_removed = '▍'

let g:gitgutter_map_keys = 0

nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk
" }}}

" othree/javascript-libraries-syntax.vim {{{
let g:used_javascript_libs = ''
" }}}

" sbdchd/neoformat {{{
let g:neoformat_run_all_formatters = 1

let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_css = []
let g:neoformat_enabled_go = ['gofmt', 'goimports']
let g:neoformat_enabled_graphql = []
let g:neoformat_enabled_haskell = ['stylishhaskell', 'hindent', 'hfmt']
let g:neoformat_enabled_java = ['googlefmt']
let g:neoformat_enabled_javascript = ['prettiereslint']
let g:neoformat_enabled_json = ['fixjson', 'prettier']
let g:neoformat_enabled_less = []
let g:neoformat_enabled_markdown = []
let g:neoformat_enabled_python = ['autopep8', 'yapf', 'isort']
let g:neoformat_enabled_ruby = ['rubocop']
let g:neoformat_enabled_scss = []
let g:neoformat_enabled_typescript = []
" }}}

"" Shougo/deoplete.nvim {{{
" Delay the completion after input in milliseconds.
" Requires |+timers| (Neovim 0.1.5)
let g:deoplete#auto_complete_delay = 150
" If it is "complete", deoplete use |complete()|.
let g:deoplete#complete_method = 'omnifunc'
" If it is 1, file source complete the files from the buffer
" path instead of the current directory.
let g:deoplete#file#enable_buffer_path = 1
" It is a dictionary to decide ignore source names.
" The key is filetype and the value is source names list.
let g:deoplete#ignore_sources = {
      \ '_': ['buffer', 'tag', 'dictionary'],
      \ 'gitcommit': [],
      \ }

set completeopt-=preview
"" }}}

" Shougo/neosnippet.vim {{{
let g:neosnippet#disable_runtime_snippets = {
      \ 'html': 1,
      \ 'css': 1,
      \ 'scss': 1,
      \ 'sass': 1,
      \ 'less': 1,
      \ }
" }}}

"" Shougo/vimfiler.vim {{{
" This variable controls vimfiler tree leaf icon.
let g:vimfiler_tree_leaf_icon = ''
" This variable controls vimfiler opened directory tree icon.
let g:vimfiler_tree_opened_icon = ''
" This variable controls vimfiler closed directory tree icon.
let g:vimfiler_tree_closed_icon = ''
" This variable controls vimfiler file icon.
let g:vimfiler_file_icon = ' '
" This variable controls vimfiler readonly file icon.
let g:vimfiler_readonly_file_icon = ''
" This variable controls vimfiler marked file icon.
let g:vimfiler_marked_file_icon = ''
" This variable controls vimfiler indentation length of tree.
let g:vimfiler_tree_indentation = 1
" Specify the regexp pattern string or list to ignore candidates
" of the source.  This applies on the filenames of candidates.
" It's not case sensitive.
let g:vimfiler_ignore_pattern = [
      \ '\.class$',
      \ '^\.DS_Store$',
      \ '^\.git$',
      \ '^\.init\.vim-rplugin\~$',
      \ '^\.netrwhist$'
      \ ]

if has('mac')
  " It is quick look command for |<Plug>(vimfiler_quick_look)|.
  " Default value is "", so you must set it to use
  " |<Plug>(vimfiler_quick_look)| after installing quick look
  " command.
  let g:vimfiler_quick_look_command = 'qlmanage -p'
endif
"" }}}

"" terryma/vim-multiple-cursors {{{
" If set to 0, then pressing g:multi_cursor_quit_key in Visual mode will not quit and delete all existing cursors. This is useful if you want to press Escape and go back to Normal mode, and still be able to operate on all the cursors.
let g:multi_cursor_exit_from_visual_mode = 0
" If set to 0, then pressing g:multi_cursor_quit_key in Insert mode will not quit and delete all existing cursors. This is useful if you want to press Escape and go back to Normal mode, and still be able to operate on all the cursors.
let g:multi_cursor_exit_from_insert_mode = 0
"" }}}

" thinca/vim-template {{{
let g:template_basedir = expand('~/.SpaceVim.d/template')
let g:template_files = 'template.*'

let s:template_user = 'Seong Yong-ju'
let s:template_user_id = '@sei40kr'
let s:template_organization = 'TeamSpirit Inc.'

let s:template_datetime_format = '%Y-%m-%d %H:%M:%S'
let s:template_date_format = '%Y-%m-%d'
let s:template_time_format = '%H:%M:%S'
let s:template_year_format = '%Y'

function! s:template_keywords() abort
  " vint: -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
  silent! %s/<+FILE_NAME+>/\=expand('%:t')/g
  silent! %s/<+FILE_BASE_NAME+>/\=expand('%:t:r')/g

  silent! %s/<+USER+>/\=s:template_user/g
  silent! %s/<+USER_ID+>/\=s:template_user_id/g
  silent! %s/<+ORGANIZATION+>/\=s:template_organization/g

  silent! %s/<+DATETIME+>/\=strftime(s:template_datetime_format)/g
  silent! %s/<+DATE+>/\=strftime(s:template_date_format)/g
  silent! %s/<+TIME+>/\=strftime(s:template_time_format)/g
  silent! %s/<+YEAR+>/\=strftime(s:template_year_format)/g
  " vint: +ProhibitCommandRelyOnUser +ProhibitCommandWithUnintendedSideEffect

  if search('<+CURSOR+>')
    execute 'normal! "_da>'
  endif
endfunction
" }}}

"" w0rp/ale {{{
" This variable defines a message format for echoed messages.
let g:ale_echo_msg_format = '[%linter%] %severity%: %s [%code%]'
" The strings for `%severity%`
let g:ale_echo_msg_error_str = 'error'
let g:ale_echo_msg_info_str = 'info'
let g:ale_echo_msg_warning_str = 'warn'
" When set to `1` in your vimrc file, this option will cause ALE to run
" linters when you leave insert mode.
let g:ale_lint_on_insert_leave = 1
" A mapping from filetypes to |List| values for functions for fixing errors.
" See |ale-fix| for more information.
let g:ale_fixers = {
      \ 'c': [],
      \ 'cpp': [],
      \ 'css': [],
      \ 'go': [],
      \ 'haskell': [],
      \ 'javascript': [],
      \ 'json': [],
      \ 'python': [],
      \ 'ruby': [],
      \ 'sass': [],
      \ 'scss': [],
      \ 'typescript': [],
      \ }
" The |g:ale_linter_aliases| option can be used to set aliases from one
" filetype to another. A given filetype can be mapped to use the linters
" run for another given filetype.
let g:ale_linter_aliases = {
      \ 'bash': 'sh',
      \ 'zsh': 'sh',
      \ }
" The |g:ale_linters| option sets a |Dictionary| mapping a filetype to a
" |List| of linter programs to be run when checking particular filetypes.
let g:ale_linters = {
      \ 'bash': ['shellcheck'],
      \ 'c': ['clang'],
      \ 'cpp': ['clang', 'cpplint', 'cppcheck'],
      \ 'css': ['stylelint'],
      \ 'go': ['go', 'golint'],
      \ 'haskell': ['ghc', 'ghc-mod', 'hlint', 'hfmt'],
      \ 'html': ['htmlhint', 'tidy'],
      \ 'javascript': ['flow', 'eslint'],
      \ 'json': ['jsonlint'],
      \ 'kotlin': ['kotlinc', 'ktlint'],
      \ 'markdown': ['mdl', 'remark_lint'],
      \ 'python': ['pylint', 'pyls'],
      \ 'ruby': ['ruby', 'rubocop', 'rails_best_practices'],
      \ 'rust': ['rls', 'rustc'],
      \ 'sass': ['sass-lint', 'stylelint'],
      \ 'scss': ['scss-lint', 'stylelint'],
      \ 'typescript': ['tsserver', 'tslint'],
      \ 'vim': ['vint'],
      \ }
" A maximum file size in bytes for ALE to check. If set to any positive
" number, ALE will skip checking files larger than the given size.
let g:ale_maximum_file_size = 1024 * 1024 * 1024

nnoremap <silent> [q :ALEPrevious<CR>
nnoremap <silent> ]q :ALENext<CR>
"" }}}

"" Yggdroot/indentLine {{{
" Specify a character to be used as indent line.
let g:indentLine_char = '·'
" Specify terminal vim indent line color.
let g:indentLine_color_term = 59
" Specify terminal vim indent line background color.
let g:indentLine_bgcolor_term = 'NONE'
" Specify GUI vim indent line color.
let g:indentLine_color_gui = '#5c6370'
" Specify GUI vim indent line background color.
let g:indentLine_bgcolor_gui = 'NONE'
" This variable specify a list of file types.
" When opening these types of files, the plugin is enabled by
" default.
let g:indentLine_fileTypeExclude = [
      \ 'tagbar',
      \ 'vimfiler',
      \ 'SpaceVimRunner',
      \ 'SpaceVimREPL',
      \ 'SpaceVimQuickFix',
      \ 'HelpDescribe',
      \ 'VebuggerShell',
      \ 'VebuggerTerminal',
      \ ]
" Specify a character to show for leading spaces.
let g:indentLine_leadingSpaceChar = '·'
" Specify whether to show leading spaces by default.
let g:indentLine_leadingSpaceEnabled = 1
"" }}}

augroup SpaceVim_d_lang_json
  autocmd!
  autocmd FileType json setlocal foldmethod=syntax
augroup END

function s:h(group, style) abort
  call onedark#set_highlight(a:group, a:style)
endfunction

function s:setup_onedark() abort
  let s:colors = onedark#GetColors()

  call s:h('Normal', { 'fg': s:colors.white })

  call s:h('Pmenu', { 'fg': s:colors.black, 'bg': s:colors.white })
  call s:h('PmenuSel', { 'fg': s:colors.black, 'bg': s:colors.blue })
  call s:h('PmenuSbar', { 'bg': s:colors.white })

  call s:h('StartifyBracket', { 'fg': s:colors.white })
  call s:h('StartifyFile', { 'fg': s:colors.white })
  call s:h('StartifyHeader', { 'fg': s:colors.white })
  call s:h('StartifyNumber', { 'fg': s:colors.purple })
  call s:h('StartifyPath', { 'fg': s:colors.blue })
  call s:h('StartifySection', { 'fg': s:colors.green })
  call s:h('StartifySlash', { 'fg': s:colors.white })
  call s:h('StartifySpecial', { 'fg': s:colors.comment_grey })

  call s:h('LeaderGuideDesc', { 'fg': s:colors.white })
  call s:h('LeaderGuideKeys', { 'fg': s:colors.purple })
  call s:h('LeaderGuideBrackets', { 'fg': s:colors.white })

  call s:h('LeaderGuideGroupName', { 'fg': s:colors.blue })

  call s:h('vimfilerStatus', { 'fg': s:colors.green })
  call s:h('vimfilerCurrentDirectory', { 'fg': s:colors.green })

  call s:h('vimfilerNonMark', { 'fg': s:colors.blue })
  call s:h('vimfilerMark', { 'fg': s:colors.yellow })

  call s:h('vimfilerNormalFile', { 'fg': s:colors.white })
  call s:h('vimfilerMarkedFile', { 'fg': s:colors.yellow })
  call s:h('vimfilerDirectory', { 'fg': s:colors.blue })
  call s:h('vimfilerOpenedFile', { 'fg': s:colors.blue })
  call s:h('vimfilerClosedFile', { 'fg': s:colors.blue })
endfunction

augroup SpaceVim_d_colorscheme
  autocmd!
  autocmd ColorScheme onedark call s:setup_onedark()
augroup END

augroup SpaceVim_d_tools
  autocmd!
  autocmd User plugin-template-loaded call s:template_keywords()

  autocmd User MultipleCursorsPre :
  autocmd User MultipleCursorsPost :
augroup END

set autoindent expandtab smartindent smarttab
set autoread
set backspace=indent,eol,start
set colorcolumn=80 wrap
set complete& complete-=i
set concealcursor=niv conceallevel=2
set display& display+=lastline
set formatoptions& formatoptions-=ro formatoptions+=j
set history=1000
set hlsearch ignorecase incsearch smartcase wrapscan
set imdisable
set laststatus=2 tabpagemax=50
set list listchars=eol:¬,tab:»\ ,trail:·
set nobackup noswapfile nowritebackup
set noerrorbells
set noshowmode
set nrformats-=octal
set ruler
set scrolloff=1 sidescrolloff=5
set showcmd
set wildmenu

" vim: set et sw=2 cc=80
