# student-dev-env
Student development environment setup instructions.

## Motivation

This repository contains installation and setup procedures for a setting up a development environment on MacOS or Windows. Its purpose is to provide a consistent set of tools to students irrespective of the platform their laptop is running.

## What's Inside

- Ubuntu Linux 18.04
  - Git Version Control System
  - Apache Web Server
  - PHP 7.2
  - MySQL 5.7 Database Server
  - phpMyAdmin Web Admin for MySQL
  - Node.js
  - HTTPie Command Line HTTP Client
  - SSH Client
- Preconfigured Cmder Console Emulator (Windows)

## System Requirements

**Note:** Students with less than 10 GB of free disk space should move their media files to their personal external hard drive or another home computer. Additional space can be freed by uninstalling applications not specific to their work, studies, or LearningFuze instruction.

### MacOS

Students using MacOS will be running their environment using [Docker for Mac](https://docs.docker.com/v17.12/docker-for-mac/install/). Information about a student's computer can be found by opening the apple () menu and clicking "About This Mac".

- **MacOS 10.12 Sierra** or later
- 8 GB RAM
- 10 GB free disk space

### Windows

Students using Windows will be running their environment in [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/faq). Windows 10 64-bit is _required_ for this development environment. Information about a student's computer can be found by opening the **System Information** application.

- **Windows 10** - 64-bit Home or Pro
- 8 GB RAM
- 10 GB free disk space

## Getting Ready

Both sets of setup instructions assume that students have a folder on their Desktop named **`lfz`** to hold their LearningFuze code repositories. Before beginning, ensure that this folder is present.

The files and folders in this repository should be downloaded to the student's Desktop to a directory named **`student-dev-env`**.

[Continue to MacOS Installation](MAC_INSTRUCTIONS.md)

[Continue to Windows 10 Installation](WINDOWS_INSTRUCTIONS.md)
