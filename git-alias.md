# Summary

- Reset branch changes

    ```bash
    git config --global alias.reset-branch 'reset HEAD --hard' 
    ```
    Example: 
    
    - `git reset-branch origin/staging`

        Will reset the current head branch to the head in the origin/staging branch 

    - `git reset-branch origin/master`

        Will reset the current head branch to the head in the origin/master branch 

- Force push, but with lease

    ```bash
    git config --global alias.push-safeforce 'push --force-with-lease'
    ```

    Example: 

    - `git push-safeforce`

- Edit a commit

    ```bash
    git config --global alias.edit-commit 'commit --amend  --date=now'
    ```

    Example: 

    - `git edit-commit` 

- Show last 10 commits

    ```bash
    git config --global alias.last10-commits 'log --oneline --max-count=10'
    ```

    Show the last 10 commits.
    Example:  

    - `git last10-commits`

- Remove a specific file from commit

    ```bash
    git config --global alias.uncommit-file 'reset HEAD~1 --'
    ```

    Uncommit a file from the commit.

    Example:  

    - `git uncommit-file directory/file.txt`

 - Show files changed from last commit

   ```shell
   git config --global alias.last-commit-files 'show HEAD --name-only'
   ```

   Example:
   `git last-commit-files`
