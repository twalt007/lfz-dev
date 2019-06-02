# Uninstalling the Environment

Below are steps for uninstalling or reinstalling the development environment.

## MacOS

When the development environment is first installed on macOS, two commands are added to the command line along with `lfz-dev`. **Note**: these commands are run from _outside_ of the development environment.

- `lfz-dev-stop`
  - Stops the Docker container that holds the development environment. Any ports that the development environment was bound to (_i.e._ `80`, `3000`, `3001`) will be freed.
- `lfz-dev-uninstall`
  - Stops the Docker container that holds the development environment.
  - The Docker container and image are deleted from the host machine.
  - All MySQL data and configuration is erased at this point. Any content that was added to `/home/dev/lfz` or `/home/dev/Desktop` is left alone as these directories exist on the host machine and were merely linked to the environment.
  - The `lfz-dev`, `lfz-dev-stop`, and `lfz-dev-uninstall` commands are removed from the host machine's command line.

### Reinstalling

After uninstalling the development environment, the installation process will need to be re-run from the ["Setting Up the Environment"](https://github.com/Learning-Fuze/lfz-dev/blob/master/MAC_INSTRUCTIONS.md#setting-up-the-environment) step.

## Windows 10

The development environment for Windows 10 is completely contained within the Ubuntu 18.04 application.

Ubuntu 18.04 can be uninstalled like any other Windows 10 application. It may take a few minutes, but effectively this deletes the environment.

All MySQL data and configuration is erased at this point. Any content that was added to `/home/dev/lfz` or `/home/dev/Desktop` is left alone as these directories exist on the host machine and were merely linked to the environment.

### Reinstalling

After uninstalling the development environment, the installation process will need to be re-run from the ["Installing Ubuntu 18.04"](https://github.com/Learning-Fuze/lfz-dev/blob/master/WINDOWS_INSTRUCTIONS.md#installing-ubuntu-1804) step.
