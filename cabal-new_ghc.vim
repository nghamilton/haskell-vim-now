" Author: w0rp <devw0rp@gmail.com>
" Description: ghc for Haskell files

call ale#Set('haskell_ghc_options', '-fno-code -v0')

function! ale_linters#haskell#cabal_ghc#GetCommand(buffer) abort
    return 'cabal new-exec ghc --'
    \   . ale#Var(a:buffer, 'haskell_ghc_options')
    \   . ' %t'
endfunction

call ale#linter#Define('haskell', {
\   'name': 'cabal-new_ghc',
\   'output_stream': 'stderr',
\   'executable': 'cabal-new',
\   'command_callback': 'ale_linters#haskell#cabal_ghc#GetCommand',
\   'callback': 'ale#handlers#haskell#HandleGHCFormat',
\})
