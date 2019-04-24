credential_cache_timeout=86400

apt-get install -y git=1:2.17.1-1ubuntu0.4

git config --global core.editor nano
git config --global credential.helper "cache --timeout=$credential_cache_timeout"

http -b get https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > /home/dev/.local/git-completion.bash

cat << EOF >> /home/dev/.bashrc

function parse_git_branch() {
  # changing directories lets us catch up
  # to Docker's layered file system
  # after killing an NPM script.
  cd .
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\w\[\033[33m\]\\\$(parse_git_branch)\[\033[00m\] λ "

EOF

echo 'source /home/dev/.local/git-completion.bash' >> /home/dev/.bashrc
