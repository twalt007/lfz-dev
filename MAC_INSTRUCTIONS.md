# MacOS Instructions

## Installation

1. Get [Docker for Mac](https://docs.docker.com/v17.12/docker-for-mac/install/) by choosing the **"stable channel"** download.
2. Install Docker by opening the `.dmg` file you just downloaded and dragging Docker to your Applications.
3. Open your Applications folder in Finder and open the Docker application.
4. If prompted, continue opening Docker and provide the password you use to log into your Mac.
5. The status bar at the top-right of your screen should have a Docker whale icon in it now.
![Docker in status bar](__env__/macos/docker-in-status-bar.png)
6. Click on the Docker whale icon to check that "**Docker Desktop is running**".
7. Then click "**Preferences...**" and ensure that "**Start Docker Desktop when you log in**" is _checked_.
8. Ensure that there is a folder on your Desktop named `lfz`.
9. Ensure that you have downloaded the files in this repository to a folder on your Desktop named `student-dev-env`.
10. Right-click or Control-click the file `student-dev-env/__env__/macos/install.command` and choose **"Open With > Terminal"**.

**NOTE**: If you receive a permissions error, paste the following command into a Terminal window and press `Enter`. Then try step 10 again.

```shell
chmod +x /Users/$(whoami)/Desktop/student-dev-env/__env__/macos/*.command
```
11. The installation process will open a Terminal window and prepare the development environment. It will close when complete.

## Entering and exiting the Environment

1. Open a new Terminal window. Type `lfz-dev` and press enter. Your prompt should change.
2. Type `whoami` and press `Enter`. The output should be `dev`.
3. Type `ls -a` and press `Enter`. The output should include `lfz`.
4. Type `exit` and press `Enter` to exit the development environment and return to your normal Terminal session.
5. To return to the development environment, type `lfz-dev` and press `Enter`.

## Verifying your Environment

1. Enter the development environment and run the following commands. You should see an HTML document that includes a success message.
```shell
sudo service apache2 start
sudo service mysql start
http localhost
```
2. Open your web browser and go to `http://localhost/index.php`. You should see the same HTML document, but presented to you as a web page.
3. Open a new tab in your web browser and go to `http://localhost/phpmyadmin` and log in with the username `root` and the password `root`.

## Managing Apache and MySQL Services

The Apache Web Server and MySQL Database Server are not started by default. The following commands can be used to start and stop them.

```shell
# to check if Apache is started
sudo service apache2 status

# to start Apache
sudo service apache2 start

# to stop Apache
sudo service apache2 stop

# to check if MySQL is started
sudo service mysql status

# to start MySQL
sudo service mysql start

# to stop MySQL
sudo service mysql stop
```
