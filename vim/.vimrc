if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
"=======================================================
" INSTALL PLUGINS
"========================================================
call plug#begin('~/.local/share/nvim/plugged')
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-rails'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mbbill/undotree'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-rhubarb'
Plug 'matze/vim-move'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './instalL --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'uarun/vim-protobuf'
Plug 'terryma/vim-smooth-scroll'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-cucumber'
Plug 'editorconfig/editorconfig-vim'
Plug 'bkad/CamelCaseMotion'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-projectionist'
Plug 'mhinz/vim-signify'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'schickling/vim-bufonly'
Plug 'rhysd/clever-f.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'zenbro/mirror.vim'
Plug 'vim-scripts/git-time-lapse'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'css', 'json', 'scss', 'typescript'] }
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'othree/eregex.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'galooshi/vim-import-js'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': ' arch -arm64 make' }
Plug 'kdheepak/lazygit.nvim'
Plug 'tomlion/vim-solidity'
Plug 'sindrets/winshift.nvim'
Plug 'ellisonleao/glow.nvim'
Plug 'itchyny/vim-cursorword'
Plug 'nvim-lua/plenary.nvim'
call plug#end()
syntax on
filetype on
filetype indent on
filetype plugin on
set ai
set autoread
set hidden
set ruler
set linespace=1
set wrap linebreak nolist
set breakindent
set nofoldenable
set tags=./tags;,tags;
" set number
" set relativenumber
set nornu
set autoindent
set clipboard=unnamedplus
set splitright
set splitbelow
set lazyredraw
set laststatus=2
set encoding=utf8
set background=dark
set textwidth=0
set wrapmargin=0
set cc=80
set expandtab
set bs=2 tabstop=2 shiftwidth=2 softtabstop=2
set backupcopy=yes
set pastetoggle=<F2>
set confirm
xnoremap p pgvy
" setlocal foldmethod=indent
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif
"========================================================
" Theme setup
" colorscheme edge
" let g:edge_style = 'neon'
" let g:edge_disable_italic_comment = 1
" let g:edge_transparent_background = 1
" colorscheme nord
colorscheme embark
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
let g:embark_terminal_italics = 1
"========================================================
set noshowmode
" == AUTOCMD ================================
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType typescript setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 formatprg=prettier\ --parser\ typescript
autocmd FileType typescript.tsx setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 formatprg=prettier\ --parser\ typescript
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================

"========================================================
" NEOVIM TREESISTER CONFIGURATION
"========================================================
lua <<EOF
require('nvim-treesitter.install').compilers = { "cl", "clang", "gcc" }
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash',
    'dockerfile',
    'html',
    'json',
    'lua',
    'yaml',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'markdown' },
  },
  indent = {
    enable = true,
    disable = { 'ruby', 'lua' }
  }
}

-- -- nvim-autopairs
local npairs = require'nvim-autopairs'
local Rule = require('nvim-autopairs.rule')
npairs.setup{ check_ts = true }
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

local remap = vim.api.nvim_set_keymap
_G.MUtils= {}
MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
      return npairs.esc("<cr>")
  else
    return npairs.autopairs_cr()
  end
