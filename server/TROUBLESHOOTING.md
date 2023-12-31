# Troubleshooting

### RVM install ruby fails: `"Error running '__rvm_make -j8'"`
Following this PR issue comment solution seems to address it. `brew install <relevant libraries only>` and then reinstall after successful ruby install.
* If zsh + iTerm, restart terminal upon installs completing.


### Git gets into a funky state and does not detect changed files, verify `git fsck --full`
If see a dangling blob sha, then run `git update-index --ignore-missing --add <must be a file path>`. This will help register the new content. Once that is done, changes should be detected and can proceed to stage changes in bulk.

Once up to date, run `git fsck --full` and clean state should be reflected.