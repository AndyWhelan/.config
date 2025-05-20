All the files in this directory are those visible from `~`.
The .gitignore specifies to ignore everything by default unless specified.
For ease-of-use locally, the files in the top-level are symlinked to `./.config`

There is also a `symlinker.bash` script that will setup the appropriate symlinks

NOTE: `.gitattributes` won't be applied in GitLab web IDE 
(see [here](https://docs.gitlab.com/user/project/repository/files/highlighting/)).
