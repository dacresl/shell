#!/bin/bash
set -x

############################################
# DSI CONSULTING INC. Project setup script #
############################################
# This script creates standard analysis and output directories
# for a new project. It also creates a README file with the
# project name and a brief description of the project.
# Then it unzips the raw data provided by the client.

if [ -d newproject ]; then
  echo "Directory 'newproject' already exists. Please remove it before running this script."
  exit 1
fi
mkdir newproject
cd newproject

mkdir analysis output
touch README.md
touch analysis/main.py

# download client data
curl -Lo rawdata.zip https://github.com/UofT-DSI/shell/raw/refs/heads/main/02_activities/assignments/rawdata.zip
unzip -q rawdata.zip

###########################################
# Complete assignment here

# 1. Create a directory named data
$ mkdir data
# 2. Move the ./rawdata directory to ./data/raw
mv OneDrive/Desktop/'School Apps'/'Shell assignment 1'/rawdata.zip /c/Users/werne/data/rawdata
# 3. List the contents of the ./data/raw directory
ls /c/Users/werne/data/raw
# 4. In ./data/processed, create the following directories: server_logs, user_logs, and event_logs
mkdir /c/Users/werne/data/processed/
mkdir /c/Users/werne/data/processed/{server_logs,user_logs,event_logs}
# 5. Copy all server log files (files with "server" in the name AND a .log extension) from ./data/raw to ./data/processed/server_logs
$ find  /c/Users/werne/data/raw -type f -name '*server*.log' -exec cp {}  /c/Users/werne/data/processed/server_logs/ \;
# 6. Repeat the above step for user logs and event logs
$ find  /c/Users/werne/data/raw -type f -name '*user*.log' -exec cp {}  /c/Users/werne/data/processed/user_logs/ \;
$ find  /c/Users/werne/data/raw -type f -name '*event*.log' -exec cp {}  /c/Users/werne/data/processed/event_logs/ \;
# 7. For user privacy, remove all files containing IP addresses (files with "ipaddr" in the filename) from ./data/raw and ./data/processed/user_logs
$ find /c/Users/werne/data/raw/ -type f -name '*ipaddr' -exec rm {} \;
$ find /c/Users/werne/data/processed/user_logs/ -type f -name '*ipaddr' -exec rm {} \;
# 8. Create a file named ./data/inventory.txt that lists all the files in the subfolders of ./data/processed
 touch /c/Users/werne/data/inventory.txt
 $ find /c/Users/werne/data/processed -type f > /c/Users/werne/data/inventory.txt
###########################################

echo "Project setup is complete!"




git add assignment.sh
git commit
git status                   # check that your working directory is clean (all changes committed)
git push origin assignment   # push your changes
