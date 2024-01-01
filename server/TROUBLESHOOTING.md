# Troubleshooting

### RVM install ruby fails: `"Error running '__rvm_make -j8'"`
Following this [PR issue comment](https://github.com/rvm/rvm/issues/5254#issuecomment-1715949173) solution seems to address it. `brew install <relevant libraries only>` and then reinstall after successful ruby install.
* If zsh + iTerm, restart terminal upon installs completing.

```
brew uninstall --ignore-dependencies openssl@3
RUBY_CONFIGURE_OPTS=--with-openssl-dir=/opt/homebrew/opt/openssl@1.1 rvm install ${VERSION}

bundle install

brew install openssl@3
```


### Git gets into a funky state and does not detect changed files, verify `git fsck --full`
If see a dangling blob sha, then run `git update-index --ignore-missing --add <must be a file path>`. This will help register the new content. Once that is done, changes should be detected and can proceed to stage changes in bulk.

Once up to date, run `git fsck --full` and clean state should be reflected.