end
remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
  Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']')
}
EOF
"========================================================
" NVIM-TREE CONFIGURATION
"========================================================
nnoremap <leader>ls :NvimTreeToggle<CR>
nnoremap <F1> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them
set termguicolors " this variable must be enabled for colors to be applied properly
lua <<EOF
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- default mappings
local list = {
  { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
  { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
  { key = "v",                            cb = tree_cb("vsplit") },
  { key = "x",                            cb = tree_cb("split") },
  { key = "t",                            cb = tree_cb("tabnew") },
  { key = "<",                            cb = tree_cb("prev_sibling") },
  { key = ">",                            cb = tree_cb("next_sibling") },
  { key = "P",                            cb = tree_cb("parent_node") },
  { key = "<BS>",                         cb = tree_cb("close_node") },
  { key = "<S-CR>",                       cb = tree_cb("close_node") },
  { key = "<Tab>",                        cb = tree_cb("preview") },
  { key = "K",                            cb = tree_cb("first_sibling") },
  { key = "J",                            cb = tree_cb("last_sibling") },
  { key = "I",                            cb = tree_cb("toggle_git_ignored") },
  { key = "H",                            cb = tree_cb("toggle_dotfiles") },
  { key = "R",                            cb = tree_cb("refresh") },
  { key = "a",                            cb = tree_cb("create") },
  { key = "d",                            cb = tree_cb("remove") },
  { key = "r",                            cb = tree_cb("rename") },
  { key = "<C-r>",                        cb = tree_cb("full_rename") },
  { key = "<C-x>",                        cb = tree_cb("cut") },
  { key = "<C-c>",                        cb = tree_cb("copy") },
  { key = "p",                            cb = tree_cb("paste") },
  { key = "y",                            cb = tree_cb("copy_name") },
  { key = "Y",                            cb = tree_cb("copy_path") },
  { key = "gy",                           cb = tree_cb("copy_absolute_path") },
  { key = "[c",                           cb = tree_cb("prev_git_item") },
  { key = "]c",                           cb = tree_cb("next_git_item") },
  { key = "-",                            cb = tree_cb("dir_up") },
  { key = "s",                            cb = tree_cb("system_open") },
  { key = "q",                            cb = tree_cb("close") },
  { key = "g?",                           cb = tree_cb("toggle_help") },
}
require'nvim-tree'.setup {
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  filters = {
    dotfiles = true,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = true,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  view = {
    width   = 40,
    height  = 30,
    hide_root_folder = false,
    side    = 'left',
    -- auto_resize = true,
    mappings = {
      list = list
    },
    number = false,
    relativenumber = false,
    signcolumn = 'yes'
  }
}
EOF
"========================================================
" CONFIG ALE
"========================================================
let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'python': ['black'],
      \ 'go': ['gofmt']
      \}
let g:ale_linters = {
      \   'javascript': ['prettier', 'eslint'],
      \   'typescript': ['tsserver', 'tslint'],
      \   'ruby': ['rubocop', 'ruby'],
      \   'go': ['golangci-lint', 'gofmt']
      \}
let g:ale_sign_error   = '✘'
let g:ale_sign_warning = '☢'
let g:ale_lint_on_text_changed="never"
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_highlights = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_fix_on_save = 0
" python
let g:ale_python_pylint_options = '--load-plugins pylint_django'
" javascript
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
highlight SignColumn guibg=255

"========================================================
" WIN SHIFT CONFIGURATION
"========================================================
lua <<EOF
-- Lua
require("winshift").setup({
  highlight_moving_win = true,  -- Highlight the window being moved
  focused_hl_group = "Visual",  -- The highlight group used for the moving window
  moving_win_options = {
    -- These are local options applied to the moving window while it's
    -- being moved. They are unset when you leave Win-Move mode.
    wrap = false,
    cursorline = false,
    cursorcolumn = false,
    colorcolumn = "",
  },
})
EOF
" Start Win-Move mode:
nnoremap <C-W><C-M> <Cmd>WinShift<CR>
nnoremap <C-W>m <Cmd>WinShift<CR>

" Swap two windows:
nnoremap <C-W>X <Cmd>WinShift swap<CR>

" If you don't want to use Win-Move mode you can create mappings for calling the
" move commands directly:
nnoremap <C-W>h <Cmd>WinShift left<CR>
nnoremap <C-W>j <Cmd>WinShift down<CR>
nnoremap <C-W>k <Cmd>WinShift up<CR>
nnoremap <C-W>l <Cmd>WinShift right<CR>

"========================================================
" CONFIG CAMELCASE MOTION
"========================================================
call camelcasemotion#CreateMotionMappings('<leader>')
"========================================================
" CONFIG CLEVER F
"========================================================
let g:clever_f_across_no_line = 1
"========================================================
" CONFIG COC NVIM
"========================================================
let g:coc_global_extensions = [
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier'
  \]
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"========================================================
" CONFIG LIGHTLINE
"========================================================
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ ['mode', 'paste'], [ 'gitbranch' ], ['readonly', 'filename'] ],
      \   'right': [ ['lineinfo'], [ 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'gitbranch#name',
      \   'percent': 'MyLightLinePercent',
      \   'lineinfo': 'MyLightLineLineInfo',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'modified': 'MyLightLineSignify'
      \ },
      \ }
let g:tcd_blacklist = '\v(cheat40|denite|gundo|help|nerdtree|netrw|peekaboo|quickmenu|startify|tagbar|undotree|unite|vimfiler|vimshell|fzf)'
function! LightlineFileformat()
  return &ft !~# g:tcd_blacklist && winwidth(0) > 70 ? &fileformat : ''
endfunction
function! LightlineFiletype()
  return &ft !~# g:tcd_blacklist && winwidth(0) > 70 ? &ft : ''
endfunction
function! Devicon()
  return &ft !~# g:tcd_blacklist && winwidth(0) > 70 ? (WebDevIconsGetFileTypeSymbol()) : ''
endfunction
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root && winwidth(0) > 40
    return &filetype !~# g:tcd_blacklist ? path[len(root)+1:] : ''
  elseif path[:len(root)-1] ==# root && winwidth(0) <= 40
    return &filetype !~# g:tcd_blacklist ? expand('%:t') : ''
  endif
  return &filetype !~# g:tcd_blacklist && winwidth(0) > 70 ? expand('%') : &filetype
endfunction
function! MyLightLinePercent()
  if &ft !~# g:tcd_blacklist && winwidth(0) > 70
    return line('.') * 100 / line('$') . '%'
  else
    return ''
  endif
endfunction
function! MyLightLineLineInfo()
  if &ft !~# g:tcd_blacklist
    return line('.').':'. col('.')
  else
    return ''
  endif
endfunction
function! MyLightLineSignify()
  let [added, modified, removed] = sy#repo#get_stats()
  let l:sy = ''
  for [flag, flagcount] in [
        \   [exists("g:signify_sign_add")?g:signify_sign_add:'+', added],
        \   [exists("g:signify_sign_delete")?g:signify_sign_delete:'-', removed],
        \   [exists("g:signify_sign_change")?g:signify_sign_change:'!', modified]
        \ ]
    if flagcount> 0
      let l:sy .= printf('%s%d', flag, flagcount)
    endif
  endfor
  if !empty(l:sy) && &ft !~# g:tcd_blacklist
    let l:sy = printf('[%s]', l:sy)
    let l:sy_vcs = get(b:sy, 'updated_by', '???')
    return printf('%s%s', l:sy_vcs, l:sy)
  else
    return ''
  endif
endfunction
"========================================================
" CONFIG MIRROR VIM
"========================================================
nnoremap <leader>mp :MirrorPush<CR>
nnoremap <leader>ml :MirrorPull<CR>
nnoremap <leader>md :MirrorDiff<CR>
nnoremap <leader>me :MirrorEdit<CR>
nnoremap <leader>mo :MirrorOpen<CR>
nnoremap <leader>ms :MirrorSSH<CR>
nnoremap <leader>mi :MirrorInfo<CR>
nnoremap <leader>mc :MirrorConfig<CR>
"========================================================
" CONFIG SIGNIFY
"========================================================
let g:signify_vcs_list = ['git']
let g:signify_sign_show_count = 0
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change            = '·'
let g:signify_sign_changedelete      = g:signify_sign_change
highlight SignifySignAdd guibg=255
highlight SignifySignDelete guibg=255
highlight SignifySignChange guibg=255
"========================================================
" MAPPING ALE
"========================================================
map <silent> <leader>p <ESC>:ALEFix<CR>
"========================================================
" MAPPING EASYMOTION
"========================================================
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap <silent> <tab> <Plug>(easymotion-overwin-w)
"========================================================
" MAPPING VIMSMOOTHSCROLL
"========================================================
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"========================================================
" MAPPING EASYALIGN
"========================================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"========================================================
" MAPPING RSPEC VIMTEST
"========================================================
map <Leader>tn :TestNearest<CR>
map <Leader>tf :TestFile<CR>
map <Leader>ts :TestNearest<CR>
map <Leader>tl :TestLast<CR>
map <Leader>ta :TestSuite<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>
" let test#ruby#rspec#executable = 'rspec'
"========================================================
" MAPPING TELESCOPE
"========================================================
" Find files using Telescope command-line sugar.
" nnoremap <c-p> <cmd>Telescope find_files theme=get_ivy<cr>
" nnoremap <c-f> <cmd>Telescope live_grep theme=get_ivy<cr>
nnoremap <c-o> <cmd>Telescope grep_string theme=get_ivy<cr>
nnoremap <leader>ff <cmd>Telescope file_browser<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope live_grep theme=get_dropdown<cr>
lua <<EOF
-- local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = "close"
      },
      n = {
        ["<esc>"] = "close"
      },
    },
    layout_strategy = "horizontal",
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}
-- require('telescope').load_extension('fzf')
EOF
"========================================================
" MAPPING FZF
"========================================================
" nnoremap <c-o> <ESC>:Tags<CR>
nnoremap <c-p> <ESC>:call fzf#vim#files('.', fzf#vim#with_preview())<CR>
nnoremap <c-f> <ESC>:Rg<space>
nnoremap <c-]> <ESC>:call fzf#vim#tags(expand("<cword>"), {'options': '--exact'})<cr>
nnoremap <silent> <leader>mm <ESC>:Commands<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :History:<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> K :call SearchWordWithRg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithRg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules'
let $FZF_DEFAULT_COMMAND = 'rg --files  --hidden --follow --glob "!{.git, node_modules}"'
command! -bang -nargs=* SearchExactWord call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --color=always --glob "!{.git, node_modules}" '.shellescape(<q-args>), 1, <bang>0)
function! SearchWordWithRg()
  execute 'SearchExactWord' expand('<cword>')
