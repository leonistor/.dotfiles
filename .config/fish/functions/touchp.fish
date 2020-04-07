function touchp --description 'Create new file and make folders'
command mkdir -p (dirname $argv) && touch $argv
end
