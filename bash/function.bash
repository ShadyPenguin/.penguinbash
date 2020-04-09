# Penguin functions
remote_diff () {
	git outs
	read -n 1 -p "Press any key to proceed to diff" discard
	branch_name=$(git rev-parse --abbrev-ref HEAD)
	git diff origin/"$branch_name"..HEAD
}
