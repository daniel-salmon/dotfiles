# This script prepares preferred configurations on Ubuntu 18.04 LTS
# After execution, the system should be rebooted

# First, obtain external dependencies

# Get background image
# Lake Brienz, Switzerland
# Photo by Andreas Gücklhorn on Unsplash
wget -O ~/Pictures/background.jpg https://unsplash.com/photos/mawU2PoJWfU/download

# Install Qogir theme
cd ~/Downloads
git clone https://github.com/vinceliuice/Qogir-theme.git
cd Qogir-theme
./install.sh --theme ubuntu --color dark --win square
cd ..
rm -rf Qogir-theme

# Create src directory under which I like to keep repos
mkdir -p ~/src/github.com/daniel-salmon

# Create personal bin / scripts folder
mkdir -p ~/bin

# Clone my repo containing all configurations
cd ~/src/github.com/daniel-salmon
git clone https://github.com/daniel-salmon/home.git

# vimrc
cp .vimrc ~/.vimrc

# Copy personal bin to ~/bin
cp bin/* ~/bin

# Load my custom dconf profile
cat dconf.txt | dconf load /

# bashrc
cat .bashrc | tee -a ~/.bashrc
source ~/.bashrc

# Remove Ubuntu dock
sudo rm -rf /usr/share/gnome-shell/extensions/ubuntu-dock@ubuntu.com

# Git configurations
git config --global user.email me@daniel-salmon.com
git config --global user.name daniel-salmon
git config --global core.editor "vim"

# Docker
mkdir ~/docker

# Postgres docker-compose.yml
mkdir -p ~/docker/postgres
curl https://gist.githubusercontent.com/daniel-salmon/73ce6defa395031dcff87d520a0bcbcf/raw/5a5508bc728f2eb3a33c3b9a22f95b9d7da38076/docker-compose.yml > ~/docker/postgres/docker-compose.yml

# Elasticsearch + Kibana docker-compose.yml
mkdir -p ~/docker/elasticsearch
curl https://gist.githubusercontent.com/daniel-salmon/6703e160676e4b904230cf9ebfc05826/raw/6ecf18710483afb4b75ec438578022086b5936f7/docker-compose.yml > ~/docker/elasticsearch/docker-compose.yml

# Postgres password file
# See https://www.postgresql.org/docs/current/libpq-pgpass.html
touch ~/.pgpass
chmod 0600 ~/.pgpass
