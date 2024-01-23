# Google Wallet Codelab

This project contains sample code used for the [Google Wallet Codelab](https://codelabs.developers.google.com/save-to-wallet-web).

# OVH instance script

## Configuration

```bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install tmux -y
sudo apt-get install git -y
sudo apt-get install snap -y
sudo snap install node --classic
ssh-keygen -t rsa -b 4096
```

## Check instance accessibility from web

```bash
ip -c a # get the ip of the instance
python3 -m http.server 8080 --bind $ip_of_instance
```

## Run

```bash
GOOGLE_APPLICATION_CREDENTIALS="/home/ubuntu/wallet-web-codelab/api/lvmh-project-411911-3fa1b9e130a9.json" node ./app.js
```
