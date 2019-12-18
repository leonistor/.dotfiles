# Defined in - @ line 1
function dotfiles --description 'alias dotfiles=/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
	/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv;
end
