# Windows Instructions

This guide provides instructions for setting up your PC for development. Please note that although many parts of the instructions include helpful images an animations, the instructions **must** be read and followed step-by-step to ensure correct setup.

## Double-checking System Requirements

- **Windows 10** - 64-bit Home or Pro
- 8 GB RAM
- 10 GB free disk space

Information about your computer can be found by:
  1. Opening the **Control Panel** app
  2. Clicking on **System and Security**
  3. Then clicking on **System**

![System Information](__env__/windows/screenshots/system-information.gif)

To check your available disk space, open **File Explorer** and click on **This PC**.

**Note:** If you have less than 10 GB of available disk space, you can move your media files to a personal external hard drive or another home computer. Additional space can be freed by uninstalling applications not needed for your work, studies, or LearningFuze instruction.

![This PC](__env__/windows/screenshots/this-pc.gif)

---

## Enabling Windows Subsytem for Linux

1. Open the Control Panel app.
2. Click on **Programs**.
3. Under **Programs and Features** click **"Turn Windows features on or off"**.
4. In a few moments, a list of checkboxes will appear.<br/>
   Be sure that **Windows Subsystem for Linux** is _checked_.
5. A system restart is _required_ to continue. Restart your computer now.

![Enable WSL](__env__/windows/screenshots/enable-wsl.gif)

---

## Installing Ubuntu 18.04

1. Open the Windows Store app.
2. Search for Ubuntu and Choose **Ubuntu 18.04 LTS**.
3. On the **Ubuntu 18.04** app page click the **Get** or **Install** button.
4. If you are prompted to sign in, you can just close the sign in window.
5. When Ubuntu is finished installing click the **Launch** button.
6. Ubuntu will finish installing when you launch it.

![Install Ubuntu](__env__/windows/screenshots/install-ubuntu.gif)

---

## Creating a User Account in Ubuntu

1. When Ubuntu is ready, it will prompt you to **Enter new UNIX username**.
2. Type `dev` and press `Enter`.
3. You will then be asked to choose a password. **Note:** When you type this password, there will be no visual indication that anything is happening. This is normal.<br/> Type `lfz` and press `Enter`.
4. To confirm, type `lfz` again and press `Enter`.
5. Close **Ubuntu**.

![Ubuntu User](__env__/windows/screenshots/ubuntu-user.gif)

---

## Getting the Environment Installer

1. Download the installation files <a href="https://github.com/Learning-Fuze/lfz-dev/archive/master.zip" target="_blank">here</a>.
2. Open the downloaded `lfz-dev-master.zip`
    - Open the `lfz-dev-master` folder inside.
    - Drag the `lfz-dev-master` folder inside _there_ to your Desktop.
    - Rename the `lfz-dev-master` folder on your Desktop to simply `lfz-dev`.

![Download Installer](__env__/windows/screenshots/download-installer.gif)

---

## Setting Up Cmder

1. Open the `lfz-dev` folder on your Desktop.
2. Open the `__env__` folder within.
3. Open `cmder.zip` and drag the folder inside to your Desktop.
4. Open the `cmder` folder on your Desktop and pin **Cmder** to your Taskbar.

![Unzip Cmder](__env__/windows/screenshots/unzip-cmder.gif)

---

## Setting Up the Environment

1. Open **Cmder** and copy in the following command. You can right-click the Cmder prompt to paste it in. Then press `Enter`.
    ```bash
    sudo bash $(echo $(wslpath $(cmd.exe /C "echo %USERPROFILE%\Desktop\lfz-dev\__env__\windows\install.bash")) | tr -d '\r')
    ```
2. If you are prompted for a password, then type `lfz` and press `Enter`. **Note:** When you type this password, there will be no visual indication that anything is happening. This is normal.
3. Good job! You can take a break, 'cause this may take a while!
4. Once installation is complete, close **Cmder**.

![Running the Windows installer](__env__/windows/screenshots/run-windows-installer.gif)

---

## Testing Your Environment
