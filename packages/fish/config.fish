if status is-interactive
	# Commands to run in interactive sessions can go here
	eval (/opt/homebrew/bin/brew shellenv)
	alias vim="nvim"
end

starship init fish | source
