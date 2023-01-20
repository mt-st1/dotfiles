let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" FindMotion
map <C-s> <Plug>(easymotion-overwin-f2)
" LineMotion
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)
nmap <Space>l <Plug>(easymotion-overwin-line)

