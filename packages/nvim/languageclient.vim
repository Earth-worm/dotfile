let g:LanguageClient_serverCommands = {}
if executable('clangd')
	let g:LanguageClient_serverCommands['c'] = ['clangd']
	let g:LanguageClient_serverCommands['cpp'] = ['clangd']
endif