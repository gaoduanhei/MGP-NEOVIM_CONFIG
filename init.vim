call plug#begin('~/.config/nvim/plugged')
Plug 'theniceboy/vim-deus'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
Plug 'connorholyday/vim-snazzy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'mattn/emmet-vim'
"this is react plug"
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
"注释"
Plug 'preservim/nerdcommenter'
"对齐线"
Plug 'Yggdroot/indentLine'
"状态栏"
Plug 'ryanoasis/vim-devicons'
Plug 'glepnir/spaceline.vim'
"彩色括号
Plug 'kien/rainbow_parentheses.vim'
"多重选择
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()
"对齐线颜色"
let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
" let g:indentLine_color_gui = '#FFFFFF'
"basic settings"
map R :source $MYVIMRC<CR>
set nu
set relativenumber
set cursorline
set showcmd
set ignorecase
set smartcase
" set fdm=indent
" zo 打开一个折叠。
" zc 关闭一个折叠。
" za 当关闭时打开，当打开时关闭。
" zo、zc、za 对应 zO、zC 和 zA；以递归形式改变折叠状态。
" zR 打开全部折叠。
" zM 关闭全部折叠。
"显示文件名和文件路径"

" set statusline=%1*\%<%.50F\             "显示文件名和文件路径 (%<应该可以去掉)
" set statusline+=%=%2*\%y%m%r%h%w\ %*        "显示文件类型及文件状态
" set statusline+=%3*\%{&ff}\[%{&fenc}]\ %*   "显示文件编码类型
" set statusline+=%4*\ row:%l/%L,col:%c\ %*   "显示光标所在行和列
" set statusline+=%5*\%3p%%\%*
" hi User1 cterm=none ctermfg=25 ctermbg=0
" hi User2 cterm=none ctermfg=208 ctermbg=0
" hi User3 cterm=none ctermfg=169 ctermbg=0
" hi User4 cterm=none ctermfg=100 ctermbg=0
" hi User5 cterm=none ctermfg=green ctermbg=0

colorscheme deus
set background=dark

hi Normal guibg=NONE ctermbg=NONE
"行号颜色"
highlight LineNr ctermfg=Cyan
highlight CursorLineNr ctermfg=Yellow
highlight CursorLinenr ctermbg=NONE
"map key esc to jj"
inoremap jj <esc>
" noremap U 5k
" noremap E 5j
nnoremap mm :CocCommand translator.popup<CR>
let g:coc_global_extensions = ['coc-marketplace', 'coc-prettier', 'coc-html', 'coc-tsserver', 'coc-json', 'coc-css', 'coc-vimlsp', 'coc-actions', 'coc-translator', 'coc-vetur']
"below this line are easymotion key map settings"
"search single string"
map <space><space> <Plug>(easymotion-bd-f)
nmap <space><space> <Plug>(easymotion-overwin-f)
"search double string"
nmap ss <Plug>(easymotion-overwin-f2)
"jump to line"
map L <Plug>(easymotion-bd-jk)
nmap <space>L <Plug>(easymotion-overwin-line)
"seach word "
map  <space>w <Plug>(easymotion-bd-w)
nmap <space>w <Plug>(easymotion-overwin-w)
"above this line are easymotion key map settings"

"below this line are nerdtree settings"
map tt :NERDTreeMirror<CR>
map tt :NERDTreeToggle<CR>


"this is coc.nvim settings"
"""
""
" TextEdit might fail if hidden is not set.
set hidden
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"让我的tab管用"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR>也就是回车来确定补全内容 auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"使用[g和]g来跳转上一个报错和下一个报错"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
"显示函数"
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
"高亮一样的词"
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"aboce is coc settings"
""
"prettier settings"
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"注释"
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
"注释"
"下面状态栏
let g:spaceline_seperate_style = 'none'
let g:spaceline_colorscheme = 'one'
let g:spaceline_diagnostic_tool='coc'
"rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
