" Vim syntax file
" Language:     Remarkup
" Maintainer:   Anthony Barbier
" Filenames:    *.remarkup
" Last Change:  2020 May 20

if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'remarkup'
endif

runtime! syntax/html.vim
unlet! b:current_syntax

if !exists('g:remarkup_fenced_languages')
  let g:remarkup_fenced_languages = []
endif
let s:done_include = {}
for s:type in map(copy(g:remarkup_fenced_languages),'matchstr(v:val,"[^=]*$")')
  if has_key(s:done_include, matchstr(s:type,'[^.]*'))
    continue
  endif
  if s:type =~ '\.'
    let b:{matchstr(s:type,'[^.]*')}_subtype = matchstr(s:type,'\.\zs.*')
  endif
  exe 'syn include @remarkupHighlight'.substitute(s:type,'\.','','g').' syntax/'.matchstr(s:type,'[^.]*').'.vim'
  unlet! b:current_syntax
  let s:done_include[matchstr(s:type,'[^.]*')] = 1
endfor
unlet! s:type
unlet! s:done_include

if !exists('g:remarkup_minlines')
  let g:remarkup_minlines = 50
endif
execute 'syn sync minlines=' . g:remarkup_minlines
syn case ignore

syn match remarkupValid '[<>]\c[a-z/$!]\@!' transparent contains=NONE
syn match remarkupValid '&\%(#\=\w*;\)\@!' transparent contains=NONE

syn match remarkupLineStart "^[<@]\@!" nextgroup=@remarkupBlock,htmlSpecialChar

syn cluster remarkupBlock contains=remarkupH1,remarkupH2,remarkupH3,remarkupH4,remarkupH5,remarkupH6,remarkupBlockquote,remarkupListMarker,remarkupOrderedListMarker,remarkupCodeBlock,remarkupRule
syn cluster remarkupInline contains=remarkupLineBreak,remarkupLinkText,remarkupItalic,remarkupBold,remarkupCode,remarkupEscape,@htmlTop,remarkupError,remarkupValid

syn match remarkupH1 "^= .\+$" contained contains=@remarkupInline,remarkupHeadingRule,remarkupAutomaticLink
syn match remarkupH2 "^== .\+$" contained contains=@remarkupInline,remarkupHeadingRule,remarkupAutomaticLink
syn match remarkupH3 "^=== .\+$" contained contains=@remarkupInline,remarkupHeadingRule,remarkupAutomaticLink
syn match remarkupH4 "^==== .\+$" contained contains=@remarkupInline,remarkupHeadingRule,remarkupAutomaticLink

syn match remarkupHeadingRule "^[=-]\+$" contained

syn region remarkupH1 matchgroup=remarkupH1Delimiter start="=#\@!"      end="#*\s*=$" keepend oneline contains=@remarkupInline,remarkupAutomaticLink contained
syn region remarkupH2 matchgroup=remarkupH2Delimiter start="==#\@!"     end="#*\s*==$" keepend oneline contains=@remarkupInline,remarkupAutomaticLink contained
syn region remarkupH3 matchgroup=remarkupH3Delimiter start="===#\@!"    end="#*\s*===$" keepend oneline contains=@remarkupInline,remarkupAutomaticLink contained
syn region remarkupH4 matchgroup=remarkupH4Delimiter start="====#\@!"   end="#*\s*====$" keepend oneline contains=@remarkupInline,remarkupAutomaticLink contained
syn region remarkupH5 matchgroup=remarkupH5Delimiter start="######\@!"  end="#*\s*$" keepend oneline contains=@remarkupInline,remarkupAutomaticLink contained
syn region remarkupH6 matchgroup=remarkupH6Delimiter start="#######\@!" end="#*\s*$" keepend oneline contains=@remarkupInline,remarkupAutomaticLink contained

syn match remarkupBlockquote ">\%(\s\|$\)" contained nextgroup=@remarkupBlock

syn region remarkupCodeBlock start="  \|\t" end="$" contained

" TODO: real nesting
syn match remarkupListMarker "\%(\t\| \{0,4\}\)[-*+]\%(\s\+\S\)\@=" contained
syn match remarkupOrderedListMarker "\%(\t\| \{0,4}\)\<\d\+\.\%(\s\+\S\)\@=" contained

syn match remarkupRule "\* *\* *\*[ *]*$" contained
syn match remarkupRule "- *- *-[ -]*$" contained

syn match remarkupLineBreak " \{2,\}$"

syn region remarkupIdDeclaration matchgroup=remarkupLinkDelimiter start="^ \{0,3\}!\=\[" end="\]:" oneline keepend nextgroup=remarkupUrl skipwhite
syn match remarkupUrl "\S\+" nextgroup=remarkupUrlTitle skipwhite contained
syn region remarkupUrl matchgroup=remarkupUrlDelimiter start="<" end=">" oneline keepend nextgroup=remarkupUrlTitle skipwhite contained
syn region remarkupUrlTitle matchgroup=remarkupUrlTitleDelimiter start=+"+ end=+"+ keepend contained
syn region remarkupUrlTitle matchgroup=remarkupUrlTitleDelimiter start=+'+ end=+'+ keepend contained
syn region remarkupUrlTitle matchgroup=remarkupUrlTitleDelimiter start=+(+ end=+)+ keepend contained

