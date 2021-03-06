## Background
  * pyenv allows you to install multiple versions of the python interpeter.
  * pyenv-virtualenv allows you to install multiple independent sets of python modules.
  * A named pairing of an interpreter version and a module set is called a 'python environment'.
  * You can create multiple (completely) independent python environments on one system.
  * These python environments can be enabled/disabled manually or automatically.
  * These python environments are user-specific, and don't affect the system's default python install.
  * This is great for development sandboxes or accommodating python code with weird/broken dependencies.
  * Don't jack up your system - use python environments instead!
  * https://github.com/pyenv/pyenv
  * https://github.com/pyenv/pyenv-virtualenv

## Installation
### OSX:
  brew update
  brew install pyenv pyenv-virtualenv
  echo 'eval "$(pyenv init -)"' >> ~/.profile
  echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.profile

## Using pyenv

  - Install a python version:
    $ pyenv install 2.7.10

  - List all installed python versions: ('system' is the non-pyenv version provided by the os)
    $ pyenv list

  - Use a particular python version:
    $ pyenv local  <version>  # use the specified version until you leave the current dir
    $ pyenv shell  <version>  # use the specified version until you exit your shell
    $ pyenv global <version>  # make the specified version your default version

Using pyenv-virtualenv:

  - Create a new environment: (the python version must already be installed)
    $ pyenv virtualenv 2.7.10 my-virtual-env-name

  - List all existing environments:
    $ pyenv virtualenvs

  - Manually enable/disable an environment:
    $ pyenv activate my-virtual-env-name
    $ pyenv deactivate

  - Automatically enable/disable an environment when you enter/leave a particular directory tree:
    echo 'my-virtual-env-name' > .python-version
    (run the above in the root of the directory tree)

  - Delete an environment:
    $ pyenv uninstall my-virtual-env-name

Ansible Setup:

    $ pyenv install 2.7.10                      # install the python version, not necessary if already installed
    $ pyenv virtualenv 2.7.10 ansible           # create an app-specific virtualenv named 'ansible'
    $ mkdir ansible                             # create a dir for the ansible repo (or git clone it)
    $ echo 'ansible' > ansible/.python-version  # auto-enable the 'ansible' virtualenv when you enter the ansible repo
    $ cd ansible                                # enter the ansible repo dir, auto-enabling the 'ansible' virtualenv
    $ pip install ansible                       # install ansible, into the 'ansible' virtualenv
    $ ansible --version                         # see that ansible is installed and available
    $ cd ..                                     # leave the ansible repo dir, auto-disabling the 'ansible' virtualenv
    $ ansible --version                         # see that ansible is no longer available
