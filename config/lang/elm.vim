" autocomplete only on attributes; doesn't seem to complete local vars
if has('nvim')
  let g:deoplete#omni_patterns.elm = '\.'
endif

" show types in autocomplete menu
let g:elm_detailed_complete = 1

" format on autosave
let g:elm_format_autosave = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:elm_syntastic_show_warnings = 1

call neocomplete#util#set_default_dictionary(
  \ 'g:neocomplete#sources#omni#input_patterns',
  \ 'elm',
  \ '\.')