syn region remarkupLinkText matchgroup=remarkupLinkTextDelimiter start="!\=\[\%(\%(\_[^][]\|\[\_[^][]*\]\)*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=remarkupLink,remarkupId skipwhite contains=@remarkupInline,remarkupLineStart
syn region remarkupLink matchgroup=remarkupLinkDelimiter start="(" end=")" contains=remarkupUrl keepend contained
syn region remarkupId matchgroup=remarkupIdDelimiter start="\[" end="\]" keepend contained
syn region remarkupAutomaticLink matchgroup=remarkupUrlDelimiter start="<\%(\w\+:\|[[:alnum:]_+-]\+@\)\@=" end=">" keepend oneline

let s:concealends = ''
if has('conceal') && get(g:, 'remarkup_syntax_conceal', 1) == 1
  let s:concealends = ' concealends'
endif
exe 'syn region remarkupItalic matchgroup=remarkupItalicDelimiter start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" skip="\\\*" contains=remarkupLineStart,@Spell' . s:concealends
exe 'syn region remarkupItalic matchgroup=remarkupItalicDelimiter start="\w\@<!_\S\@=" end="\S\@<=_\w\@!" skip="\\_" contains=remarkupLineStart,@Spell' . s:concealends
exe 'syn region remarkupBold matchgroup=remarkupBoldDelimiter start="\S\@<=\*\*\|\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" skip="\\\*" contains=remarkupLineStart,remarkupItalic,@Spell' . s:concealends
exe 'syn region remarkupBold matchgroup=remarkupBoldDelimiter start="\w\@<!__\S\@=" end="\S\@<=__\w\@!" skip="\\_" contains=remarkupLineStart,remarkupItalic,@Spell' . s:concealends
exe 'syn region remarkupBoldItalic matchgroup=remarkupBoldItalicDelimiter start="\S\@<=\*\*\*\|\*\*\*\S\@=" end="\S\@<=\*\*\*\|\*\*\*\S\@=" skip="\\\*" contains=remarkupLineStart,@Spell' . s:concealends
exe 'syn region remarkupBoldItalic matchgroup=remarkupBoldItalicDelimiter start="\w\@<!___\S\@=" end="\S\@<=___\w\@!" skip="\\_" contains=remarkupLineStart,@Spell' . s:concealends

syn region remarkupCode matchgroup=remarkupCodeDelimiter start="`[^`]*" end="`" keepend contains=remarkupLineStart
syn region remarkupCode matchgroup=remarkupCodeDelimiter start="`` \=" end=" \=``" keepend contains=remarkupLineStart
syn region remarkupCode matchgroup=remarkupCodeDelimiter start="^\s*````*.*$" end="^\s*````*\ze\s*$" keepend

syn match remarkupFootnote "\[^[^\]]\+\]"
syn match remarkupFootnoteDefinition "^\[^[^\]]\+\]:"

if main_syntax ==# 'remarkup'
  let s:done_include = {}
  for s:type in g:remarkup_fenced_languages
    if has_key(s:done_include, matchstr(s:type,'[^.]*'))
      continue
    endif
    exe 'syn region remarkupHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\..*','','').' matchgroup=remarkupCodeDelimiter start="^\s*````*\s*\%({.\{-}\.\)\='.matchstr(s:type,'[^=]*').'}\=\S\@!.*$" end="^\s*````*\ze\s*$" keepend contains=@remarkupHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\.','','g') . s:concealends
    let s:done_include[matchstr(s:type,'[^.]*')] = 1
  endfor
  unlet! s:type
  unlet! s:done_include
endif

syn match remarkupEscape "\\[][\\`*_{}()<>#+.!-]"
syn match remarkupError "\w\@<=_\w\@="

hi def link remarkupH1                    htmlH1
hi def link remarkupH2                    htmlH2
hi def link remarkupH3                    htmlH3
hi def link remarkupH4                    htmlH4
hi def link remarkupH5                    htmlH5
hi def link remarkupH6                    htmlH6
hi def link remarkupHeadingRule           remarkupRule
hi def link remarkupH1Delimiter           remarkupHeadingDelimiter
hi def link remarkupH2Delimiter           remarkupHeadingDelimiter
hi def link remarkupH3Delimiter           remarkupHeadingDelimiter
hi def link remarkupH4Delimiter           remarkupHeadingDelimiter
hi def link remarkupH5Delimiter           remarkupHeadingDelimiter
hi def link remarkupH6Delimiter           remarkupHeadingDelimiter
hi def link remarkupHeadingDelimiter      Delimiter
hi def link remarkupOrderedListMarker     remarkupListMarker
hi def link remarkupListMarker            htmlTagName
hi def link remarkupBlockquote            Comment
hi def link remarkupRule                  PreProc

hi def link remarkupFootnote              Typedef
hi def link remarkupFootnoteDefinition    Typedef

hi def link remarkupLinkText              htmlLink
hi def link remarkupIdDeclaration         Typedef
hi def link remarkupId                    Type
hi def link remarkupAutomaticLink         remarkupUrl
hi def link remarkupUrl                   Float
hi def link remarkupUrlTitle              String
hi def link remarkupIdDelimiter           remarkupLinkDelimiter
hi def link remarkupUrlDelimiter          htmlTag
hi def link remarkupUrlTitleDelimiter     Delimiter

hi def link remarkupItalic                htmlItalic
hi def link remarkupItalicDelimiter       remarkupItalic
hi def link remarkupBold                  htmlBold
hi def link remarkupBoldDelimiter         remarkupBold
hi def link remarkupBoldItalic            htmlBoldItalic
hi def link remarkupBoldItalicDelimiter   remarkupBoldItalic
hi def link remarkupCodeDelimiter         Delimiter

hi def link remarkupEscape                Special
hi def link remarkupError                 Error

let b:current_syntax = "remarkup"
if main_syntax ==# 'remarkup'
  unlet main_syntax
endif

" vim:set sw=2:


