# OurTube
A self-hosting streaming website including video streaming and live streaming.

# Development Progress
The prototype of this project is completed and being tested heavily now. 

[You can check out the progress here!](https://github.com/users/KnugiHK/projects/3)

# Feature
1. Re-encode video as HLS supported format by using GPU acceleration
2. Keep the video quality

# Deployment
## Installation Script
Download the installation script and execute it
```shell
wget -O - <script url (todo)> | bash
```

## DIY
### First, clone this repo.
```shell
git clone https://github.com/KnugiHK/video-streaming.git
cd video-streaming
```
### Then, install dependecies:
```shell
sudo apt-get install python3 python3-pip python-dev default-libmysqlclient-dev mediainfo ffmpeg #Debian / Ubuntu
sudo yum install python-devel mysql-devel mediainfo ffmpeg # Red Hat / CentOS
brew install mysql-client mediainfo ffmpeg # macOS (Homebrew)
```
```shell
pip3 install -r requirements.txt
```
### Install Mariadb or MySQL now if you don't have it on the deployment environment
```sheel
sudo apt-get install mysql-server
```
### Import database structure as well as create and grant a user 
```shell
sudo mysql < database.sql
CREATE USER 'stream'@'localhost' IDENTIFIED BY '<password>';
GRANT EXECUTE, SELECT, SHOW VIEW, ALTER, ALTER ROUTINE, CREATE, CREATE ROUTINE, CREATE TEMPORARY TABLES, CREATE VIEW, DELETE, DROP, EVENT, INDEX, INSERT, REFERENCES, TRIGGER, UPDATE, LOCK TABLES  ON `stream`.* TO 'stream'@'localhost' WITH GRANT OPTION;
```

### Copy or rename config-sample.json to config.json and edit config.json
```shell
cp config-sample.json config.json
nano config.json #or
vi config.json
```
**If your mediainfo and ffmpeg are installed from package manager set config keys "ffmpeg_path", "ffprobe_path", "mediainfo_path" to "ffmpeg", "ffprobe" and "mediainfo" respectively**

### Now, run the app for debugging (if you want to deploy this app in production level, please skip this part)
```shell
export FLASK_APP=app.py
python3 -m flask run # if you install flask from pip
flask run # if you install flask from apt/yum
python3 app.py # if error occurred
```
## Deploy in production level
This repo embedded a WSGI file, you can use it in a reverse proxy server

### Install required packages
```shell
sudo apt install nginx
pip3 install uwsgi
```

### Setting video-streaming.nginx 
1. Replace all placeholders in "video-streaming.nginx" and "video-streaming.services"
2. Copy the file to nginx and create symlink
```shell
sudo cp video-streaming.nginx /etc/nginx/site-available/video-streaming
sudo ln -s /etc/nginx/site-available/video-streaming /etc/nginx/site-enable/video-streaming
```
3. Copy service file to systemd and enable the service
```shell
sudo cp video-streaming.service /etc/systemd/system/
sudo systemctl enable video-streaming
sudo systemctl start video-streaming
```


