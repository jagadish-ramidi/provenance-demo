package git
import future.keywords.in

deny[msg]{
    some file in input.status
    file.worktree == "modified"
    msg := "file is modified"
}