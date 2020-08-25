# Sane default build variables
export CFLAGS="-march=native -mtune=native -O3 -fno-math-errno -pipe"
export CXXFLAGS="$CFLAGS"
export MAKEFLAGS=-j4
export LDFLAGS=" "

# Sane default environment variables
export ENV=$HOME/.shrc
export PATH=/usr/lib/ccache/bin:$HOME/.local/bin:/usr/bin
export KISS_PATH=$KISS_PATH:$HOME/git/community/community
export KISS_PATH=$HOME/git/KISS-me/KISS-me:$KISS_PATH
export KISS_HOOK=$HOME/git/KISS-me/hooks
export KISS_TMPDIR=/tmp
export KISS_COMPRESS=xz
export PASH_KEYID=dilyn.corner@tutanota.com
export PASH_DIR=$HOME/git/pass-store
export PASH_CLIP="xsel -b"
export PASH_LENGTH=25
export PASH_TIMEOUT=60
export PF_INFO="ascii title os host kernel uptime pkgs memory palette"

# Sane default programs
export EDITOR=vim
export VISUAL=$EDITOR
export TERMINAL=st