endfunction
function! SearchVisualSelectionWithRg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'SearchExactWord' selection
endfunction
let g:fzf_prefer_tmux = 1
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.3, 'border': 'sharp', 'yoffset': 1 } }
autocmd! FileType fzf set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 showmode ruler
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
"========================================================
" MISC MAPPING
"========================================================
map <silent> <leader>urt <ESC>:call URT()<CR>
map <silent> <leader>uet <ESC>:call UET()<CR>
nnoremap <silent> <CR> <ESC>:noh<CR>
map <silent> <leader>' cs'"
map <silent> <leader>" cs"'
map <silent> <space>h <C-W><C-H>
map <silent> <space>j <C-W><C-J>
map <silent> <space>k <C-W><C-K>
map <silent> <space>l <C-W><C-L>
map <silent> <leader>u :UndotreeToggle<CR>
map <silent> <leader>i <ESC>:call IndentGuideToggle()<CR>
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <silent> <expr> ^ (v:count == 0 ? 'g^' : '^')
noremap <silent> <expr> $ (v:count == 0 ? 'g$' : '^')
nmap <silent> <leader>t :TagbarToggle<CR>
if has("nvim")
  tnoremap <c-e> <C-\><C-n>
end
" Copy file name / relative path / fullpath
nmap <silent> cprp :let @+=expand("%")<CR>
nmap <silent> cpfp :let @+ = expand("%:p")<CR>
nmap <silent> cpfn :let @+ = expand("%:t")<CR>
" Jump to reference file under cursor in split window
nnoremap gf :vertical wincmd f<CR>
nnoremap <C-W><C-F> gf
"========================================================
" Misc Functions
"========================================================
" Update ruby ctags
function! URT()
  return system('ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)')
