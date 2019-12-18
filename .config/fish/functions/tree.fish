# Defined in - @ line 1
function tree --description alias\ tree=tree\ -C\ -a\ -I\ \'.git\'
	command tree -C -a -I '.git' $argv;
end
