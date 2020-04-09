# Penguin functions
remote_diff () {
	branch_name=$(git rev-parse --abbrev-ref HEAD)
	git diff origin/"$branch_name"..HEAD
}
