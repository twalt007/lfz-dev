# MacOS Instructions

1. Get [Docker for Mac](https://docs.docker.com/v17.12/docker-for-mac/install/) by choosing the **"stable channel"** download.
2. Install Docker by opening the `.dmg` file you just downloaded and dragging Docker to your Applications.
3. Open your Applications folder in Finder and open the Docker application.
4. If prompted, continue opening Docker and provide the password you use to log into your Mac.
5. The menu bar on your screen should have a Docker whale icon in it now.
6. Click on the Docker whale icon to check that **"Docker Desktop is running"**.
7. Then click **"Preferences..."** and ensure that "**Start Docker Desktop when you log in"** is _checked_.
8. Ensure that there is a folder on your Desktop named `lfz`.
9. Ensure that you have downloaded the files in this repository to a folder on your Desktop named `student-dev-env`.
10. Right-click or Control-click the file `student-dev-env/__env__/macos/install.command` and choose **"Open With > Terminal"**.
**NOTE**: If you receive a permissions error, paste the following command into a Terminal window and press `Enter`. Then try step 10 again.

```shell
chmod +x /Users/$(whoami)/Desktop/student-dev-env/__env__/macos/*.command
```
11. The installation process will open a Terminal window and prepare the development environment. It will close when complete.
12. Open a new Terminal window. Type `lfz-dev` and press enter. Your prompt should change and the `whoami` command should output `dev`.
13. Type `exit` and press enter to exit the development environment and return to your current Terminal session.
