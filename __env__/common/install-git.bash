one_day=86400

apt-get install -y git=1:2.17.1-1ubuntu0.4 && \
git config --global core.editor nano && \
git config credential.helper "cache --timeout=$one_day" && \
http -b get https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > /home/dev/.local/git-prompt.sh && \
http -b get https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > /home/dev/.local/git-completion.bash && \
echo 'export PS1="\[\033[32m\]\w\[\033[33m\]\$(__git_ps1)\[\033[00m\] λ "' > /home/dev/.local/custom-prompt.sh && \
echo 'source /home/dev/.local/git-prompt.sh' >> /home/dev/.bashrc && \
echo 'source /home/dev/.local/git-completion.bash' >> /home/dev/.bashrc && \
echo 'source /home/dev/.local/custom-prompt.sh' >> /home/dev/.bashrc
