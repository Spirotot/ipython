#!/bin/bash
set -euo pipefail
set +x

export HOME=/var/home

JUPYTER_CUSTOM=$HOME/.jupyter/custom

mkdir -p $HOME

if [ ! -f $JUPYTER_CUSTOM/custom.js ]; then
    mkdir -p $JUPYTER_CUSTOM
    ln -s /custom.js $JUPYTER_CUSTOM/custom.js
fi

# Migrate from the old directory structure.
if [ -f /var/Sandstorm.ipynb ]; then
    mv /var/Sandstorm.ipynb $HOME/Sandstorm.ipynb
fi

jupyter notebook --port=8888 --notebook-dir=$HOME
