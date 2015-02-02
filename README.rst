===========================================
 IPython: Productive Interactive Computing
===========================================

Sandstorm specific notes
========================

To build the spk, you will have to do the following:

- Create a virtualenv with a root of `/opt/virtualenv/notebook-environment2`::

   $ mkdir -p /opt/virtualenv
   $ cd /opt/virtualenv
   $ virtualenv notebook-environment

- Activate the virtualenv and install the sandstorm port of ipython::

   $ source /opt/virtualenv/notebook-environment2/bin/activate
   $ pip install https://github.com/jparyani/ipython/archive/sandstorm-2.zip

- Install any other python packages you want

- Run `spk pack ipython.spk` from this repository. If you get errors like "No file found to satisfy requirement", you may have to delete `sandstorm-files.list` and run `spk dev` yourself. See https://github.com/sandstorm-io/sandstorm/wiki/Porting-Guide#test-your-app-in-dev-mode for how `spk dev` works. Don't worry about importing all your python packages, unless they have dependencies on native libraries (ie. like in the case of python's lxml library links to libxml).

Overview
========

Welcome to IPython.  Our full documentation is available on `our website
<http://ipython.org/documentation.html>`_; if you downloaded a built source
distribution the ``docs/source`` directory contains the plaintext version of
these manuals.  If you have Sphinx installed, you can build them by typing
``cd docs; make html`` for local browsing.


Dependencies and supported Python versions
==========================================

For full details, see the installation section of the manual.  The basic parts
of IPython only need the Python standard library, but much of its more advanced
functionality requires extra packages.

Officially, IPython requires Python version 2.7, or 3.3 and above.
IPython 1.x is the last IPython version to support Python 2.6 and 3.2.


Instant running
===============

You can run IPython from this directory without even installing it system-wide
by typing at the terminal::

   $ python -m IPython


Development installation
========================

If you want to hack on certain parts, e.g. the IPython notebook, in a clean
environment (such as a virtualenv) you can use ``pip`` to grab the necessary
dependencies quickly::

   $ git clone --recursive https://github.com/ipython/ipython.git
   $ cd ipython
   $ pip install -e ".[notebook]"

This installs the necessary packages and symlinks IPython into your current
environment so that you can work on your local repo copy and run it from anywhere::

   $ ipython notebook

The same process applies for other parts, such as the qtconsole (the
``extras_require`` attribute in the setup.py file lists all the possibilities).

Git Hooks and Submodules
************************

IPython now uses git submodules to ship its javascript dependencies.
If you run IPython from git master, you may need to update submodules once in a while with::

    $ git submodule update

or::

    $ python setup.py submodule

We have some git hooks for helping keep your submodules always in sync,
see our ``git-hooks`` directory for more info.
