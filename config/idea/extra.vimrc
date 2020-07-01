" -*- mode: vimrc -*-

let mapleader = " "

" My own vim commands
set clipboard+=unnamed
set commentary
set easymotion
set history
set ideajoin=true
set idearefactormode=visual
set ignorecase
set matchpairs
set multiple-cursors
set number
set relativenumber
set smartcase
set surround
set wrapscan

" Resume last search
noremap <Leader>' :<C-u>action FindInPath<CR>
" Find file
noremap <Leader>. :<C-u>action SearchEverywhere<CR>
" Jump to bookmark
noremap <Leader><CR> :<C-u>action Bookmarks<CR>
" Switch buffer
noremap <Leader>\< :<C-u>action Switcher<CR>
" Switch to last buffer
noremap <Leader>` :<C-u>action GoToLastTab<CR>
" Toggle last popup
noremap <Leader>~ :<C-u>action JumpToLastWindow<CR>


"
" +buffer

noremap <Leader>bK :<C-u>qa!<CR>
noremap <Leader>bO :<C-u>action CloseAllEditorsButActive<CR>
noremap <Leader>bS :<C-u>wa<CR>
noremap <Leader>bd :<C-u>q!<CR>
noremap <Leader>bk :<C-u>q!<CR>
noremap <Leader>bs :<C-u>w<CR>


"
" +code

" Jump to references
noremap <Leader>cD :<C-u>action ShowUsages<CR>
" Execute code action
noremap <Leader>ca :<C-u>action ShowIntentionActions<CR>
" Compile
noremap <Leader>cc :<C-u>action CompileDirty<CR>
" Jump to definition
noremap <Leader>cd gd
" Format buffer/region
noremap <Leader>cf :<C-u>action ReformatCode<CR>
" Find implementations
noremap <Leader>ci :<C-u>action GotoImplementation<CR>
" Jump to symbol in current workspace
noremap <Leader>cj :<C-u>action SearchEverywhere<CR>
" Jump to documentation
noremap <Leader>ck :<C-u>action QuickJavaDoc<CR>
" Organize imports
noremap <Leader>co :<C-u>action OptimizeImports<CR>
" Rename
noremap <Leader>cr :<C-u>action RenameElement<CR>
" Find type definition
noremap <Leader>ct :<C-u>action GotoTypeDeclaration<CR>
" Recompile
noremap <Leader>cC :<C-u>action Compile<CR>

" Show error description
noremap <C-c>!h :<C-u>action ShowErrorDescription<CR>
" Go to previous error
nnoremap [e :<C-u>action GotoPreviousError<CR>
nnoremap <C-c>!p :<C-u>action GotoPreviousError<CR>
" Go to next error
nnoremap ]e :<C-u>action GotoNextError<CR>
nnoremap <C-c>!n :<C-u>action GotoNextError<CR>

" Go to previous method
nnoremap [[ :<C-u>action MethodUp<CR>
" Go to next method
nnoremap ]] :<C-u>action MethodDown<CR>


"
" +file

" Open project editorconfig
noremap <Leader>fc :<C-u>action NewEditorConfigFile<CR>
" Find file
noremap <Leader>ff :<C-u>action SearchEverywhere<CR>
" Recent files
noremap <Leader>fr :<C-u>action RecentFiles<CR>
" Save file
noremap <Leader>fs :<C-u>w<CR>
" Rename file
noremap <Leader>fR :<C-u>action RenameFile<CR>


"
" +git

" Jump to previous hunk
nnoremap <Leader>g[ :<C-u>action VcsShowPrevChangeMarker<CR>
" Jump to next hunk
nnoremap <Leader>g] :<C-u>action VcsShowNextChangeMarker<CR>
" Switch branch
noremap <Leader>gb :<C-u>action Git.Branches<CR>
noremap <Leader>gg :<C-u>action Git.Menu<CR>
" Revert hunk
noremap <Leader>gr :<C-u>action Vcs.RollbackChangedLines<CR>
" Blame
noremap <Leader>gB :<C-u>action Annotate<CR>
" Fetch
noremap <Leader>gF :<C-u>action Git.Fetch<CR>
" Git stage file
noremap <Leader>gS :<C-u>action Git.Add<CR>

" +create
" Pull request
noremap <Leader>gcp :<C-u>Github.Create.Pull.Reqeust<CR>

" +list
" List pull requests
noremap <Leader>glp :<C-u>Github.View.Pull.Reqeust<CR>

" +open in-browser
" Browse file or region
noremap <Leader>goo :<C-u>action Github.Open.In.Browser<CR>
" Browse a pull request
" This requires Find Pull Request plugin
noremap <Leader>gop :<C-u>com.github.shiraji.findpullrequest.action.FindPullRequestAction

nnoremap [d :<C-u>action VcsShowPrevChangeMarker<CR>
nnoremap ]d :<C-u>action VcsShowNextChangeMarker<CR>


"
" +insert

nnoremap <Leader>is :<C-u>action InsertLiveTemplate<CR>
vnoremap <Leader>is <Esc>:<C-u>action InsertLiveTemplate<CR>


"
" +open
noremap <Leader>oP :<C-u>action SelectInProjectView<CR>


"
" +project

" Run cmd in project root
noremap <Leader>p! :<C-u>action RunAnything<CR>
" Invalidate project cache
noremap <Leader>pi :<C-u>action InvalidateCaches<CR>
" Switch projects
noremap <Leader>pp :<C-u>action ManageRecentProjects<CR>
" List project tasks
noremap <Leader>pt :<C-u>action ActivateTODOToolWindow<CR>
" Run project
noremap <Leader>pR :<C-u>action Run<CR>


"
" +toggle

" Big mode (Presentation Mode)
noremap <Leader>tb :<C-u>action TogglePresentationMode<CR>
" Line numbers
noremap <Leader>tl :<C-u>action EditorToggleShowLineNumbers<CR>
" Read-only mode
noremap <Leader>tr :<C-u>action ToggleReadOnlyAttribute<CR>
" Soft line wrapping
noremap <Leader>tw :<C-u>action EditorToggleUseSoftWraps<CR>
" Zen mode (Distraction Free Mode)
noremap <Leader>tz :<C-u>action ToggleDistractionFreeMode<CR>
" Frame fullscreen
noremap <Leader>tF :<C-u>action ToggleFullScreen<CR>


"
" +window

noremap <Leader>wW <C-w>W
noremap <Leader>wc <C-w>c
noremap <Leader>wd <C-w>c
noremap <Leader>wh <C-w>h
noremap <Leader>wj <C-w>j
noremap <Leader>wk <C-w>k
noremap <Leader>wl <C-w>l
noremap <Leader>ws <C-w>s
noremap <Leader>wv <C-w>v
noremap <Leader>ww <C-w>w


"
" Others

nnoremap <Esc> :<C-u>nohl<CR><Esc>

" evil-escape
imap jk <Esc>

" Retain visual mode on selection shift
vnoremap < <gv
vnoremap > >gv

" Insert newline above
nnoremap [<Space> o<Esc>k
vnoremap [<Space> <Esc>o<Esc>k
" Insert newline below
nnoremap ]<Space> O<Esc>j
vnoremap ]<Space> <Esc>O<Esc>j

" Expand region
noremap <C-S-=> :<C-u>action EditorSelectWord<CR>
" Contract region
noremap <C-=> :<C-u>action EditorUnSelectWord<CR>

" easymotion
" This requires AceJump and IdeaVim-EasyMotion plugins
map gss <Plug>(easymotion-s2)
