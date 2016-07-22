#!/bin/bash

# When you change this file, you must take manual action. Read this doc:
# - https://docs.sandstorm.io/en/latest/vagrant-spk/customizing/#setupsh

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
apt-get update

apt-get install -y build-essential autoconf libtool pkg-config git
# Install capnproto from source, since Sandstorm currently depends on unreleased capnproto features.
if [ ! -e /usr/local/bin/capnp ]; then
    [ -d capnproto ] || git clone https://github.com/sandstorm-io/capnproto
    pushd capnproto/c++
    autoreconf -i && ./configure && make -j2 && sudo make install
    popd
fi

apt-get install -y python2.7 python-pip libzmq3-dev libpython-dev
apt-get install -y libopencv-dev python-opencv python-numpy python-scipy python-scikits-learn python-matplotlib
apt-get install -y python3 python3-dev python3-pip
apt-get install -y python3-numpy python3-scipy python3-matplotlib

pip install cython
pip install ipython jupyter pandas pycapnp beautifulsoup4

pip3 install cython
pip3 install ipython ipykernel pandas pycapnp beautifulsoup4
python3 -m ipykernel install

exit 0
