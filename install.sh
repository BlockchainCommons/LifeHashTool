#!zsh

set -e

swift build -c release
# Link the file here as actually copying it would require code signing
sudo ln -sf $PWD/.build/release/LifeHashTool /usr/local/bin/lifehash

echo "LifeHashTool has been installed as: " `which lifehash`
