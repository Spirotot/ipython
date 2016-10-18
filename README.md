# Eye of Jupyter (Angr + PyPy + IPython Notebook/Jupyter in a Sandstorm package)

Background is here: https://blog.spirotot.com/2016/09/22/eye-of-jupyter/

Signed Sandstorm SPK [here](https://owncloud.spirotot.com/index.php/s/RU0buxiKFqsZByg)(~200MB).

## Known Issues

* For large binaries/analyses, the PyPy kernel will timeout. Not sure if this is
  due to lack of RAM, PyPy limitations, or Jupyter. Need to do more
  testing/troubleshooting.

Original README is below.

# Sandstorm package for IPython Notebook

There is no source code in this top level directory, because we don't need
to make any modifications to the upstream app to get it to run in Sandstorm!

To get started:

```
$ vagrant-spk vm up
# wait a few minutes while all the packages are installed in the VM...

$ vagrant-spk dev
```
