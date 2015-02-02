#!/bin/sh
export HOME=/var
cd /var

if [ ! -f /var/Sandstorm.ipynb ]; then
    cp /Sandstorm.ipynb /var/Sandstorm.ipynb
    mkdir -p /var/.ipython/nbextensions
fi

test -e /var/.ipython/nbextensions/mathjax || ln -s /mathjax /var/.ipython/nbextensions

/opt/virtualenv/notebook-environment2/bin/ipython notebook --pylab=inline