endfunction
function! UET()
  return system('ctags -R --languages=elixir --exclude=.git --exclude=log .')
endfunction
" Toogle indents
function! IndentGuideToggle()
  let g:indent_guide_displayed = get(g:, 'indent_guide_displayed', '0')
  if g:indent_guide_displayed=='0'
    let g:indent_guide_displayed = '1'
    execute 'IndentLinesEnable'
    set colorcolumn=+1
  else
    let g:indent_guide_displayed = '0'
    execute 'IndentLinesDisable'
    set colorcolumn=0
  endif
endfunction
"========================================================
" AUGROUP
"========================================================
  " :augroup numbertoggle
  " :  autocmd!
  " :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  " :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  " :augroup END

"========================================================
" JAVASCRIPT CONFIGURATION
"========================================================
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

"========================================================
" TYPESCRIPT CONFIGURATION
"========================================================
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"========================================================
" EREGEX
"========================================================
let g:eregex_default_enable = 0

"========================================================
" PRETTIER CONFIGURATION
"========================================================
noremap <Leader>P :Prettier<CR>
"========================================================
" VIM TABLE MODE CONFIGURATION
"========================================================
noremap <Leader>tm :TableModeToggle<CR>
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
"========================================================
" LAZYGIT
"========================================================
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 0 " fallback to 0 if neovim-remote is not installed
nnoremap <silent> <leader>lg :LazyGit<CR>
nnoremap <silent> <leader>lgc :LazyGitConfig<CR>
"========================================================
" GLOW FOR MARKDOWN
"========================================================
lua <<EOF
require('glow').setup({
  style = 'dark',
  border = { "/", "-", "\\", "|" },
  pager = false,
  width = 160
})
EOF
nnoremap <Leader>gw :Glow<CR>
"========================================================
" MISC CONFIG
"========================================================
"Autopair
let g:AutoPairsMultilineClose = 0
" Indentline
let g:indentLine_char = '│'
let g:indentLine_enabled = 0
let g:indentLine_color_term = 239
" Rpsec vimtest config
let test#strategy = "vimux"
let g:VimuxUseNearest = 0
" Vim move
let g:move_key_modifier = 'C'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.html.eex,*.html.erb"

