call plug#begin('~/.vim/plugged')

" Defaults {{{
  Plug 'tpope/vim-sensible'
" }}}

" Navigation {{{
  Plug 'junegunn/fzf', { 'do': 'yes \| ./install'  }
  Plug 'junegunn/fzf.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'FelikZ/ctrlp-py-matcher'
  Plug 'majutsushi/tagbar'

  " A tree explorer plugin for vim
  Plug 'scrooloose/nerdtree'

  " project configuration via 'projections'
  Plug 'tpope/vim-projectionist'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'vim-scripts/gitignore'
" }}}

" UI Additions {{{
  " Colors {{{
    Plug 'dolio/vim-hybrid'
    Plug 'morhetz/gruvbox'
    Plug 'chriskempson/base16-vim'
    Plug 'flazz/vim-colorschemes'
  " }}}

  " rainbow parentheses improved, shorter code, no level limit, smooth and fast, powerful configuration.
  Plug 'luochen1990/rainbow'

  " lean & mean status/tabline for vim that's light as air
  Plug 'bling/vim-airline'

  " Plugin to toggle, display and navigate marks
  Plug 'kshenoy/vim-signature'

  " Show a diff via Vim sign column.
  Plug 'mhinz/vim-signify'

  " Toggle the cursor shape in the terminal
  Plug 'jszakmeister/vim-togglecursor'

  " Seamless navigation between tmux panes and vim splits
  Plug 'christoomey/vim-tmux-navigator'

  " Better whitespace highlighting for Vim
  Plug 'ntpeters/vim-better-whitespace'
" }}}

" Commands {{{
  function! InstallVipe(info)
    if a:info.status == 'installed' || a:info.force
      if has("unix")
        let s:uname = system("uname -s")
        if s:uname =~ "Darwin"
          silent !rm -f /usr/local/bin/vipe
          silent !ln -s `pwd`/vipe /usr/local/bin || true
        else
          silent !ln -s `pwd`/vipe ~/bin || true
        endif
      endif
    endif
  endfunction

  function! InstallVimProc(info)
    if a:info.status == 'installed' || a:info.force
      if has("unix")
        let s:uname = system("uname -s")
        if s:uname =~ "Darwin"
          silent !make -f make_mac.mak
        elseif s:uname =~ "Linux"
          silent !make
        else
          silent !gmake
        endif
      elseif has("win32unix")
        silent !make -f make_cygwin.mak
      elseif has('win32')
        silent !tools\update-dll-mingw
      endif
    endif
  endfunction

  " asynchronous process manager; run :VimProcBang to run a command and echo the results
  Plug 'Shougo/vimproc.vim', { 'do': function('InstallVimProc') }

  " comment stuff out (via leader-/)
  Plug 'tpope/vim-commentary'

  " quoting/parenthesizing made simple; e.g. ysiw) to wrap word in parens
  Plug 'tpope/vim-surround'

  " a Git wrapper so awesome, it should be illegal; :Gblame, etc
  Plug 'tpope/vim-fugitive'

  " gitk for Vim.
  Plug 'gregsexton/gitv', { 'on': 'Gitv' }

  " easily search for, substitute, and abbreviate multiple variants of a word
  Plug 'tpope/vim-abolish'

  " Vim sugar for the UNIX shell commands that need it the most; e.g. :Find, :Wall
  Plug 'tpope/vim-eunuch'

  " Run a command over every entry in the quickfix list (:Cdo) or location list (:Ldo).
  Plug 'Peeja/vim-cdo'

  " Vim script for text filtering and alignment; e.g. :Tabularize /,
  Plug 'godlygeek/tabular'

  " Vim plugin for the Perl module / CLI script 'ack'
  Plug 'mileszs/ack.vim', { 'on': 'Ack' }

  " Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module / CLI script 'ack'
  Plug 'rking/ag.vim', { 'on': 'Ag' }

  " Send test commands to a pipe.
  Plug 'luan/vipe', { 'do': function('InstallVipe') }

  " asynchronous build and test dispatcher
  Plug 'tpope/vim-dispatch'

  " Syntax checking hacks for vim
  if has('nvim')
    Plug 'benekastah/neomake'
  else
    Plug 'scrooloose/syntastic'
  endif

  " Functions to toggle the [Location List] and the [Quickfix List] windows.
  Plug 'milkypostman/vim-togglelist'

  " True Sublime Text style multiple selections for Vim
  Plug 'terryma/vim-multiple-cursors'

  " Add emacs/bash/cocoa key bindings to vim, in insert and command-line modes.
  Plug 'maxbrunsfeld/vim-emacs-bindings'

  " The ultimate undo history visualizer for VIM
  Plug 'mbbill/undotree'

  " vimscript plugin library. It is designed for plugin authors.
  Plug 'google/vim-maktaba'

  " utility for syntax-aware code formatting
  Plug 'google/vim-codefmt'

  " utility for configuring maktaba plugins
  Plug 'google/vim-glaive'
  Plug 'munshkr/vim-tidal'
  Plug 'sbl/scvim'
" }}}

