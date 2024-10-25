package git
import future.keywords.in

deny[msg]{
    some file in input.status
    file.worktree == "modified"
    msg := "file is modified"
}

deny[msg]{
    not input.signature
    msg := "Commit signature doesnt exist"
}
