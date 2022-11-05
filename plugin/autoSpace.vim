vim9script
var cg = {
	',[^ ]': "a ",
	'[^ <>=!]=[^ =]': "a \<Esc>la ",
	'\s*\s$': "D",
	'[^ <]<[^ <=]': "a \<Esc>la ",
	'[^ >]>[^ >=]': "a \<Esc>la ",
	'[^ ]>=[^ ]': "a \<Esc>lla ",
	'[^ ]<=[^ ]': "a \<Esc>lla ",
	'[^ ]==[^ ]': "a \<Esc>lla ",
	'[^ ]!=[^ ]': "a \<Esc>lla ",
	'[^ ]<<[^ ]': "a \<Esc>lla ",
	'[^ ]>>[^ ]': "a \<Esc>lla ",
	'^\t*{': "ddkA{",
	'} \?else': "a\<CR>"
}

def g:AutoSpace(): void
	normal mx
	for key in keys(cg)
		call ChangeChar(key, cg[key])
	endfor
	normal `x
enddef

def ChangeChar(before: string, do: string): void
	norm gg
	while search(before, 'p') == 1
		# call execute("norm " .. do)
		exec "norm " .. do
	endwhile
enddef
