" Vim syntax file
" Language:     OneScript
" Maintainer:   Sergey Batanov <sergey.batanov@dmpas.ru>
" Last Change:  2016-06-04

" Однопись для Вима

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax case ignore

syn keyword onescriptStatement	если тогда иначеесли конецесли иначе
syn keyword onescriptStatement	для каждого из пока цикл по конеццикла
syn keyword onescriptStatement	возврат
syn keyword onescriptStatement	перем знач экспорт прервать продолжить
syn keyword onescriptStatement	попытка исключение конецпопытки вызватьисключение
syn keyword onescriptStatement	и не в или
syn keyword onescriptStatement	истина ложь неопределено
syn keyword onescriptStatement	новый

syn keyword onescriptStatement	if then elseif endif else
syn keyword onescriptStatement	for each from while do to enddo
syn keyword onescriptStatement	return
syn keyword onescriptStatement	var val export break continue
syn keyword onescriptStatement	try except endtry raise
syn keyword onescriptStatement	and not in or
syn keyword onescriptStatement	true false undefined
syn keyword onescriptStatement	new

syn keyword onescriptFunction	число дата строка
syn keyword onescriptFunction	текущаядата
syn keyword onescriptFunction	сообщить
syn keyword onescriptFunction	найтифайлы копироватьфайл переместитьфайл удалитьфайл
syn keyword onescriptFunction	началодня конецдня началомесяца конецмесяца началогода конецгода началоквартала конецквартала
syn keyword onescriptFunction	добавитьмесяц

syn keyword onescriptFunction	врег нрег трег нстр найти стрзаменить

syn keyword onescriptTodo contained	TODO

" syn match onescriptIdentifier   "\<[а-яё]*\>"

"integer number, or floating point number without a dot.
syn match  onescriptNumber		"\<\d\+\>"
"floating point number, with dot
syn match  onescriptNumber		"\<\d\+\.\d*\>"
"floating point number, starting with a dot
syn match  onescriptNumber		"\.\d\+\>"

" String and Character contstants
" syn match   onescriptSpecial contained "\\\d\d\d\|\\."
syn region  onescriptString		  start=+"\||+  end=+"\|$+

syn region  onescriptComment	start="//" end="$" contains=onescriptTodo
syn region  onescriptPreprocessor start="#" end="$"
syn region  onescriptDirective start="&" end="$"

syn match  onescriptSpecial display '[{}()\[\]\.;=+<>-]'
syn match  onescriptSpecial display '\/[^\/]'
syn match  onescriptSpecial display '\*'

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_onescript_syntax_inits")
	if version < 508
		let did_onescript_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink onescriptLabel         Label
	HiLink onescriptConditional   Conditional
	HiLink onescriptRepeat        Repeat
	HiLink onescriptLineNumber    Comment
	HiLink onescriptNumber        Number
	HiLink onescriptError         Error
	HiLink onescriptStatement     Statement
	HiLink onescriptString        String
	HiLink onescriptComment       Comment
	HiLink onescriptPreprocessor  PreProc
	HiLink onescriptDirective     PreProc
	HiLink onescriptSpecial       Special
	HiLink onescriptTodo          Todo
	HiLink onescriptFunction      Identifier
	HiLink onescriptTypeSpecifier Type
	HiLink onescriptIdentifier    Normal
	"hi onescriptMathsOperator term=bold cterm=bold gui=bold

	delcommand HiLink
endif

let b:current_syntax = "onescript"
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
set number
set nowrap
set foldmethod=syntax

syntax region osFoldFunction
	\ matchgroup=onescriptStatement
	\ start="\c\<функция\>\|\<function\>"
	\ end="\c\<конецфункции\>\|\<endfunction\>"
	\ transparent fold
	\ keepend extend

syntax region osFoldProcedure
	\ matchgroup=onescriptStatement
	\ start="\c\<процедура\>\|\<procedure\>"
	\ end="\c\<конецпроцедуры\>\|\<endprocedure\>"
	\ transparent fold
	\ keepend extend


let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=4 noet