" Automatic Helpers {{{
  " wisely add "end" in ruby, endfunction/endif/more in vim script, etc
  Plug 'tpope/vim-endwise'

  " enable repeating supported plugin maps with '.'
  Plug 'tpope/vim-repeat'

  " automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
  Plug 'tpope/vim-sleuth'

  " pairs of handy bracket mappings; e.g. [<Space> and ]<Space> add newlines before and after the cursor line
  Plug 'tpope/vim-unimpaired'

  " auto-close paired chars, e.g. (), {}
  Plug 'Townk/vim-autoclose', { 'on': 'AutoCloseOn' }

  if has('nvim')
    " provides an asynchronous keyword completion system in the current buffer
    Plug 'Shougo/deoplete.nvim'
  elseif !(has('lua') && (v:version > 703 || v:version == 703 && has('patch885')))
    " Ultimate auto-completion system for Vim. Note: It is not maintained well. You should use neocomplete instead.
    Plug 'Shougo/neocomplcache.vim'
  else
    " Next generation completion framework after neocomplcache
    Plug 'Shougo/neocomplete.vim'
  endif
  " displays information in echo area from echodoc plugin.
  Plug 'Shougo/echodoc.vim'
" }}}

" Text objects {{{
  " allows you to configure % to match more than just single characters
  Plug 'matchit.zip'

  " Create your own text objects
  Plug 'kana/vim-textobj-user'

  " Underscore text-object for Vim
  Plug 'lucapette/vim-textobj-underscore'

  " custom text object for selecting ruby blocks
  Plug 'nelstrom/vim-textobj-rubyblock'
" }}}

" Snippets {{{
  " neo-snippet plugin contains neocomplcache snippets source
  Plug 'Shougo/neosnippet.vim'

  " The standard snippets repository for neosnippet
  Plug 'Shougo/neosnippet-snippets'
" }}}

" Language specific {{{
  " Ruby {{{
    Plug 'vim-ruby/vim-ruby',           { 'for': ['ruby', 'rake'] }
    Plug 'tpope/vim-rails',             { 'for': ['ruby', 'rake'] }
    Plug 'tpope/vim-rake',              { 'for': ['ruby', 'rake'] }
    Plug 'tpope/vim-bundler',           { 'for': ['ruby', 'rake'] }
    Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby', 'rake'] }
    Plug 'tpope/vim-cucumber',          { 'for': ['cucumber']     }
  " }}}

  " Elixir {{{
    Plug 'elixir-lang/vim-elixir',      { 'for': ['elixir'] }
    Plug 'mattreduce/vim-mix'
  " }}}

  " Clojure {{{
    Plug 'guns/vim-clojure-static', { 'for': ['clojure'] }
    Plug 'tpope/vim-classpath'
    Plug 'tpope/vim-fireplace',     { 'for': ['clojure'] }
    Plug 'tpope/vim-salve'
    Plug 'guns/vim-sexp'
    Plug 'tpope/vim-sexp-mappings-for-regular-people'
  " }}}

  " Scala {{{
    Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
  " }}}

  " Go {{{
    Plug 'fatih/vim-go'
    Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
  " }}}

  " Rust {{{
    Plug 'rust-lang/rust.vim'
  " }}}

  " C {{{
    Plug 'vim-scripts/c.vim'
  " }}}

  " Haskell {{{
    Plug 'neovimhaskell/haskell-vim'
  " }}}

  " Markdown {{{
    Plug 'shime/vim-livedown', { 'for': ['markdown'] }
  " }}}

  " JavaScript {{{
    Plug 'pangloss/vim-javascript',  { 'for': ['javascript']        }
    Plug 'mxw/vim-jsx',              { 'for': ['javascript']        }
    Plug 'maksimr/vim-jsbeautify',   { 'for': ['javascript']        }
    Plug 'kchmck/vim-coffee-script', { 'for': ['coffee']            }
    Plug 'elzr/vim-json'
  " }}}

  " CSS / HTML {{{
    Plug 'mattn/emmet-vim'
    Plug 'tpope/vim-haml',            { 'for': ['haml']              }
    Plug 'nono/vim-handlebars',       { 'for': ['handlebars']        }
    Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss','sass']       }
    Plug 'hail2u/vim-css3-syntax',    { 'for': ['css','scss','sass'] }
    Plug 'othree/html5.vim'
    Plug 'juvenn/mustache.vim',       { 'for': ['mustache']          }
    Plug 'gregsexton/MatchTag'
  " }}}

  " VimL {{{
    Plug 'ynkdir/vim-vimlparser', { 'for': 'vim' }
    Plug 'syngan/vim-vimlint',    { 'for': 'vim' }
  " }}}

  " Elixir {{{
    Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
  " }}}

  " Nginx {{{
    Plug 'fatih/vim-nginx'
  " }}}

  " Fish {{{
    Plug 'dag/vim-fish', { 'for': 'fish' }
  " }}}

  " Elm {{{
    Plug 'elmcast/elm-vim', { 'for': 'elm' }
  " }}}
" }}}

source $HOME/.vimrc.local.plugins

call plug#end()

if has('nvim')
  call maktaba#json#python#Disable()
endif

try
  call glaive#Install()
catch
endtry

