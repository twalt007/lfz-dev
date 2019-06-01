function install-node() {

  local nvm_url=https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh

  mkdir /home/dev/.nvm && \
  http -b get $nvm_url | bash && \
  source /home/dev/.nvm/nvm.sh && \
  nvm install v10.15.3
}