"========================================================
" MIGRATION OLD VIM CONFIGURATION
"========================================================
set cursorline
set nowrap
set title
set formatoptions=tcqronj
set showtabline=0

" Map keyboard for Vim Tab /vim-buffet
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>

function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=5 ctermfg=8 guibg=#00FF00 guifg=#000000
endfunction
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"
" mouse interractive
set mouse=nicr
set smartindent
autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespace
let g:netrw_localrmdir='rm -r'
filetype plugin indent on
" Copy to 'clipboard registry'
vmap <C-c> "*y
" Yank to the end of line
nnoremap Y y$
" Visual to the last char of line
nnoremap v$ v$h
" Paste to newline
" nnoremap Np o<c-r>*<ESC>
" Select all text
nmap <C-a> ggVG
" Break to new line
nnoremap Jn i<CR><ESC>
" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" Toggle vim relative number
nmap <C-L><C-L> :set invrelativenumber<CR>
" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap - -<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
" Switch between the last two files
nnoremap <Leader><Leader> <C-^>
" Get off my lawn
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" vim folding configuration
set foldmethod=indent
" set foldmethod=marker
set foldlevelstart=20
" vim zoom
noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=
" vim key mapping
nmap <C-e> A<ESC>
nmap <C-i> I<ESC>
" vim Surround customization
autocmd FileType ruby let b:surround_45 = "do \r end"
" better whitespace
autocmd BufWritePre * %s/\s\+$//e
" JSON prettier
nmap <C-r>mj :%!python3 -m json.tool<CR>
" clear console
nnoremap <silent> <CR> <ESC>:noh<CR>
" change border style
set fillchars=eob:\ ,fold:\ ,vert:\⏽
" always no paste
set nopaste
" vim quick open replace text
noremap <c-r><c-p> :%s<space>
