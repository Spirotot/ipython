#!/bin/bash

# When you change this file, you must take manual action. Read this doc:
# - https://docs.sandstorm.io/en/latest/vagrant-spk/customizing/#setupsh

set -euo pipefail
# This is the ideal place to do things like:
#

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y python2.7 python-pip libzmq3-dev libpython-dev
apt-get install -y libopencv-dev python-opencv

pip install ipython jupyter matplotlib pandas pycapnp beautifulsoup4

exit 0
